import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/designation_response.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/data/models/user_designation_list_model.dart';
import 'package:mpos_beat/data/models/user_master_response.dart';
import 'package:mpos_beat/data/models/user_settings_list_model.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:mpos_beat/domain/request/add_designation_params.dart';
import 'package:mpos_beat/domain/request/block_user_params.dart';
import 'package:mpos_beat/domain/request/create_comany_user_mapping_params.dart';
import 'package:mpos_beat/domain/request/create_user_company_mapping_params.dart';
import 'package:mpos_beat/domain/request/delete_user_param.dart';
import 'package:mpos_beat/domain/request/party_MasterSync_params.dart';
import 'package:mpos_beat/domain/request/reset_user_password_params.dart';
import 'package:mpos_beat/domain/request/user_creation_params.dart';
import 'package:mpos_beat/domain/request/user_settings_params.dart';

interface class IUserManagementFacad {
  ResultFuture<DesignationResponse> addUserDesignation(
    BaseParams<AddDesignationParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<UserDesignationListModel> getUserDesignationList() {
    throw UnimplementedError();
  }

  ResultFuture<DesignationResponse> activateDesignation({
    required int designationId,
  }) {
    throw UnimplementedError();
  }

  ResultFuture<DesignationResponse> deactivateDesignation({
    required int designationId,
  }) {
    throw UnimplementedError();
  }

  ResultFuture<DesignationResponse> deleteDesignation({
    required int designationId,
  }) {
    throw UnimplementedError();
  }

  ResultFuture<DesignationResponse> createUser(
    BaseParams<UserCreationParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<UsersListModel> getUsers() {
    throw UnimplementedError();
  }

  ResultFuture<DesignationResponse> deleteUsers(
    BaseParams<DeleteUserParam> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<DesignationResponse> blockingUser(
    BaseParams<BlockUserParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<DesignationResponse> unblockingUser(
    BaseParams<BlockUserParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<DesignationResponse> resetUserPassword(
    BaseParams<ResetUserPasswordParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<UserSettingsResponse> getUserSettingsList({
    required String userId,
  }) {
    throw UnimplementedError();
  }

  ResultFuture<UserMasterResponse> createUserSettings(
    BaseParams<UserSettingsParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<CompaniesListResponse> getCompaniesList() {
    throw UnimplementedError();
  }

  ResultFuture<UserMasterResponse> userCompanyMapping(
    BaseParams<CreateUserCompanyMappingParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<CompanyInfoDtos> createCompanyUserMapping(
    BaseParams<CreateComanyUserMappingParams> params,
  ) {
    throw UnimplementedError();
  }
}
