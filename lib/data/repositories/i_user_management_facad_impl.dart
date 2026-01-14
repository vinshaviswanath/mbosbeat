import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/data_sources/user_management/company_user_mapping/company_user_mapping.dart';
import 'package:mpos_beat/data/data_sources/user_management/activate_designation/activate_designation.dart';
import 'package:mpos_beat/data/data_sources/user_management/add_designation/add_designation.dart';
import 'package:mpos_beat/data/data_sources/user_management/block_user/block_user.dart';
import 'package:mpos_beat/data/data_sources/user_management/create_user/create_user.dart';
import 'package:mpos_beat/data/data_sources/user_management/create_user_company_mapping%5D/create_user_company_mapping.dart';
import 'package:mpos_beat/data/data_sources/user_management/create_user_settings/create_user_settings.dart';
import 'package:mpos_beat/data/data_sources/user_management/deactivate_designation/deactivate_designation.dart';
import 'package:mpos_beat/data/data_sources/user_management/delete_designation/delete_designation.dart';
import 'package:mpos_beat/data/data_sources/user_management/delete_user/delete_user.dart';
import 'package:mpos_beat/data/data_sources/user_management/get_companies/get_compamies.dart';
import 'package:mpos_beat/data/data_sources/user_management/get_users_list/get_users_list.dart';
import 'package:mpos_beat/data/data_sources/user_management/party_MasterSync/party_MasterSync.dart';
import 'package:mpos_beat/data/data_sources/user_management/reset_user_password/reset_user_password.dart';
import 'package:mpos_beat/data/data_sources/user_management/user_designation_list/user_designation_list.dart';
import 'package:mpos_beat/data/data_sources/user_management/user_settings/user_settings_list.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/designation_response.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/data/models/user_designation_list_model.dart';
import 'package:mpos_beat/data/models/user_master_response.dart';
import 'package:mpos_beat/data/models/user_settings_list_model.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:mpos_beat/domain/repositories/i_user_management_facad.dart';
import 'package:mpos_beat/domain/request/add_designation_params.dart';
import 'package:mpos_beat/domain/request/block_user_params.dart';
import 'package:mpos_beat/domain/request/create_comany_user_mapping_params.dart';
import 'package:mpos_beat/domain/request/create_user_company_mapping_params.dart';
import 'package:mpos_beat/domain/request/delete_user_param.dart';
import 'package:mpos_beat/domain/request/party_MasterSync_params.dart';
import 'package:mpos_beat/domain/request/reset_user_password_params.dart';
import 'package:mpos_beat/domain/request/user_creation_params.dart';
import 'package:mpos_beat/domain/request/user_settings_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IUserManagementFacad)
class IUserManagementFacadImpl implements IUserManagementFacad {
  final ActivateDesignation designationActivation;
  final DeactivateDesignation designationcDeativation;
  final DeleteDesignation deleteDesignations;
  final GetUserDesignationList getDesigneationList;
  final AddDesignation addDesignations;
  final DeleteUser userDeletion;
  final BlockUser blockUsers;
  final ResetUserPassword resetPassword;
  final GetUserSettings userSettingsList;
  final CreateUser userCreate;
  final GetAllUsers getAllUsers;
  final CreateUserSettings userSettings;
  final GetCompanies getAllcompanies;
  final CreateUserCompanyMapping userComapnyMapping;
  final CreateCompanyUserMapping companyUserMapping;
  final PartyMasterSync partyMastersync;
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  IUserManagementFacadImpl(
    this.designationcDeativation,
    this.addDesignations,
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.getDesigneationList,
    this.designationActivation,
    this.deleteDesignations,
    this.userCreate,
    this.getAllUsers,
    this.userDeletion,
    this.blockUsers,
    this.resetPassword,
    this.userSettingsList,
    this.userSettings,
    this.getAllcompanies,
    this.userComapnyMapping,
    this.partyMastersync,
    this.companyUserMapping,
  );

  @override
  ResultFuture<DesignationResponse> addUserDesignation(
    BaseParams<AddDesignationParams> params,
  ) {
    return addDesignations(params);
  }

  @override
  ResultFuture<UserDesignationListModel> getUserDesignationList() {
    return getDesigneationList();
  }

  @override
  ResultFuture<DesignationResponse> activateDesignation({
    required int designationId,
  }) {
    return designationActivation(designationId: designationId);
  }

  @override
  ResultFuture<DesignationResponse> deactivateDesignation({
    required int designationId,
  }) {
    return designationcDeativation(designationId: designationId);
  }

  @override
  ResultFuture<DesignationResponse> deleteDesignation({
    required int designationId,
  }) {
    return deleteDesignations(designationId: designationId);
  }

  @override
  ResultFuture<DesignationResponse> createUser(
    BaseParams<UserCreationParams> params,
  ) {
    return userCreate(params);
  }

  @override
  ResultFuture<UsersListModel> getUsers() {
    return getAllUsers();
  }

  @override
  ResultFuture<DesignationResponse> deleteUsers(
    BaseParams<DeleteUserParam> params,
  ) {
    return userDeletion(params);
  }

  @override
  ResultFuture<DesignationResponse> blockingUser(
    BaseParams<BlockUserParams> params,
  ) {
    return blockUsers(params);
  }

  @override
  ResultFuture<DesignationResponse> unblockingUser(
    BaseParams<BlockUserParams> params,
  ) {
    return blockUsers(params);
  }

  @override
  ResultFuture<DesignationResponse> resetUserPassword(
    BaseParams<ResetUserPasswordParams> params,
  ) {
    return resetPassword(params);
  }

  @override
  ResultFuture<UserSettingsResponse> getUserSettingsList({
    required String userId,
  }) {
    return userSettingsList(userId: userId);
  }

  @override
  ResultFuture<UserMasterResponse> createUserSettings(
    BaseParams<UserSettingsParams> params,
  ) {
    return userSettings(params);
  }

  @override
  ResultFuture<CompaniesListResponse> getCompaniesList() {
    return getAllcompanies();
  }

  @override
  ResultFuture<UserMasterResponse> userCompanyMapping(
    BaseParams<CreateUserCompanyMappingParams> params,
  ) {
    return userComapnyMapping(params);
  }

  @override
  ResultFuture<CompanyInfoDtos> createCompanyUserMapping(
    BaseParams<CreateComanyUserMappingParams> params,
  ) {
    return companyUserMapping(params);
  }

  @override
  ResultFuture<PartyMasterSyncModel> partyMasterSync(
    BaseParams<PartyMasterSyncParams> params,
  ) {
    return partyMastersync(params);
  }
}
