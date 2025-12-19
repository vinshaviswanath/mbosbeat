import 'package:mpos_beat/core/failures/value_object/value_object.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/designation_response.dart';
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
import 'package:mpos_beat/domain/request/reset_user_password_params.dart';
import 'package:mpos_beat/domain/request/user_creation_params.dart';
import 'package:mpos_beat/domain/request/user_settings_params.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/user_designation_screen.dart';
import 'dart:convert';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/manage_user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManagementProvider with ChangeNotifier {
  final IUserManagementFacad iUserManagementFacad;
  UserManagementProvider(this.iUserManagementFacad);

  UserName _userName = UserName('');
  PhoneNumber _phone = PhoneNumber('');
  Password _password = Password('');
  EmailAddress _email = EmailAddress('');
  WhatsAppNumber _whatsAppNumber = WhatsAppNumber('');
  Designation _designation = Designation('');
  ReportingTo _reportingTo = ReportingTo('');

  UserName get user => _userName;
  PhoneNumber get phone => _phone;
  Password get password => _password;
  EmailAddress get email => _email;
  WhatsAppNumber get whatsAppNumber => _whatsAppNumber;
  Designation get designation => _designation;
  ReportingTo get reportingTo => _reportingTo;

  DesignationResponse? _designationResponse;
  DesignationResponse? get designationResponse => _designationResponse;

  UserMasterResponse? _userMasterResponse;
  UserMasterResponse? get userMasterResponse => _userMasterResponse;

  UserDesignationListModel? _designationList;
  UserDesignationListModel? get designationList => _designationList;

  final _userSettingsController =
      StreamController<UserSettingsResponse?>.broadcast();
  Stream<UserSettingsResponse?> get userSettingsStream =>
      _userSettingsController.stream;
  UserSettingsResponse? _userSettingsList;
  UserSettingsResponse? get userSettingsList => _userSettingsList;

  final _companyListController =
      StreamController<CompaniesListResponse?>.broadcast();
  Stream<CompaniesListResponse?> get companyListStream =>
      _companyListController.stream;
  CompaniesListResponse? _companiesList;
  CompaniesListResponse? get companiesList => _companiesList;

  final _usersController = StreamController<List<UserMasterList>>.broadcast();
  Stream<List<UserMasterList>> get usersStream => _usersController.stream;
  UsersListModel? _usersList;
  UsersListModel? get usersList => _usersList;
  List<UserMasterList> get userss => _usersList?.userMasterList ?? [];

  final List<UserDesignationDetails> _designations = [];
  List<UserDesignationDetails> get designations => _designations;

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  CompanyInfoDtos? _companyCreationDtos;
  CompanyInfoDtos? get companyCreationDtos => _companyCreationDtos;

  AutovalidateMode userCreateAutovalidateMode = AutovalidateMode.disabled;
  AutovalidateMode designationAutovalidateMode = AutovalidateMode.disabled;

  bool _isVisiblePassword = false;
  bool _isVisibleConfirmPassword = false;
  bool get isVisiblePassword => _isVisiblePassword;
  bool get isVisibleConfirmPassword => _isVisibleConfirmPassword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void toggleVisibilityPassword() {
    _isVisiblePassword = !_isVisiblePassword;
    notifyListeners();
  }

  void resetVisibilityPassword() {
    _isVisiblePassword = false;
    notifyListeners();
  }

  void toggleVisibilityConfirmPassword() {
    _isVisibleConfirmPassword = !_isVisibleConfirmPassword;
    notifyListeners();
  }

  void resetVisibilityConfirmPassword() {
    _isVisibleConfirmPassword = false;
    notifyListeners();
  }

  Future<void> _saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = _users.map((u) => jsonEncode(u.toJson())).toList();
    await prefs.setStringList("users", jsonList);
  }

  Future<void> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList("users") ?? [];
    _users = jsonList.map((e) => UserModel.fromJson(jsonDecode(e))).toList();
    notifyListeners();
  }

  Future<void> _saveDesignations() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = _designations.map((d) => jsonEncode(d.toJson())).toList();
    await prefs.setStringList("designations", jsonList);
  }

  Future<void> loadDesignations() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList("designations") ?? [];
    _designations.clear();
    _designations.addAll(
      jsonList.map((e) => UserDesignationDetails.fromJson(jsonDecode(e))),
    );
    notifyListeners();
  }

  bool validateUserCreationForm() {
    return _userName.isValid();
    //  &&
    //     _phone.isValid() &&
    //     _email.isValid() &&
    //     _password.isValid() &&
    //     _designation.isValid() &&
    //     _reportingTo.isValid();
  }

  void updateUser(String input) {
    _userName = UserName(input);
    notifyListeners();
  }

  void updatePhone(String input) {
    _phone = PhoneNumber(input);
    notifyListeners();
  }

  void updatePassword(String input) {
    _password = Password(input);
    notifyListeners();
  }

  void updateEmail(String input) {
    _email = EmailAddress(input);
    notifyListeners();
  }

  void updateWhatsAppNumber(String input) {
    _whatsAppNumber = WhatsAppNumber(input);
    notifyListeners();
  }

  void updateDesignation(String input) {
    _designation = Designation(input);
    notifyListeners();
  }

  void updateReportingTo(String input) {
    _reportingTo = ReportingTo(input);
    notifyListeners();
  }

  UserDesignationList? selectedDesignation;
  UserMasterList? selectedReportingTo;

  void updateSelectedDesignation(UserDesignationList? value) {
    selectedDesignation = value;
    notifyListeners();
  }

  void updateSelectedReportingTo(UserMasterList? value) {
    selectedReportingTo = value;
    notifyListeners();
  }

  void selectLastAddedDesignation() {
    if (_designationList?.userDesignationList.isNotEmpty ?? false) {
      selectedDesignation = _designationList!.userDesignationList.last;
      notifyListeners();
    }
  }

  void resetUserCreateForm() {
    selectedDesignation = null;
    selectedReportingTo = null;

    updateUser('');
    updatePhone('');
    updateWhatsAppNumber('');
    updateEmail('');
    updatePassword('');
    notifyListeners();
  }

  // ------------------------
  //  USER CRUD OPERATIONS
  // ------------------------

  void editUser(String id, UserModel updatedUser) {
    final index = _users.indexWhere((u) => u.id == id);
    if (index != -1) {
      _users[index] = updatedUser;
      notifyListeners();
    }
  }

  // void blockUser(String id) {
  //   final index = _users.indexWhere((u) => u.id == id);
  //   if (index != -1) {
  //     _users[index].isBlocked = true;
  //     notifyListeners();
  //   }
  // }

  // void unblockUser(String id) {
  //   final index = _users.indexWhere((u) => u.id == id);
  //   if (index != -1) {
  //     _users[index].isBlocked = false;
  //     notifyListeners();
  //   }
  // }

  // void deleteUser(String id) {
  //   _users.removeWhere((u) => u.id == id);
  //   notifyListeners();
  // }

  Future<void> submitUser(
    BuildContext context, {
    required String name,
    required String phone,
    required String email,
    required String password,
    required String whatsAppNumber,
  }) async {
    updateUser(name);
    updatePhone(phone);
    updateEmail(email);
    updatePassword(password);
    updateWhatsAppNumber(whatsAppNumber);

    final isValid = validateUserCreationForm();
    if (!isValid) {
      userCreateAutovalidateMode = AutovalidateMode.always;
      notifyListeners();
      return;
    }

    final newUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      phone: phone,
      email: email,
      password: password,
      whatsAppNumber: whatsAppNumber,
      designation: _designation.getValue ?? '',
      reportingTo: _reportingTo.getValue ?? '',
    );

    _users.add(newUser);
    await _saveUsers();
    Logger.logSuccess("Created user : ${newUser.name}");
    resetUserCreateForm();
    notifyListeners();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });
  }

  //======================================================================
  //                           USER DESIGNATION
  //======================================================================

  void resetDesignation() {
    _designation = Designation('');
    designationAutovalidateMode = AutovalidateMode.disabled;
    notifyListeners();
  }

  bool validateDesignation() {
    return _designation.isValid();
  }

  Future<void> submitDesignation(BuildContext context) async {
    final isValid = validateDesignation();

    if (!isValid) {
      designationAutovalidateMode = AutovalidateMode.always;
      notifyListeners();
      return;
    }

    addDesignation(_designation.getValue ?? '');
    designationAutovalidateMode = AutovalidateMode.disabled;
    Navigator.pop(context);
  }

  void addDesignation(String userName) {
    _designations.add(
      UserDesignationDetails(userName: userName, status: "Active"),
    );
    _saveDesignations();
    notifyListeners();
  }

  void editDesignation(int index, String newUserName) {
    _designations[index] = UserDesignationDetails(
      userName: newUserName,
      status: _designations[index].status,
    );
    _saveDesignations();
    notifyListeners();
  }

  // void deleteDesignation(int index) {
  //   _designations.removeAt(index);
  //   _saveDesignations();
  //   notifyListeners();
  // }

  // void deactivateDesignation(int index) {
  //   _designations[index] = UserDesignationDetails(
  //     userName: _designations[index].userName,
  //     status: "Inactive",
  //   );
  //   _saveDesignations();
  //   notifyListeners();
  // }

  // void activateDesignation(int index) {
  //   _designations[index] = UserDesignationDetails(
  //     userName: _designations[index].userName,
  //     status: "Active",
  //   );
  //   _saveDesignations();
  //   notifyListeners();
  // }

  //========================= Add Designation =========================

  Future<DesignationResponse?> addUserDesignation(
    BuildContext context, {
    required String designation,
    required String customerId,
    required String id,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.addUserDesignation(
      BaseParams(
        data: AddDesignationParams(
          id: id,
          customerId: customerId,
          designation: designation,
        ),
      ),
    );

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
        _designationResponse = response;
        Logger.logSuccess(
          "Designation added successfull : ${response.toJson()}",
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${response.message}", textAlign: TextAlign.center),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        );
        await getDesignationList(context);
        selectLastAddedDesignation();
        notifyListeners();
      },
    );
    setLoading(false);
    return _designationResponse;
  }

  //========================= Designation List =========================

  Future<UserDesignationListModel?> getDesignationList(
    BuildContext context,
  ) async {
    setLoading(true);
    final result = await iUserManagementFacad.getUserDesignationList();

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
        _designationList = response;

        final uniqueDesignations = <int>{};
        _designationList?.userDesignationList.removeWhere((item) {
          if (item.id == null) return false;
          return !uniqueDesignations.add(item.id!);
        });
        Logger.logSuccess(
          "Designation List fetch successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    return _designationList;
  }

  //========================= Designation Activation =========================

  Future<DesignationResponse?> designationActivation(
    BuildContext context, {
    required int designationId,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.activateDesignation(
      designationId: designationId,
    );

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
        _designationResponse = response;
        Logger.logSuccess(
          "Designation activated successfull : ${response.toJson()}",
        );
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text("${response.message}", textAlign: TextAlign.center),
        //     behavior: SnackBarBehavior.floating,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //   ),
        // );
        getDesignationList(context);
        notifyListeners();
      },
    );
    setLoading(false);
    return _designationResponse;
  }

  //========================= Deactivation Designation =========================

  Future<DesignationResponse?> designationdeactivation(
    BuildContext context, {
    required int designationId,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.deactivateDesignation(
      designationId: designationId,
    );

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
        _designationResponse = response;
        Logger.logSuccess(
          "Designation deactivated successfull : ${response.toJson()}",
        );
        getDesignationList(context);

        notifyListeners();
      },
    );
    setLoading(false);
    return _designationResponse;
  }

  //========================= Delete Designation =========================

  Future<DesignationResponse?> deleteDesignation(
    BuildContext context, {
    required int designationId,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.deleteDesignation(
      designationId: designationId,
    );

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
        _designationResponse = response;
        Logger.logSuccess(
          "Designation deleted successfull : ${response.toJson()}",
        );
        getDesignationList(context);

        notifyListeners();
      },
    );
    setLoading(false);
    return _designationResponse;
  }

  //========================= Create User =========================

  Future<DesignationResponse?> createUser({
    required BuildContext context,
    required int id,
    required int customerId,
    required String fullName,
    required String mobile,
    required String whatsappNo,
    required String email,
    required int designationId,
    required int paretId,
    required String userName,
    required String password,
    required int active,
  }) async {
    setLoading(true);

    final result = await iUserManagementFacad.createUser(
      BaseParams(
        data: UserCreationParams(
          id: id,
          customerId: customerId,
          fullName: fullName,
          mobile: mobile,
          whatsappNo: whatsappNo,
          email: email,
          designationId: designationId,
          parentId: paretId,
          userName: userName,
          passwordHash: password,
          active: active,
        ),
      ),
    );

    result.fold(
      (failure) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(failure.errorMsg)));
      },
      (response) async {
        if (response.status == 0) {
          // ❗CLEAR ONLY ON SUCCESS
          resetUserCreateForm();
        }

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(response.message ?? '')));

        if (response.status != 0) {
          context.pop();
        }

        getAllUsersList(context);
        notifyListeners();
      },
    );

    setLoading(false);
    return null;
  }

  //========================= Users List =========================

  Future<UsersListModel?> getAllUsersList(BuildContext context) async {
    setLoading(true);
    final result = await iUserManagementFacad.getUsers();

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
        _usersList = response;
        _usersController.add(_usersList?.userMasterList ?? []);
        // final uniqueUsers = <int>{};
        // _usersList?.userMasterList.removeWhere((user) {
        //   if (user.id == null) return false;
        //   return !uniqueUsers.add(user.id!);
        // });
        Logger.logSuccess(
          "Users List fetch successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    return _usersList;
  }

  //========================= Delete User =========================

  Future<DesignationResponse?> deleteUser({
    required BuildContext context,
    required int userId,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.deleteUsers(
      BaseParams(data: DeleteUserParam(userId: userId.toString())),
    );

    result
        .fold(
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
            _designationResponse = response;
            Logger.logSuccess(
              "User deleted successfull : ${response.toJson()}",
            );
            SnackBar(
              content: Text("${response.message}", textAlign: TextAlign.center),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          },
        )
        ?.then((_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            getAllUsersList(context);
          });
          notifyListeners();
        });
    setLoading(false);
    return _designationResponse;
  }

  //========================= Block User =========================

  Future<DesignationResponse?> blockUser({
    required BuildContext context,
    required int userId,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.blockingUser(
      BaseParams(
        data: BlockUserParams(UserAction.block, userId: userId.toString()),
      ),
    );

    result
        .fold(
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
            _designationResponse = response;
            Logger.logSuccess(
              "User Blocked successfull : ${response.toJson()}",
            );
            SnackBar(
              content: Text("${response.message}", textAlign: TextAlign.center),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          },
        )
        ?.then((_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            getAllUsersList(context);
          });
          notifyListeners();
        });
    setLoading(false);
    return _designationResponse;
  }

  //========================= Unblock User =========================

  Future<DesignationResponse?> unblockUser({
    required BuildContext context,
    required int userId,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.blockingUser(
      BaseParams(
        data: BlockUserParams(UserAction.unblock, userId: userId.toString()),
      ),
    );

    result
        .fold(
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
            _designationResponse = response;
            Logger.logSuccess(
              "User Unblocked successfull : ${response.toJson()}",
            );
            SnackBar(
              content: Text("${response.message}", textAlign: TextAlign.center),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          },
        )
        ?.then((_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            getAllUsersList(context);
          });
          notifyListeners();
        });
    setLoading(false);
    return _designationResponse;
  }

  //========================= Rest User Password =========================

  Future<DesignationResponse?> resetUserPassword({
    required BuildContext context,
    required int userId,
    required String newPassword,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.resetUserPassword(
      BaseParams(
        data: ResetUserPasswordParams(
          userId: userId.toString(),
          password: newPassword,
        ),
      ),
    );

    result
        .fold(
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
            _designationResponse = response;
            Logger.logSuccess(
              "User password reset successfull : ${response.toJson()}",
            );
            SnackBar(
              content: Text("${response.message}", textAlign: TextAlign.center),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            );
          },
        )
        ?.then((_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            getAllUsersList(context);
            context.pushNamed(AppRouterConst.resetSuccessScreen);
          });
          notifyListeners();
        });
    setLoading(false);
    return _designationResponse;
  }

  //========================= Users Settings List =========================

  Future<UserSettingsResponse?> getUsersSettingsList({
    required BuildContext context,
    required String userId,
  }) async {
    setLoading(true);

    final result = await iUserManagementFacad.getUserSettingsList(
      userId: userId,
    );

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
        /// Assign API result
        _userSettingsList = response;

        /// Filter only active settings
        _userSettingsList = _userSettingsList?.copyWith(
          userSettingsList: _userSettingsList?.userSettingsList
              .where((item) => item.active == 1)
              .toList(),
        );

        /// Sort by orderNo
        _userSettingsList?.userSettingsList.sort(
          (a, b) => (a.orderNo ?? 0).compareTo(b.orderNo ?? 0),
        );

        /// Push to stream
        _userSettingsController.add(_userSettingsList);

        Logger.logSuccess(
          "Users Settings List fetch successful : ${response.toJson()}",
        );

        notifyListeners();
      },
    );

    setLoading(false);
    return _userSettingsList;
  }

  //========================= Create User Settings =========================

  Future<UserMasterResponse?> createUserSettings({
    required BuildContext context,
    required int id,
    required int userId,
    required String value,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.createUserSettings(
      BaseParams(
        data: UserSettingsParams(id: id, userId: userId, value: value),
      ),
    );

    result
        .fold(
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
            _userMasterResponse = response;
            Logger.logSuccess(
              "User Settings created successfull : ${response.toJson()}",
            );
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text(
            //       response.message ?? "Success",
            //       textAlign: TextAlign.center,
            //     ),
            //     behavior: SnackBarBehavior.floating,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(16),
            //     ),
            //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //   ),
            // );
          },
        )!
        .then((value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            getUsersSettingsList(context: context, userId: userId.toString());
          });
          notifyListeners();
        });
    setLoading(false);
    return _userMasterResponse;
  }

  //========================= Companies List =========================

  Future<CompaniesListResponse?> getAllCompanies({
    required BuildContext context,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.getCompaniesList();

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
        _companiesList = response;
        _companyListController.add(_companiesList);
        Logger.logSuccess(
          "Users Settings List fetch successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    return _companiesList;
  }

  //========================= Create User Company Mapping =========================

  Future<UserMasterResponse?> createUserCompanyMapping({
    required BuildContext context,
    required int userId,
    required List<CompanyList> companyList,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.userCompanyMapping(
      BaseParams(
        data: CreateUserCompanyMappingParams(
          userId: userId,
          companyList: companyList,
        ),
      ),
    );

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
        _userMasterResponse = response;
        Logger.logSuccess(
          "User Company Mapping successfull : ${response.toJson()}",
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.message ?? "Success",
              textAlign: TextAlign.center,
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        );
        getAllUsersList(context);
        notifyListeners();
      },
    );
    setLoading(false);
    return _userMasterResponse;
  }

  //========================= Create Company User Mapping =========================

  Future<CompanyInfoDtos?> createCompanyMapping({
    required BuildContext context,
    required int companyId,
    required List<UserList> userList,
  }) async {
    setLoading(true);
    final result = await iUserManagementFacad.createCompanyUserMapping(
      BaseParams(
        data: CreateComanyUserMappingParams(
          companyId: companyId,
          userList: userList,
        ),
      ),
    );

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
        _companyCreationDtos = response;
        Logger.logSuccess(
          " Company User Mapping successfull : ${response.toJson()}",
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.message ?? "Success",
              textAlign: TextAlign.center,
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        );
        getAllUsersList(context);
        notifyListeners();
      },
    );
    setLoading(false);
    return _companyCreationDtos;
  }
}
