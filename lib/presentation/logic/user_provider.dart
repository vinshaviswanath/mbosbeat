import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/repositories/i_user_facad.dart';
import 'package:mpos_beat/domain/request/attendance_params.dart';
import 'package:mpos_beat/domain/request/trip_end_params.dart';
import 'package:mpos_beat/domain/request/trip_start_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  final IUserFacad iUserFacad;
  UserProvider(this.iUserFacad);

  static const _kDayStarted = 'day_started';
  static const _kRouteStarted = 'route_started';
  static const _kLastRouteName = 'last_route_name';
  static const _kAttendanceStarted = 'attendance_started';

  bool _dayStarted = false;
  bool _routeStarted = false;
  String? _routeName;

  bool get dayStarted => _dayStarted;
  bool get routeStarted => _routeStarted;
  String? get routeName => _routeName;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isStartingTrip = false;
  bool _isEndingTrip = false;

  bool _isMarkingAttendance = false;

  bool _isAttendanceMarked = false;
  bool get isAttendanceMarked => _isAttendanceMarked;

  DefaultResponse? _response;
  DefaultResponse? get response => _response;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _dayStarted = prefs.getBool(_kDayStarted) ?? false;
    _routeStarted = prefs.getBool(_kRouteStarted) ?? false;
    _routeName = prefs.getString(_kLastRouteName);
    _isAttendanceMarked = prefs.getBool(_kAttendanceStarted) ?? false;
    debugPrint("LOADED ROUTE NAME => $_routeName");
    notifyListeners();
  }

  /// ---------------- DAY START / END ----------------
  Future<void> toggleDay() async {
    final prefs = await SharedPreferences.getInstance();
    _dayStarted = !_dayStarted;
    await prefs.setBool(_kDayStarted, _dayStarted);
    notifyListeners();
  }

  /// ---------------- ROUTE START ----------------
  Future<void> startRoute(String routeName) async {
    final prefs = await SharedPreferences.getInstance();
    _routeStarted = true;
    _routeName = routeName;
    await prefs.setBool(_kRouteStarted, true);
    await prefs.setString(_kLastRouteName, routeName);
    notifyListeners();
  }

  /// ---------------- ROUTE END ----------------
  Future<void> endRoute() async {
    final prefs = await SharedPreferences.getInstance();
    _routeStarted = false;
    _routeName = null;
    await prefs.setBool(_kRouteStarted, false);
    await prefs.remove(_kLastRouteName);
    notifyListeners();
  }

  Future<void> loadRouteState() async {
    final prefs = await SharedPreferences.getInstance();
    _routeStarted = prefs.getBool(_kRouteStarted) ?? false;
    notifyListeners();
  }

  Future<void> setRouteStarted() async {
    final prefs = await SharedPreferences.getInstance();
    _routeStarted = true;
    await prefs.setBool(_kRouteStarted, true);
    notifyListeners();
  }

  Future<void> clearRouteStarted() async {
    final prefs = await SharedPreferences.getInstance();
    _routeStarted = false;
    await prefs.setBool(_kRouteStarted, false);
    notifyListeners();
  }

  /// ---------------- ATTENDANCE ----------------
  Future<bool> markAttendance({
    required BuildContext context,
    required double lattitude,
    required double longitude,
    required double accuracy,
    required String address,
    required AttendanceMark attendanceType,
  }) async {
    if (_isMarkingAttendance) return false;

    _isMarkingAttendance = true;
    _isLoading = true;
    notifyListeners();

    bool success = false;

    final result = await iUserFacad.markAttendance(
      BaseParams(
        data: AttendanceParams(
          lattitude: lattitude,
          longitude: longitude,
          accuracy: accuracy,
          address: address,
          attendanceType: attendanceType,
        ),
      ),
    );

    result.fold(
      (failure) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(failure.errorMsg)));
      },
      (response) {
        _response = response;
        _isAttendanceMarked = attendanceType == AttendanceMark.start;
        final prefs = sl<SharedPreferences>();
        prefs.setBool(_kAttendanceStarted, _isAttendanceMarked);
        success = true;
      },
    );

    _isMarkingAttendance = false;
    _isLoading = false;
    notifyListeners();
    return success;
  }

  Future<void> clearAttendance() async {
    final prefs = await SharedPreferences.getInstance();
    _isAttendanceMarked = false;
    await prefs.remove(_kAttendanceStarted);
    notifyListeners();
  }

  /// ---------------- Trip Start ----------------
  Future<bool> markTripStart({
    required DateTime date,
    required String startTime,
    required int routeID,
    required int godownID,
    required double latitude,
    required double longitude,
    required double accuracy,
    required String address,
  }) async {
    if (_isStartingTrip) return false;

    _isStartingTrip = true;
    _isLoading = true;
    notifyListeners();

    bool success = false;

    final result = await iUserFacad.markTripStart(
      BaseParams(
        data: TripStartParams(
          date: date,
          startTime: startTime,
          routeId: routeID,
          godownId: godownID,
          latitude: latitude,
          longitude: longitude,
          accuracy: accuracy,
          address: address,
        ),
      ),
    );

    result.fold(
      (failure) {
    success = false;
  },
      (response) async {
        await setRouteStarted();
        _response = response;
        success = true;

        final prefs = sl<SharedPreferences>();
        _routeStarted = true;
        await prefs.setBool(_kRouteStarted, true);

        await prefs.setInt('current_trip_id', response.id ?? 0);
      },
    );

    _isStartingTrip = false;
    _isLoading = false;
    notifyListeners();
    return success;
  }

  /// ---------------- Trip End ----------------

  Future<bool> markTripEnd({
  required int tripId,
  required int routeID,
  required int godownID,
  required double latitude,
  required double longitude,
  required double accuracy,
  required String address,
}) async {
  if (_isEndingTrip) return false;

  _isEndingTrip = true;
  _isLoading = true;
  notifyListeners();

  bool success = false;

  final result = await iUserFacad.markTripEnd(
    BaseParams(
      data: TripEndParams(
        tripId: tripId,
        endTime: DateTime.now(),
        routeId: routeID,
        godownId: godownID,
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracy,
        address: address,
      ),
    ),
  );

  result.fold(
    (failure) {
      success = false;
      // ❌ NO SnackBar here
    },
    (response) async {
      _response = response;
      success = true;

      await clearRouteStarted();

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('current_trip_id');
    },
  );

  _isEndingTrip = false;
  _isLoading = false;
  notifyListeners();
  return success;
}

}
