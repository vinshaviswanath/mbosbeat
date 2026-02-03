import 'package:drift/drift.dart';
import 'package:intl/intl.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/daos/price_lavel_dao/price_level_sync_dao.dart';
import 'package:mpos_beat/data/models/item_master_sync_model.dart';
import 'package:mpos_beat/data/models/item_price_details_model.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/data/models/party_details.dart';
import 'package:mpos_beat/data/models/price_level_model.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/data/models/skip_reason_response.dart';
import 'package:mpos_beat/domain/repositories/i_user_facad.dart';
import 'package:mpos_beat/domain/request/attendance_params.dart';
import 'package:mpos_beat/domain/request/checkin_params.dart';
import 'package:mpos_beat/domain/request/checkout_params.dart';
import 'package:mpos_beat/domain/request/item_master_quary_params.dart';
import 'package:mpos_beat/domain/request/party_MasterSync_params.dart';
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
  PartyMasterSyncModel? _partmastersync;
  PartyMasterSyncModel? get partymastersync => _partmastersync;

  int? _companyId;
  int? get companyId => _companyId;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  DefaultResponse? _checkinresponse;
  DefaultResponse? get checkinResponse => _checkinresponse;

  SkipReasonResponse? _skipReasonResponse;
  SkipReasonResponse? get skipReasonResponse => _skipReasonResponse;

  ItemMasterSyncModel? _itemMasterList;
  ItemMasterSyncModel? get itemMasterList => _itemMasterList;

  PriceLevelModel? _priceLevelList;
  PriceLevelModel? get priceLevelList => _priceLevelList;

  ItemPriceDetailsModel? _itemPriceDetailsList;
  ItemPriceDetailsModel? get itemPriceDetailsList => _itemPriceDetailsList;

  PriceLevelDetails? _selectedPriceLevel;
  PriceLevelDetails? get selectedPriceLevel => _selectedPriceLevel;

  int? get selectedPriceLevelId => _selectedPriceLevel?.id;
  bool get rateInclusive => _selectedPriceLevel?.rateInclusive ?? false;

  AppDb? _appDb;

  void attachDb(AppDb db) {
    _appDb = db;
  }

  PartyMasterDetails? _selectedParty;
  PartyMasterDetails? get selectedParty => _selectedParty;

  void setParty(PartyMasterDetails party) {
    _selectedParty = party;
    notifyListeners();
  }


  /// ---------------- GENERAL ----------------

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setCompanyId(int id) {
    _companyId = id;
    notifyListeners();
  }

  void resetAttendance() {
    _isAttendanceMarked = !_isAttendanceMarked;
    notifyListeners();
  }

  /// ---------------- LOAD ----------------
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _dayStarted = prefs.getBool(_kDayStarted) ?? false;
    _routeStarted = prefs.getBool(_kRouteStarted) ?? false;
    _routeName = prefs.getString(_kLastRouteName);
    _isAttendanceMarked = prefs.getBool(_kAttendanceStarted) ?? false;
    notifyListeners();
  }


bool _homeLoading = false;
bool get homeLoading => _homeLoading;

void setHomeLoading(bool value) {
  _homeLoading = value;
  notifyListeners();
}


  Future<void> loadRouteState() async {
    final prefs = await SharedPreferences.getInstance();
    _routeStarted = prefs.getBool(_kRouteStarted) ?? false;
    notifyListeners();
  }

  /// ---------------- DAY START / END ----------------
  Future<void> toggleDay() async {
    final prefs = await SharedPreferences.getInstance();
    _dayStarted = !_dayStarted;
    await prefs.setBool(_kDayStarted, _dayStarted);
    notifyListeners();
  }

  /// ---------------- ROUTE START / END ----------------
  Future<void> startRoute(String routeName) async {
    final prefs = await SharedPreferences.getInstance();
    _routeStarted = true;
    _routeName = routeName;
    await prefs.setBool(_kRouteStarted, true);
    await prefs.setString(_kLastRouteName, routeName);
    notifyListeners();
  }

  Future<void> endRoute() async {
    final prefs = await SharedPreferences.getInstance();
    _routeStarted = false;
    _routeName = null;
    await prefs.setBool(_kRouteStarted, false);
    await prefs.remove(_kLastRouteName);
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
        success = false;
      },
      (response) {
        _response = response;
        _isAttendanceMarked = attendanceType == AttendanceMark.start;
        sl<SharedPreferences>().setBool(
          _kAttendanceStarted,
          _isAttendanceMarked,
        );
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

  int? _currentTripId;
  int? get currentTripId => _currentTripId;

  /// ---------------- TRIP START ----------------
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

    result.fold((_) => success = false, (response) async {
      await setRouteStarted();
      _response = response;
      success = true;
      _currentTripId = response.id;
      final prefs = sl<SharedPreferences>();
      _routeStarted = true;
      await prefs.setBool(_kRouteStarted, true);
      await prefs.setInt('current_trip_id', response.id ?? 0);
    });

    _isStartingTrip = false;
    _isLoading = false;
    notifyListeners();
    return success;
  }

  Future<void> loadCurrentTrip() async {
    final prefs = sl<SharedPreferences>();
    _currentTripId = prefs.getInt('current_trip_id');
    notifyListeners();
  }

  /// ---------------- TRIP END ----------------
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

    result.fold((_) => success = false, (response) async {
      _response = response;
      success = true;
      await clearRouteStarted();

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('current_trip_id');
    });

    _isEndingTrip = false;
    _isLoading = false;
    notifyListeners();
    return success;
  }

  /// ---------------- PARTY MASTER SYNC ----------------
  Future<PartyMasterSyncModel?> partyMasterSync({int? companyId}) async {
    setLoading(true);
    final result = await iUserFacad.partyMasterSync(
      BaseParams(
        data: PartyMasterSyncParams(
          companyId: _companyId ?? 0,
          pageNumber: 1,
          lastSyncDateTime: DateTime.parse("2026-01-05T10:30:00"),
        ),
      ),
    );

    result.fold(
      (failure) =>
          Logger.logError("Party Master Sync failed: ${failure.errorMsg}"),
      (response) async {
        _partmastersync = response;
        Logger.logSuccess("Party Master Sync successful: ${response.toJson()}");
        notifyListeners();
      },
    );
    setLoading(false);
    return _partmastersync;
  }

  DefaultResponse? _checkoutresponse;
  DefaultResponse? get checkoutResponse => _checkoutresponse;
  // ===========================check in============================
  int? activeCheckinId;
  String? activeCheckinTime;
  int visitSequence = 0;

  /// ---------------- CHECK-IN ----------------
  Future<DefaultResponse?> checkIn({
    required CheckinParams params,
    //  VoidCallback? onSuccess,
  }) async {
    setLoading(true);
    final result = await iUserFacad.checkin(BaseParams(data: params));

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg;
        Logger.logError("Checkin failed: $_errorMessage");
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Checkin success: ${response.toJson()}");
        setLoading(false);
        notifyListeners();

        if (response.status == 1) {
          _checkinresponse = response;
          activeCheckinId = response.id;
          activeCheckinTime = DateFormat('HH:mm').format(DateTime.now());
          visitSequence++; // onSuccess?.call();
        } else {
          _errorMessage = response.message;
        }
      },
    );
    setLoading(false);

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
        notifyListeners();

        if (response.status == 1) {
          _checkoutresponse = response;
          activeCheckinId = null;
          activeCheckinTime = null;

          notifyListeners();
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
    setLoading(false);

    return _checkoutresponse;
  }

  //========================= Skip Reason =========================

  Future<SkipReasonResponse?> getSkipReasons(BuildContext context) async {
    setLoading(true);
    final result = await iUserFacad.skipReason();

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.errorMsg, textAlign: TextAlign.center),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        );
      },
      (response) async {
        _skipReasonResponse = response;

        // Logger.logSuccess(
        //   "Skip reason List fetch successfull : ${response.toJson()}",
        // );
        notifyListeners();
      },
    );
    return _skipReasonResponse;
  }

  Future<ItemMasterSyncModel?> getItemMaster(
    BuildContext context, {
    required ItemMasterQueryParams params,
  }) async {
    setLoading(true);
    final result = await iUserFacad.getItemMaster(BaseParams(data: params));

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.errorMsg, textAlign: TextAlign.center),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        );
      },
      (response) async {
        _itemMasterList = response;

        Logger.logSuccess(
          "Item Master List fetch successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    return _itemMasterList;
  }

  ///======================= Price Level ==========================

  Future<PriceLevelModel?> getPriceLevel(
    BuildContext context, {
    required int companyId,
  }) async {
    setLoading(true);
    final result = await iUserFacad.getPriceLevels(companyId);

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.errorMsg, textAlign: TextAlign.center),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        );
      },
      (response) async {
        _priceLevelList = response;

        Logger.logSuccess(
          "Item Master List fetch successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    return _priceLevelList;
  }

  /// Price Level Stram
  Stream<List<PriceLevelDetails>> priceLevelsStream({
    required int? partyPriceListId,
  }) {
    if (_appDb == null) return const Stream.empty();

    return _appDb!
        .watchPriceLevelsForParty(partyPriceListId)
        .map((dbList) {
      final apiList = dbList.map((db) => PriceLevelDetails(
            id: db.id,
            companyId: db.companyId ?? 0,
            priceLevel: db.priceLevel ?? "",
            rateInclusive: db.rateInclusive,
            isDefault: db.isDefault,
            active: db.active,
          )).toList();

      _autoSelectIfSingle(apiList);
      return apiList;
    });
  }

  /// ---------------- AUTO SELECT ----------------
  void _autoSelectIfSingle(List<PriceLevelDetails> list) {
    if (list.length == 1 && _selectedPriceLevel == null) {
      _selectedPriceLevel = list.first;
      notifyListeners();
    }
  }

  /// ---------------- MANUAL SELECTION ----------------
  void setSelectedPriceLevel(PriceLevelDetails level) {
    _selectedPriceLevel = level;
    notifyListeners();
  }

void selectPriceLevelById(int? id, List<PriceLevelDetails> list) {
  final level = list.where((e) => e.id == id).cast<PriceLevelDetails?>().firstOrNull;
  if (level != null) {
    setSelectedPriceLevel(level);
  } else {
    clearSelectedPriceLevel();
  }
}


  /// ---------------- PARTY CHANGE HANDLING ----------------
  void onPartyChanged() {
    clearSelectedPriceLevel();
  }

  /// ---------------- CLEAR ----------------
  void clearSelectedPriceLevel() {
    _selectedPriceLevel = null;
    notifyListeners();
  }

  ///======================= Item Price Details ==========================

  Future<ItemPriceDetailsModel?> getItemPriceDetails(
    BuildContext context, {
    required int companyId,
  }) async {
    setLoading(true);
    final result = await iUserFacad.getItempriceDetails(companyId);

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.errorMsg, textAlign: TextAlign.center),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        );
      },
      (response) async {
        _itemPriceDetailsList = response;

        Logger.logSuccess("Item Price Details List fetch successfull : ");
        notifyListeners();
      },
    );
    setLoading(false);
    return _itemPriceDetailsList;
  }

  Stream<PartyMasterDetails?> partyDetailsStream(int companyId, int ledgerId) {
    final query = '''
      SELECT *
      FROM party_master
      WHERE company_id = ? AND ledger_id = ?
      LIMIT 1
    ''';

    return _appDb!
        .customSelect(
          query,
          variables: [Variable(companyId), Variable(ledgerId)],
        )
        .watchSingleOrNull()
        .map((row) {
          if (row == null) return null;
          return PartyMasterDetails.fromJson(row.data);
        });
  }
}
