import 'package:flutter/material.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/repositories/i_user_facad.dart';
import 'package:mpos_beat/domain/request/attendance_params.dart';
import 'package:mpos_beat/domain/request/checkin_params.dart';
import 'package:mpos_beat/domain/request/checkout_params.dart';
import 'package:mpos_beat/domain/request/party_MasterSync_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  final IUserFacad iUserFacad;
  UserProvider(this.iUserFacad);
  static const _kDayStarted = 'day_started';
  static const _kRouteStarted = 'route_started';
  static const _kLastRouteName = 'last_route_name';

  bool _dayStarted = false;
  bool _routeStarted = false;
  String? _routeName;

  bool get dayStarted => _dayStarted;
  bool get routeStarted => _routeStarted;
  String? get routeName => _routeName;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isMarkingAttendance = false;
  bool _isAttendanceMarked = false;
  bool get isAttendanceMarked => _isAttendanceMarked;
  PartyMasterSyncModel? _partmastersync;
  PartyMasterSyncModel? get partymastersync => _partmastersync;
  resetAttendance() {
    _isAttendanceMarked = !_isAttendanceMarked;
  }

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  DefaultResponse? _attendanceResponse;
  DefaultResponse? get attendanceResponse => _attendanceResponse;

  /// ---------------- LOAD PERSISTED STATE ----------------
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    _dayStarted = prefs.getBool(_kDayStarted) ?? false;
    _routeStarted = prefs.getBool(_kRouteStarted) ?? false;
    _routeName = prefs.getString(_kLastRouteName);

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

  Future<DefaultResponse?> markAttendance({
    required BuildContext context,
    required double lattitude,
    required double longitude,
    required double accuracy,
    required String address,
    required AttendanceMark attendanceType,
  }) async {
    if (_isMarkingAttendance) return null;
    _isMarkingAttendance = true;

    setLoading(true);

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
        _attendanceResponse = response;
      },
    );
    resetAttendance();
    print("MARKING :: $isAttendanceMarked");
    setLoading(false);
    _isMarkingAttendance = false;
    notifyListeners();

    return _attendanceResponse;
  }

  int? _companyId;

  int? get companyId => _companyId;

  void setCompanyId(int id) {
    _companyId = id;
    notifyListeners();
  }

  //========================== Party Master Sync====================================
  Future<PartyMasterSyncModel?> partyMasterSync() async {
    setLoading(true);
    final result = await iUserFacad.partyMasterSync(
      BaseParams(
        data: PartyMasterSyncParams(
          companyId: _companyId!,
          pageNumber: 1,
          lastSyncDateTime: DateTime.parse("2026-01-05T10:30:00"),
        ),
      ),
    );

    result.fold(
      (failure) {
        Logger.logError("Party Master Sync failed: ${failure.errorMsg}");
      },
      (response) async {
        _partmastersync = response;
        Logger.logSuccess(
          "Party Master Sync successful : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    return _partmastersync;
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  DefaultResponse? _checkinresponse;
  DefaultResponse? get checkinResponse => _checkinresponse;
  DefaultResponse? _checkoutresponse;
  DefaultResponse? get checkoutResponse => _checkoutresponse;
  // ===========================check in============================

  Future<DefaultResponse?> checkIn(
    BuildContext context, {
    required CheckinParams params,
  //  VoidCallback? onSuccess,
  }) async {
    setLoading(true);
    final result = await iUserFacad.checkin(BaseParams(data: params));
    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Checkin failed : $_errorMessage");
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Checkin  success : ${response.toJson()}");
        Logger.logSuccess("status :${response.status}");
        setLoading(false);
        notifyListeners();

        if (response.status == 1) {
          _checkinresponse = response;
         // onSuccess?.call();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                response.message ?? "",
                textAlign: TextAlign.center,
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        }
      },
    );
    return _checkinresponse;
  }

  //============================check out========================================
  Future<DefaultResponse?> checkOut(
    BuildContext context, {
    required CheckoutParams params,
    VoidCallback? onSuccess,
  }) async {
    setLoading(true);
    final result = await iUserFacad.checkout(BaseParams(data: params));
    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Checkout failed : $_errorMessage");
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Checkout  success : ${response.toJson()}");
        Logger.logSuccess("status :${response.status}");
        setLoading(false);
        notifyListeners();

        if (response.status == 1) {
          _checkoutresponse = response;
          onSuccess?.call();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                response.message ?? "",
                textAlign: TextAlign.center,
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        }
      },
    );
    return _checkoutresponse;
  }
}
