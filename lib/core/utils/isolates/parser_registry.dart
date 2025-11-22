import 'isolate_parser.dart';

class ParserRegistry {
  static final _parsers = <Type, IsolateParser>{};

  static void register<T>(IsolateParser<T> parser) {
    _parsers[T] = parser;
  }

  static IsolateParser<T> getParser<T>() {
    final parser = _parsers[T];

    if (parser == null) {
      throw Exception("Parser not registered for type: $T");
    }

    return parser as IsolateParser<T>;
  }
}
