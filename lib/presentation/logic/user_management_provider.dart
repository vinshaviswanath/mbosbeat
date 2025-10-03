import 'package:mpos_beat/core/failures/value_object/value_object.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_designation/user_designation_screen.dart';

import 'dart:convert';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/manage_user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManagementProvider with ChangeNotifier {
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

  final List<UserDesignationDetails> _designations = [];
  List<UserDesignationDetails> get designations => _designations;

  List<UserModel> _users = [];
  List<UserModel> get users => _users;
  AutovalidateMode userCreateAutovalidateMode = AutovalidateMode.disabled;
  AutovalidateMode designationAutovalidateMode = AutovalidateMode.disabled;

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
    return _userName.isValid() &&
        _phone.isValid() &&
        _email.isValid() &&
        _password.isValid() &&
        _designation.isValid() &&
        _reportingTo.isValid();
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

  void resetUserCreateForm() {
    _userName = UserName('');
    _phone = PhoneNumber('');
    _password = Password('');
    _whatsAppNumber = WhatsAppNumber('');
    _email = EmailAddress('');
    _designation = Designation('');
    _reportingTo = ReportingTo('');
    userCreateAutovalidateMode = AutovalidateMode.disabled;
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

  void blockUser(String id) {
    final index = _users.indexWhere((u) => u.id == id);
    if (index != -1) {
      _users[index].isBlocked = true;
      notifyListeners();
    }
  }

  void unblockUser(String id) {
    final index = _users.indexWhere((u) => u.id == id);
    if (index != -1) {
      _users[index].isBlocked = false;
      notifyListeners();
    }
  }

  void deleteUser(String id) {
    _users.removeWhere((u) => u.id == id);
    notifyListeners();
  }

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

  void deleteDesignation(int index) {
    _designations.removeAt(index);
    _saveDesignations();
    notifyListeners();
  }

  void deactivateDesignation(int index) {
    _designations[index] = UserDesignationDetails(
      userName: _designations[index].userName,
      status: "Inactive",
    );
    _saveDesignations();
    notifyListeners();
  }

  void activateDesignation(int index) {
    _designations[index] = UserDesignationDetails(
      userName: _designations[index].userName,
      status: "Active",
    );
    _saveDesignations();
    notifyListeners();
  }
}
