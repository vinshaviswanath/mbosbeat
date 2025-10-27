import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/utils/logger.dart';

/// A wrapper class for events that includes metadata
class Event<T> {
  final String type;
  final T data;
  final DateTime timestamp;
  final String? error;
  final Map<String, dynamic>? metadata;

  Event({
    required this.type,
    required this.data,
    this.error,
    this.metadata,
  }) : timestamp = DateTime.now();

  @override
  String toString() => 'Event(type: $type, data: $data, timestamp: $timestamp)';
}

/// Central event manager for the application
@singleton
class EventManager {
  final Map<String, StreamController<dynamic>> _controllers = {};
  final Map<String, List<StreamSubscription>> _subscriptions = {};
  final Map<String, List<Function>> _errorHandlers = {};

  /// Register a new event type
  StreamController<Event<T>> getOrCreateController<T>(String eventName) {
    final existing = _controllers[eventName];
    if (existing != null) {
      try {
        return existing as StreamController<Event<T>>;
      } catch (_) {
        throw Exception('Type mismatch for event "$eventName"');
      }
    }

    final controller = StreamController<Event<T>>.broadcast();
    _controllers[eventName] = controller;
    _subscriptions[eventName] = [];
    _errorHandlers[eventName] = [];
    return controller;
  }

  /// Subscribe to an event
  StreamSubscription<Event<T>> subscribe<T>({
    required String eventName,
    required Function(Event<T>) handler,
    Function(dynamic)? onError,
  }) {
    final subscription = getOrCreateController<T>(eventName).stream.listen(
      (event) => _handleEvent(event, handler),
      onError: (error, stackTrace) {
        Logger.logError(
          'Event error in $eventName',
          // error: error,
          // stackTrace: stackTrace,
        );
        onError?.call(error);
      },
    );

    _subscriptions[eventName]!.add(subscription);
    return subscription;
  }

  Stream<Event<T>> on<T>(String eventName) {
    return getOrCreateController(eventName)
        .stream
        .where((e) => e.data is T)
        .cast<Event<T>>();
  }

  /// Emit an event
  void emit<T>({
    required String eventName,
    required T data,
    Map<String, dynamic>? metadata,
  }) {
    if (!_controllers.containsKey(eventName)) {
      getOrCreateController(eventName);
    }

    final event = Event<T>(
      type: eventName,
      data: data,
      metadata: metadata,
    );
    if (_controllers[eventName]?.isClosed ?? true) {
      Logger.logWarning(
          'Attempted to emit to a closed or unregistered controller: $eventName');
      return;
    }
    Logger.logInfo('Emitting event: $event');
    _controllers[eventName]!.add(event);
  }

  /// Handle event with error handling
  Future<void> _handleEvent<T>(Event event, Function(Event<T>) handler) async {
    try {
      if (event.data is! T) {
        Logger.logWarning(
            'Type mismatch: Expected <$T>, got ${event.data.runtimeType} for event ${event.type}');
        return;
      }

      await handler(event as Event<T>);
    } catch (e) {
      Logger.logError('Error handling event ${event.type}');
      for (final errorHandler in _errorHandlers[event.type] ?? []) {
        try {
          await errorHandler(e, event);
        } catch (handlerError) {
          Logger.logError('Error in error handler for ${event.type}');
        }
      }
    }
  }

  /// Add an error handler for a specific event type
  void addErrorHandler(String eventName, Function(dynamic, Event) handler) {
    if (!_errorHandlers.containsKey(eventName)) {
      _errorHandlers[eventName] = [];
    }
    _errorHandlers[eventName]!.add(handler);
  }

  /// Unsubscribe from an event
  void unsubscribe(String eventName, StreamSubscription subscription) {
    if (_subscriptions[eventName]?.contains(subscription) ?? false) {
      _subscriptions[eventName]?.remove(subscription);
      subscription.cancel();
    }
  }

  /// Dispose all subscriptions and controllers
  @disposeMethod
  void dispose() {
    for (final subscriptions in _subscriptions.values) {
      for (final subscription in subscriptions) {
        subscription.cancel();
      }
    }

    for (final controller in _controllers.values) {
      controller.close();
    }

    _controllers.clear();
    _subscriptions.clear();
    _errorHandlers.clear();
  }
}
