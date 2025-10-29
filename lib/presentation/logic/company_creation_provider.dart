import 'dart:convert';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/failures/value_object/value_object.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/data/models/create_godown_response.dart';
import 'package:mpos_beat/data/models/create_route_response.dart';
import 'package:mpos_beat/data/models/get_company_voucher_model.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/country_list_response.dart';
import 'package:mpos_beat/data/models/data/country_list_data.dart';
import 'package:mpos_beat/data/models/data/state_list_data.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/data/models/integration_model.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';
import 'package:mpos_beat/data/models/state_list_response.dart';
import 'package:mpos_beat/domain/repositories/i_company_creation_facad.dart';
import 'package:mpos_beat/domain/request/company_creation_params.dart';
import 'package:mpos_beat/domain/request/create_comany_user_mapping_params.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/domain/request/create_godown_params.dart';
import 'package:mpos_beat/domain/request/create_route_params.dart';
import 'package:mpos_beat/domain/request/integration_request.dart';
import 'package:mpos_beat/presentation/views/godown_wise_screen/godown_wise_screen.dart';
import 'package:mpos_beat/presentation/views/route_wise_screen/route_wise_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyCreationProvider extends ChangeNotifier {
  final ICompanyCreationFacad iCompanyCreationFacad;
  CompanyCreationProvider(this.iCompanyCreationFacad);

  Future<String> getCompanyId() async {
    final pref = sl<SharedPreferences>();
    final companyId = pref.getInt('selected_company_id');
    return companyId?.toString() ?? '';
  }

  String? _activePlan;

  String? get activePlan => _activePlan;

  final Set<int> _completedStages = {};

  Set<int> get completedStages => _completedStages;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<bool> stageCompleted = [false, false, false];

  bool _isGodown = true;

  bool get isGodown => _isGodown;

  int? _companyid;
  int? get companyid => _companyid;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  final _companyController =
      StreamController<List<CompanyViewList>>.broadcast();
  Stream<List<CompanyViewList>> get companyStream => _companyController.stream;
  CompaniesListResponse? _companiesList;
  CompaniesListResponse? get companiesList => _companiesList;

  GodownResponse? _godownResponse;
  GodownResponse? get godownResponse => _godownResponse;

  final _godownController = StreamController<List<VehicleList>>.broadcast();
  Stream<List<VehicleList>> get godownStream => _godownController.stream;
  GodownListModel? _godownListResponse;
  GodownListModel? get godownListResponse => _godownListResponse;

  final _routeController = StreamController<List<RouteList>>.broadcast();
  Stream<List<RouteList>> get routeStream => _routeController.stream;
  RouteListModel? _routeListResponse;
  RouteListModel? get routeListResponse => _routeListResponse;

  RouteResponse? _routeResponse;
  RouteResponse? get routeResponse => _routeResponse;

  void toggleVoucher() {
    _isGodown = !_isGodown;
    notifyListeners();
  }

  // bool _isExpand = false;
  // bool get isExpand => _isExpand;

  // void toggleCheckBox() {
  //   _isExpand = !_isExpand;
  //   notifyListeners();
  // }

  final formKey = GlobalKey<FormState>();

  void activatePlan(String planTitle) {
    _activePlan = planTitle;
    notifyListeners();
  }

  void deactivatePlan() {
    _activePlan = null;
    notifyListeners();
  }

  bool isPlanActive(String planTitle) => _activePlan == planTitle;

  void markStageCompleted(int index) {
    if (index == 0 || stageCompleted[index - 1]) {
      stageCompleted[index] = true;
      notifyListeners();
    }
  }

  bool canGoToStage(int index) {
    if (index == 0) return true;
    for (int i = 0; i < index; i++) {
      if (!stageCompleted[i]) return false;
    }
    return true;
  }

  bool isStageCompleted(int index) => stageCompleted[index];

  // ======================================================================
  //                         Company Creation (DDD)
  // ======================================================================
  CompanyInfoDtos? _companyCreationDtos;
  CompanyInfoDtos? get companyCreationDtos => _companyCreationDtos;

  CompanyName _companyName = CompanyName('');
  DisplayName _displayName = DisplayName("");
  Address1 _address1 = Address1("");
  Pincode _pincode = Pincode("");
  Country _country = Country("");
  CountryState _countryState = CountryState("");
  RegistrationType _registrationType = RegistrationType("");

  AutovalidateMode companyinfoAutovalidateMode = AutovalidateMode.disabled;
  CompanyName get companyName => _companyName;
  DisplayName get displayName => _displayName;
  Address1 get address1 => _address1;
  Pincode get pincode => _pincode;
  Country get country => _country;
  CountryState get countryState => _countryState;
  RegistrationType get registrationType => _registrationType;

  bool validateCompanyInfoFields() {
    return _companyName.isValid() & _displayName.isValid() &&
        _address1.isValid() &&
        _pincode.isValid() &&
        _country.isValid() &&
        _countryState.isValid() &&
        _registrationType.isValid();
  }

  void updateCompanyName(String input) {
    _companyName = CompanyName(input);
    notifyListeners();
  }

  void updateDisplayName(String input) {
    _displayName = DisplayName(input);

    notifyListeners();
  }

  void updateAddress1(String input) {
    _address1 = Address1(input);
    notifyListeners();
  }

  void updatePincode(String input) {
    _pincode = Pincode(input);
    notifyListeners();
  }

  void updateCountry(String input) {
    _country = Country(input);
    notifyListeners();
  }

  void updateCountryState(String input) {
    _countryState = CountryState(input);
    notifyListeners();
  }

  void updateRegType(String input) {
    _registrationType = RegistrationType(input);
    notifyListeners();
  }

  //CompanyInformations....
  Future<CompanyInfoDtos?> companyinfo(
    BuildContext context, {
    required CompanyInfoParams params,
    VoidCallback? onSuccess,
  }) async {
    final isValid = validateCompanyInfoFields();
    if (!isValid) {
      companyinfoAutovalidateMode = AutovalidateMode.always;
      notifyListeners();
      return null;
    }

    final result = await iCompanyCreationFacad.companyInfo(
      BaseParams(data: params),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Company info failed : $_errorMessage");
        _setLoading(false);
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Comapany Info success : ${response.toJson()}");
        Logger.logSuccess("Status : ${response.status}");
        Logger.logSuccess("Company ID : ${response.id}");

        _setLoading(false);
        notifyListeners();

        if (response.status == 1) {
          _companyCreationDtos = response;
          _companyid = _companyCreationDtos!.id;
          markStageCompleted(0);
          onSuccess?.call();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message, textAlign: TextAlign.center),
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
    return _companyCreationDtos;
  }

  //fetchCountryList........
  CountryListDtos? _countryListDtos;
  CountryListDtos? get coountryListdtos => _countryListDtos;

  List<CountryListData> _countries = [];
  List<CountryListData> get countries => _countries;

  CountryListData? _selectedCountry;
  CountryListData? get selectedCountry => _selectedCountry;

  Future<CountryListDtos?> fectchCountryList(BuildContext context) async {
    final result = await iCompanyCreationFacad.countryList();

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Fetch Country List Failed : $_errorMessage");
        _setLoading(false);
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Fetch Country List success : ${response.toJson()}");
        Logger.logSuccess("Status : ${response.status}");

        _countryListDtos = response;
        _countries = _countryListDtos?.countryListData ?? [];

        _setLoading(false);
        notifyListeners();
      },
    );
    return _countryListDtos;
  }

  void selectCountry(BuildContext context, CountryListData? country) {
    _selectedCountry = country;
    _selectedState = null; // reset state selection
    _statelists = []; // clear previous states

    if (country != null) {
      fetchStateList(context, country.id); // fetch states for this country
    }
    notifyListeners();
  }

  //FetchStateList
  StateListDtos? _stateListDtos;
  StateListDtos? get stateListDtos => _stateListDtos;

  List<StateListData> _statelists = [];
  List<StateListData> get statelists => _statelists;

  StateListData? _selectedState;
  StateListData? get selectedState => _selectedState;

  Future<StateListDtos?> fetchStateList(
    BuildContext context,
    int countryId,
  ) async {
    final result = await iCompanyCreationFacad.stateList(countryId);

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Fetch State List Failed : $_errorMessage");
        _setLoading(false);
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Fetch State List success : ${response.toJson()}");
        Logger.logSuccess("Status : ${response.status}");

        _stateListDtos = response;
        _statelists = _stateListDtos?.stateListData ?? [];

        _setLoading(false);
        notifyListeners();
      },
    );
    return _stateListDtos;
  }

  void selectState(StateListData? states) {
    _selectedState = states;
    notifyListeners();
  }

  ///Integration Type.......
  IntegrationSerialNo _integrationSerialNo = IntegrationSerialNo("");
  IntegrationSerialNo get integrationSerialNo => _integrationSerialNo;

  IntegrationDtos? _integrationDtos;
  IntegrationDtos? get integrationDtos => _integrationDtos;

  AutovalidateMode integrationSerialNoAutovalidateMode =
      AutovalidateMode.disabled;
  void updateIntegrationSerialNo(String input) {
    _integrationSerialNo = IntegrationSerialNo(input);
    notifyListeners();
  }

  bool validateIntegrationSerialNo() {
    return _integrationSerialNo.isValid();
  }

  String? selectedIntegrationType;
  String? integrationSerialNoController;
  bool stockInCloud = false;

  void setIntegrationType(String title) {
    selectedIntegrationType = title;
    notifyListeners();
  }

  void setIntegrationSerialNo(String serial) {
    integrationSerialNoController = serial;
    notifyListeners();
  }

  void setStockInCloud(bool value) {
    stockInCloud = value;
    notifyListeners();
  }

  Future<IntegrationDtos?> integration(
    BuildContext context, {
    required IntegrationParams params,
    VoidCallback? onSuccess,
  }) async {
    final isValid = validateIntegrationSerialNo();
    if (!isValid) {
      integrationSerialNoAutovalidateMode = AutovalidateMode.always;
      notifyListeners();
      return null;
    }

    final result = await iCompanyCreationFacad.integartion(
      BaseParams(data: params),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Integration Type failed : $_errorMessage");
        _setLoading(false);
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Integration Type success : ${response.toJson()}");
        Logger.logSuccess("Status : ${response.status}");
        _setLoading(false);
        notifyListeners();

        if (response.status == 1) {
          _integrationDtos = response;
          markStageCompleted(2);
          context.pushNamed(AppRouterConst.adminDashboard);
          onSuccess?.call();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message, textAlign: TextAlign.center),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message, textAlign: TextAlign.center),
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
    return _integrationDtos;
  }

  //CREATE COMPANY VOUCHER TYPE
  CreateCompanyvochertypeDtos? _createdVouchers;
  CreateCompanyvochertypeDtos? get createdVouchers => _createdVouchers;

  Future<CreateCompanyvochertypeDtos?> createCompanyVoucherTypes(
    BuildContext context, {
    required CreateCompanyVocherParams request,
    VoidCallback? onSuccess,
  }) async {
    _setLoading(true);

    final result = await iCompanyCreationFacad.createCompanyVoucher(
      BaseParams(data: request),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Create Voucher Types failed: $_errorMessage");
        _setLoading(false);
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Create Voucher success : ${response.toJson()}");
        Logger.logSuccess("Status : ${response.status}");
        _setLoading(false);
        notifyListeners();

        if (response.status == 1) {
          _createdVouchers = response;
          markStageCompleted(1);
          onSuccess?.call();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message, textAlign: TextAlign.center),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message, textAlign: TextAlign.center),
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
    return _createdVouchers;
  }

  // ======================================================================
  //                           VEHICLE MANAGEMENT (DDD)
  // ======================================================================

  final List<VehicleDetails> _vehicles = [];
  List<VehicleDetails> get vehicles => List.unmodifiable(_vehicles);

  // Autovalidation control
  AutovalidateMode vehicleAutovalidateMode = AutovalidateMode.disabled;

  // Use Value Objects
  VehicleName _vehicleName = VehicleName('');
  VehicleCode _vehicleCode = VehicleCode('');

  // Getters for UI access
  VehicleName get vehicleName => _vehicleName;
  VehicleCode get vehicleCode => _vehicleCode;

  // ========================== UPDATE METHODS ===========================

  void updateVehicleName(String input) {
    _vehicleName = VehicleName(input);
    notifyListeners();
  }

  void updateVehicleCode(String input) {
    _vehicleCode = VehicleCode(input);
    notifyListeners();
  }

  // =========================== VALIDATION ==============================

  void resetVehicleForm() {
    _vehicleName = VehicleName('');
    _vehicleCode = VehicleCode('');
    vehicleAutovalidateMode = AutovalidateMode.disabled;
    notifyListeners();
  }

  bool validateVehicle() {
    return _vehicleName.isValid() && _vehicleCode.isValid();
  }

  // =========================== SUBMIT / CRUD ============================

  Future<void> submitVehicle(BuildContext context) async {
    final isValid = validateVehicle();

    if (!isValid) {
      vehicleAutovalidateMode = AutovalidateMode.always;
      notifyListeners();
      return;
    }

    final name = _vehicleName.getOrCrash();
    final code = _vehicleCode.getOrCrash();

    addVehicle(name: name, code: code);
    vehicleAutovalidateMode = AutovalidateMode.disabled;
    Navigator.pop(context);
  }

  Future<void> _saveVehicles() async {
    final prefs = sl<SharedPreferences>();
    final jsonList = _vehicles.map((v) => jsonEncode(v.toJson())).toList();
    await prefs.setStringList("vehicles", jsonList);
  }

  void loadVehicles() {
    final prefs = sl<SharedPreferences>();
    final jsonList = prefs.getStringList("vehicles") ?? [];
    _vehicles
      ..clear()
      ..addAll(jsonList.map((e) => VehicleDetails.fromJson(jsonDecode(e))));
    notifyListeners();
  }

  void addVehicle({required String name, required String code}) {
    _vehicles.add(
      VehicleDetails(vehicleName: name, vehicleCode: code, status: "Active"),
    );
    _saveVehicles();
    notifyListeners();
  }

  void editVehicle(int index, String newName, String newCode) {
    _vehicles[index] = VehicleDetails(
      vehicleName: newName,
      vehicleCode: newCode,
      status: _vehicles[index].status,
    );
    _saveVehicles();
    notifyListeners();
  }

  void deleteVehicle(int index) {
    _vehicles.removeAt(index);
    _saveVehicles();
    notifyListeners();
  }

  void deactivateVehicle(int index) {
    _vehicles[index] = VehicleDetails(
      vehicleName: _vehicles[index].vehicleName,
      vehicleCode: _vehicles[index].vehicleCode,
      status: "Inactive",
    );
    _saveVehicles();
    notifyListeners();
  }

  void activateVehicle(int index) {
    _vehicles[index] = VehicleDetails(
      vehicleName: _vehicles[index].vehicleName,
      vehicleCode: _vehicles[index].vehicleCode,
      status: "Active",
    );
    _saveVehicles();
    notifyListeners();
  }

  // ======================================================================
  //                           ROUTE MANAGEMENT (DDD)
  // ======================================================================

  final List<RouteDetails> _routes = [];
  List<RouteDetails> get routes => List.unmodifiable(_routes);

  // Autovalidation control
  AutovalidateMode routeAutovalidateMode = AutovalidateMode.disabled;

  // Use Value Objects
  RouteName _routeName = RouteName('');
  RouteCode _routeCode = RouteCode('');

  // Getters for UI access
  RouteName get routeName => _routeName;
  RouteCode get routeCode => _routeCode;

  // ========================== UPDATE METHODS ===========================

  void updateRouteName(String input) {
    _routeName = RouteName(input);
    notifyListeners();
  }

  void updateRouteCode(String input) {
    _routeCode = RouteCode(input);
    notifyListeners();
  }

  // =========================== VALIDATION ==============================

  void resetRouteForm() {
    _routeName = RouteName('');
    _routeCode = RouteCode('');
    routeAutovalidateMode = AutovalidateMode.disabled;
    notifyListeners();
  }

  bool validateRoute() {
    return _routeName.isValid() && _routeCode.isValid();
  }

  // =========================== SUBMIT / CRUD ============================

  // Future<void> submitRoute(BuildContext context) async {
  //   final isValid = validateRoute();

  //   if (!isValid) {
  //     routeAutovalidateMode = AutovalidateMode.always;
  //     notifyListeners();
  //     return;
  //   }

  //   final name = _routeName.getOrCrash();
  //   final code = _routeCode.getOrCrash();

  //   addRoute(name: name, code: code);
  //   routeAutovalidateMode = AutovalidateMode.disabled;
  //   Navigator.pop(context);
  // }

  // Future<void> _saveRoutes() async {
  //   final prefs = sl<SharedPreferences>();
  //   final jsonList = _routes.map((v) => jsonEncode(v.toJson())).toList();
  //   await prefs.setStringList("routes", jsonList);
  // }

  // void loadRoutes() {
  //   final prefs = sl<SharedPreferences>();
  //   final jsonList = prefs.getStringList("routes") ?? [];
  //   _routes
  //     ..clear()
  //     ..addAll(jsonList.map((e) => RouteDetails.fromJson(jsonDecode(e))));
  //   notifyListeners();
  // }

  // void addRoute({required String name, required String code}) {
  //   _routes.add(
  //     RouteDetails(routeName: name, routeCode: code, status: "Active"),
  //   );
  //   _saveRoutes();
  //   notifyListeners();
  // }

  // void editRoute(int index, String newName, String newCode) {
  //   _routes[index] = RouteDetails(
  //     routeName: newName,
  //     routeCode: newCode,
  //     status: _routes[index].status,
  //   );
  //   _saveRoutes();
  //   notifyListeners();
  // }

  // void deleteRoute(int index) {
  //   _routes.removeAt(index);
  //   _saveRoutes();
  //   notifyListeners();
  // }

  // void deactivateRoute(int index) {
  //   _routes[index] = RouteDetails(
  //     routeName: _routes[index].routeName,
  //     routeCode: _routes[index].routeCode,
  //     status: "Inactive",
  //   );
  //   _saveRoutes();
  //   notifyListeners();
  // }

  // void activateRoute(int index) {
  //   _routes[index] = RouteDetails(
  //     routeName: _routes[index].routeName,
  //     routeCode: _routes[index].routeCode,
  //     status: "Active",
  //   );
  //   _saveRoutes();
  //   notifyListeners();
  // }

  //get companyvuchertypelist
  List<CompanyVoucherTypesListData> _voucherTypes = [];
  List<CompanyVoucherTypesListData> get voucherTypes => _voucherTypes;
  CompanyvouchertypeslistDtos? _companyvouchertypeslistDtos;
  CompanyvouchertypeslistDtos? get companyvouchertypeslistDtos =>
      _companyvouchertypeslistDtos;
  Future<CompanyvouchertypeslistDtos?> fetchVoucherTypes(
    BuildContext context,
    int companyID,
  ) async {
    _setLoading(true);

    final result = await iCompanyCreationFacad.getVoucherType(companyID);
    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Fetch Voucher Types failed: $_errorMessage");
      },

      (response) {
        if (response.status == 1) {
          _errorMessage = null;
          _companyvouchertypeslistDtos = response;

          _voucherTypes = response.companyVoucherTypesList;
          // Logger.logSuccess(
          //   "Voucher Types fetched successfully: $_voucherTypes",
          // );

          notifyListeners();
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text("Voucher Types fetched successfully")),
          // );
        } else {
          _errorMessage = "Unexpected status: ${response.status}";
        }
      },
    );

    _setLoading(false);
    notifyListeners();
    return _companyvouchertypeslistDtos;
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //========================= Users List =========================

  Future<CompaniesListResponse?> getAllCompanies(BuildContext context) async {
    final result = await iCompanyCreationFacad.getAllCompany();

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
        _companyController.add(companiesList?.companyViewList ?? []);
        Logger.logSuccess(
          "Company List fetch successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    return _companiesList;
  }

  //========================= Create Godown Or Vehicle Mapping =========================

  Future<GodownResponse?> createGodown({
    required BuildContext context,
    required int userId,
    required int companyId,
    required String code,
    required String name,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.createGodown(
      BaseParams(
        data: CreateGodownParams(
          id: userId,
          companyId: companyId,
          code: code,
          name: name,
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
        _godownResponse = response;
        Logger.logSuccess("Godown Created successfull : ${response.toJson()}");
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
        final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllGodowns(context: context, companyId: companyId);
        });
        notifyListeners();
      },
    );
    setLoading(false);
    return _godownResponse;
  }

  //========================= Get Godown List =========================

  Future<GodownListModel?> getAllGodowns({
    required BuildContext context,
    required String companyId,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.getAllGodowns(
      companyId: companyId,
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
        _godownListResponse = response;
        _godownController.add(_godownListResponse?.vehicleList ?? []);

        Logger.logSuccess(
          "Godown List fetch successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    return _godownListResponse;
  }

  //========================= Godown Activation =========================

  Future<GodownResponse?> activateGodown(
    BuildContext context, {
    required String mid,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.activateGodown(mid: mid);

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
        _godownResponse = response;
        Logger.logSuccess(
          "Godown activated successfull : ${response.toJson()}",
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
        // getAllGodowns(context: context,companyId: );
        final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllGodowns(context: context, companyId: companyId);
        });
        notifyListeners();
      },
    );
    setLoading(false);
    return _godownResponse;
  }

  //========================= Deactivation Godown =========================

  Future<GodownResponse?> deactivateGodown(
    BuildContext context, {
    required String mid,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.deactivateGodown(mid: mid);

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
        _godownResponse = response;
        Logger.logSuccess(
          "Godown deactivated successfull : ${response.toJson()}",
        );
        // getAllGodowns(context: context,companyId: );
        final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllGodowns(context: context, companyId: companyId);
        });
        notifyListeners();
      },
    );
    setLoading(false);
    return _godownResponse;
  }

  //========================= Delete Godown =========================

  Future<GodownResponse?> deleteGodown(
    BuildContext context, {
    required String mid,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.deleteGodown(mid: mid);

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
        _godownResponse = response;
        Logger.logSuccess("Godown deleted successfull : ${response.toJson()}");
        // getAllGodowns(context: context,companyId: );
        final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllGodowns(context: context, companyId: companyId);
        });
        notifyListeners();
      },
    );
    setLoading(false);
    return _godownResponse;
  }

  //========================= Create Route =========================

  Future<RouteResponse?> createRoute({
    required BuildContext context,
    required int id,
    required int companyId,
    required String routeCode,
    required String routeName,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.createRoute(
      BaseParams(
        data: CreateRouteParams(
          id: id,
          companyId: companyId,
          routeCode: routeCode,
          routeName: routeName,
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
        _routeResponse = response;
        Logger.logSuccess("Route Created successfull : ${response.toJson()}");
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
        final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllRoutess(context: context, companyId: companyId);
        });
        notifyListeners();
      },
    );
    setLoading(false);
    return _routeResponse;
  }

  //========================= Get Route List =========================

  Future<RouteListModel?> getAllRoutess({
    required BuildContext context,
    required String companyId,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.getRouteList(
      companyId: companyId,
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
        _routeListResponse = response;
        _routeController.add(_routeListResponse?.routeList ?? []);
        // _companyListController.add(_companiesList);
        Logger.logSuccess(
          "Route List fetch successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    return _routeListResponse;
  }

  //========================= Route Activation =========================

  Future<RouteResponse?> activateRoute(
    BuildContext context, {
    required String routeId,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.activateRoute(routeId: routeId);

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
        _routeResponse = response;
        Logger.logSuccess("Route activated successfull : ${response.toJson()}");
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
        final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllRoutess(context: context, companyId: companyId);
        });
        notifyListeners();
      },
    );
    setLoading(false);
    return _routeResponse;
  }

  //========================= Deactivation Godown =========================

  Future<RouteResponse?> deactivateRoute(
    BuildContext context, {
    required String routeId,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.deactivateRoute(
      routeId: routeId,
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
        _routeResponse = response;
        Logger.logSuccess(
          "Route deactivated successfull : ${response.toJson()}",
        );
        final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllRoutess(context: context, companyId: companyId);
        });

        notifyListeners();
      },
    );
    setLoading(false);
    return _routeResponse;
  }

  //========================= Delete Route =========================

  Future<RouteResponse?> deleteRoute(
    BuildContext context, {
    required String routeId,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.deleteRoute(routeId: routeId);

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
        _routeResponse = response;
        Logger.logSuccess("Route deleted successfull : ${response.toJson()}");
        final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllRoutess(context: context, companyId: companyId);
        });
        notifyListeners();
      },
    );
    setLoading(false);
    return _routeResponse;
  }

 
}
 


  // final Map<String, bool> _voucherStates = {
  //   "Sales Order": false,
  //   "Sales": false,
  //   "Sales Return": false,
  //   "Receipt": false,
  //   "Payment": false,
  //   "Purchase": false,
  //   "Purchase Return": false,
  //   "Expenses": false,
  //   "Feedbacks": false,
  // };

  // Map<String, bool> get voucherStates => _voucherStates;

  // bool getValue(String title) => _voucherStates[title] ?? false;

  // void toggleValue(String title, bool? value) {
  //   _voucherStates[title] = value ?? false;
  //   notifyListeners();
  // }
