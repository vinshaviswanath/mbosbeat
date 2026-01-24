import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/data_sources/user/item_master_sync/item_master_sync.dart';
import 'package:mpos_beat/data/data_sources/user/item_price_details/get_item_price_details.dart';
import 'package:mpos_beat/data/data_sources/user/price_level/get_price_level.dart';
import 'package:mpos_beat/data/data_sources/user/skip_reason/skip_reason.dart';
import 'package:mpos_beat/data/data_sources/user_management/checkin_Checkout/checkin_datasource.dart';
import 'package:mpos_beat/data/data_sources/user_management/checkin_Checkout/checkout_datasource.dart';
import 'package:mpos_beat/data/data_sources/user/party_MasterSync/party_MasterSync.dart';
import 'package:mpos_beat/data/models/item_master_sync_model.dart';
import 'package:mpos_beat/data/models/item_price_details_model.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/data/data_sources/user/attendance_marking/attendanceMarking.dart';
import 'package:mpos_beat/data/data_sources/user/trip_end/trip_end.dart';
import 'package:mpos_beat/data/data_sources/user/trip_start/trip_start.dart';
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

@LazySingleton(as: IUserFacad)
class IUserFacadImp implements IUserFacad {
  final AttendanceMarking attendanceMarking;
  final TripStart startTrip;
  final TripEnd endTrip;
  final SkipReason reasonToSkip;
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final PartyMasterSync partyMastersync;
  final CheckinDatasource checkinDatasource;
  final CheckoutDatasource checkoutDatasource;
  final ItemMasterSync itemMaster;
  final GetPriceLevel priceLevel;
  final GetItemPriceDetails itemPriceDetails;
  IUserFacadImp(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.attendanceMarking,
    this.partyMastersync,
    this.checkinDatasource,
    this.checkoutDatasource,
    this.startTrip,
    this.endTrip,
    this.reasonToSkip,
    this.itemMaster,
    this.priceLevel,
    this.itemPriceDetails,
  );

  @override
  ResultFuture<DefaultResponse> markAttendance(
    BaseParams<AttendanceParams> params,
  ) {
    return attendanceMarking.call(params);
  }

  @override
  ResultFuture<PartyMasterSyncModel> partyMasterSync(
    BaseParams<PartyMasterSyncParams> params,
  ) {
    return partyMastersync(params);
  }

  @override
  ResultFuture<DefaultResponse> checkin(BaseParams<CheckinParams> params) {
    return checkinDatasource.call(params);
  }

  @override
  ResultFuture<DefaultResponse> checkout(BaseParams<CheckoutParams> params) {
    return checkoutDatasource.call(params);
  }

  @override
  ResultFuture<DefaultResponse> markTripStart(
    BaseParams<TripStartParams> params,
  ) {
    return startTrip(params);
  }

  @override
  ResultFuture<DefaultResponse> markTripEnd(BaseParams<TripEndParams> params) {
    return endTrip(params);
  }

  @override
  ResultFuture<SkipReasonResponse> skipReason() {
    return reasonToSkip();
  }

  @override
  ResultFuture<ItemMasterSyncModel> getItemMaster(
    BaseParams<ItemMasterQueryParams> params,
  ) {
    return itemMaster(params);
  }

  @override
  ResultFuture<PriceLevelModel> getPriceLevels(int companyId) {
    return priceLevel(companyId: companyId);
  }

  @override
  ResultFuture<ItemPriceDetailsModel> getItempriceDetails(int companyId) {
    return itemPriceDetails(companyId: companyId);
  }
}
