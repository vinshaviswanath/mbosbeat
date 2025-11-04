import 'dart:convert';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/failures/value_object/value_object.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/create_companySettings_model.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/data/models/data/get_all_company_settings_data.dart';
import 'package:mpos_beat/data/models/data/registration_type_data.dart';
import 'package:mpos_beat/data/models/get_all_company_settings_model.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/data/models/create_godown_response.dart';
import 'package:mpos_beat/data/models/create_route_response.dart';
import 'package:mpos_beat/data/models/create_voucher_numbering_response.dart';
import 'package:mpos_beat/data/models/get_company_voucher_model.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/country_list_response.dart';
import 'package:mpos_beat/data/models/data/country_list_data.dart';
import 'package:mpos_beat/data/models/data/state_list_data.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/data/models/integration_model.dart';
import 'package:mpos_beat/data/models/registration_type_model.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';
import 'package:mpos_beat/data/models/state_list_response.dart';
import 'package:mpos_beat/data/models/voucher_numbering_response.dart';
import 'package:mpos_beat/domain/repositories/i_company_creation_facad.dart';
import 'package:mpos_beat/domain/request/company_creation_params.dart';
import 'package:mpos_beat/domain/request/create_company_settings_request.dart';
import 'package:mpos_beat/domain/request/create_comany_user_mapping_params.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/domain/request/create_godown_params.dart';
import 'package:mpos_beat/domain/request/create_route_params.dart';
import 'package:mpos_beat/domain/request/create_voucher_numbering_params.dart';
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
    _companyid = companyId;
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
  List<CompanyVoucherTypesListData> _voucherTypes = [];
  List<CompanyVoucherTypesListData> get voucherTypes => _voucherTypes;
  CompanyvouchertypeslistDtos? _companyvouchertypeslistDtos;
  CompanyvouchertypeslistDtos? get companyvouchertypeslistDtos =>
      _companyvouchertypeslistDtos;
  CreateCompanyvochertypeDtos? _createdVouchers;
  CreateCompanyvochertypeDtos? get createdVouchers => _createdVouchers;
  CountryListDtos? _countryListDtos;
  CountryListDtos? get coountryListdtos => _countryListDtos;

  List<CountryListData> _countries = [];
  List<CountryListData> get countries => _countries;

  CountryListData? _selectedCountry;
  CountryListData? get selectedCountry => _selectedCountry;
  StateListDtos? _stateListDtos;
  StateListDtos? get stateListDtos => _stateListDtos;

  List<StateListData> _statelists = [];
  List<StateListData> get statelists => _statelists;

  StateListData? _selectedState;
  StateListData? get selectedState => _selectedState;

  IntegrationDtos? _integrationDtos;
  IntegrationDtos? get integrationDtos => _integrationDtos;

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
  CreateVoucherNumberingResponse? _voucherNumberingResponsel;
  CreateVoucherNumberingResponse? get voucherNumberingResponsel =>
      _voucherNumberingResponsel;

  final _voucherNumberingController =
      StreamController<List<VoucherNumberingModel>>.broadcast();
  Stream<List<VoucherNumberingModel>> get voucherNumberingStream =>
      _voucherNumberingController.stream;
  VoucherNumberingResponse? _voucherNumberingResponse;
  VoucherNumberingResponse? get voucherNumberingResponse =>
      _voucherNumberingResponse;

  VehicleList? _selectedVehicle;
  VehicleList? get selectedVehicle => _selectedVehicle;

  RouteList? _selectedRoute;
  RouteList? get selectedRoute => _selectedRoute;

  final List<VoucherNumber> _voucherNumberList = [];
  List<VoucherNumber>? get voucherNumberList => _voucherNumberList;

  void addOrUpdateVoucherNumber(VoucherNumber voucher) {
    final index = _voucherNumberList!.indexWhere(
      (v) => v.voucherTypeId == voucher.voucherTypeId,
    );

    if (index != -1) {
      _voucherNumberList[index] = voucher;
    } else {
      _voucherNumberList.add(voucher);
    }

    Logger.logSuccess(
      "VoucherNumberList ::::::::::::::::::::::::::::    ${_voucherNumberList.map((e) => e.toJson())}",
    );

    notifyListeners();
  }

  void setSelectedVehicle(VehicleList vehicle) {
    _selectedVehicle = vehicle;
    Logger.logSuccess("Selected Godown : ${selectedVehicle?.toJson()}");
    notifyListeners();
  }

  void setSelectedRoute(RouteList route) {
    _selectedRoute = route;
    Logger.logSuccess("Selected Route : ${selectedRoute?.toJson()}");
    notifyListeners();
  }

  void toggleVoucher(BuildContext context) {
    _isGodown = !_isGodown;
    final companyId =
        sl<SharedPreferences>().getInt('selected_company_id')?.toString() ?? '';
    getVoucherNumbering(
      context: context,
      companyId: companyId,
      voucherModeId: _isGodown
          ? selectedVehicle?.id ?? 0
          : selectedRoute?.id ?? 0,
    );
    Logger.logSuccess("Godown Id : ${selectedVehicle?.id}, Route id :${selectedRoute?.id} ");
    notifyListeners();
    if (isGodown) {
      getAllGodowns(context: context, companyId: companyId);
    } else {
      getAllRoutess(context: context, companyId: companyId);
    }
  }

  // bool _isExpand = false;
  // bool get isExpand => _isExpand;

  // void toggleCheckBox() {
  //   _isExpand = !_isExpand;
  //   notifyListeners();
  // }

  final formKey = GlobalKey<FormState>();

  // void activatePlan(String planTitle) {
  //   _activePlan = planTitle;
  //   notifyListeners();
  // }

  // void deactivatePlan() {
  //   _activePlan = null;
  //   notifyListeners();
  // }

  // bool isPlanActive(String planTitle) => _activePlan == planTitle;
  bool isStageCompleted(int index) => stageCompleted[index];

  /// ✅ Update stage completion based on backend data
  void updateStageCompletionFromCompanyData(CompanyViewList company) {
    // if company id > 0 → company info is completed
    stageCompleted[0] = company.id != null && company.id! > 0;

    // Voucher setup done if backend gives any non-zero value
    stageCompleted[1] =
        company.hasVoucherTypeSettings != null &&
        company.hasVoucherTypeSettings != 0;

    // Integration setup done if backend gives any non-zero value
    stageCompleted[2] =
        company.hasIntegrationSettings != null &&
        company.hasIntegrationSettings != 0;

    print('updateStageCompletionFromCompanyData: $stageCompleted');

    notifyListeners();
  }

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

          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final prefs = sl<SharedPreferences>();
            await prefs.setInt('selected_company_id', _companyCreationDtos!.id);
            final companyId = prefs.getInt('selected_company_id');
            Logger.logSuccess(
              "Company info tab SELECTED COMPANY ID: $companyId",
            );
          });
          getCompanyId();
          getAllCompanies(context);
          markStageCompleted(0);
          onSuccess?.call();
          notifyListeners();
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
    _registrationlists = []; // clear previous registration types
    _selectedregistrationtype = null; // reset registration type selection
    if (country != null) {
      fetchStateList(context, country.id); // fetch states for this country
      getRegistrationType(context, country.id);
    }
    notifyListeners();
  }

  //FetchStateList

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

  //GetRegisrationType
  RegistrationTypeDtos? _registrationTypeDtos;
  RegistrationTypeDtos? get registrationTypeDtos => _registrationTypeDtos;

  List<RegistrationTypeData> _registrationlists = [];
  List<RegistrationTypeData> get registrationlists => _registrationlists;

  RegistrationTypeData? _selectedregistrationtype;
  RegistrationTypeData? get selectedregistrationtype =>
      _selectedregistrationtype;

  Future<RegistrationTypeDtos?> getRegistrationType(
    BuildContext context,
    int countryId,
  ) async {
    final result = await iCompanyCreationFacad.getRegistrationType(countryId);

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Fetch Registration List Failed : $_errorMessage");
        _setLoading(false);
        notifyListeners();
      },
      (response) {
        Logger.logSuccess(
          "Fetch Registration List success : ${response.toJson()}",
        );
        Logger.logSuccess("Status : ${response.status}");

        _registrationTypeDtos = response;
        _registrationlists =
            _registrationTypeDtos?.registrationTypeListData ?? [];

        _setLoading(false);
        notifyListeners();
      },
    );
    return _registrationTypeDtos;
  }

  void selectRegistrationType(RegistrationTypeData? registrationTypelist) {
    _selectedregistrationtype = registrationTypelist;
    notifyListeners();
  }

  ///Integration Type.......
  IntegrationSerialNo _integrationSerialNo = IntegrationSerialNo("");
  IntegrationSerialNo get integrationSerialNo => _integrationSerialNo;

  AutovalidateMode integrationSerialNoAutovalidateMode =
      AutovalidateMode.disabled;

  void updateIntegrationSerialNo(String input) {
    _integrationSerialNo = IntegrationSerialNo(input);
    notifyListeners();
  }

  bool validateIntegrationSerialNo() {
    return _integrationSerialNo.isValid();
  }

  String? _selectedIntegrationType;
  String? get selectedIntegrationType => _selectedIntegrationType;

  String? integrationSerialNoController;
  bool stockInCloud = false;

  void setIntegrationType(String title) {
    _selectedIntegrationType = title;
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

  void resetIntegration() {
    _selectedIntegrationType = null;
    stockInCloud = false;
    integrationSerialNoController = null;
    _integrationSerialNo = IntegrationSerialNo("");
    integrationSerialNoAutovalidateMode = AutovalidateMode.disabled;
    notifyListeners();
  }

  int _integrationResetKey = 0;
  int get integrationResetKey => _integrationResetKey;

  void triggerFullReset() {
    _integrationResetKey++;
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

  //GetAllCompanySettings
  List<CompanySettingsListData> _comapanySettingsListData = [];
  List<CompanySettingsListData> get comapanySettingsListData =>
      _comapanySettingsListData;
  CompanysettingslistDtos? _companySettingslistDtos;
  CompanysettingslistDtos? get companySettingslistDtos =>
      _companySettingslistDtos;
  Future<CompanysettingslistDtos?> getCompanySettings(
    BuildContext context,
    int companyID,
  ) async {
    _setLoading(true);

    final result = await iCompanyCreationFacad.getCompanySettings(companyID);
    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Fetch Company Settings failed: $_errorMessage");
        _setLoading(false);
        notifyListeners();
      },

      (response) {
        Logger.logSuccess(
          "Fetch Company Settings successfully: $_voucherTypes",
        );
        Logger.logSuccess("Status : ${response.status}");
        _companySettingslistDtos = response;
        _comapanySettingsListData = response.companySettingsList;
        _setLoading(false);
        notifyListeners();

        // if (response.status == 1) {
        //   _errorMessage = null;

        //   notifyListeners();
        //   // ScaffoldMessenger.of(context).showSnackBar(
        //   //   const SnackBar(content: Text("Voucher Types fetched successfully")),
        //   // );
        // } else {
        //   _errorMessage = "Unexpected status: ${response.status}";
        // }
      },
    );
    return _companySettingslistDtos;
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

  Future<CompanyvouchertypeslistDtos?> fetchVoucherTypes(
    BuildContext context,
    // int companyID,
  ) async {
    _setLoading(true);
    final prefs = sl<SharedPreferences>();

    final companyId = prefs.getInt('selected_company_id');
    final result = await iCompanyCreationFacad.getVoucherType(companyId ?? 0);
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

  CreateCompanySettingsDtos? _createCompanySettingsDtos;
  CreateCompanySettingsDtos? get createCompanySettingsDtos =>
      _createCompanySettingsDtos;
  //create company settings
  Future<CreateCompanySettingsDtos?> createCompanySettings(
    BuildContext context, {
    required CreateCompanysettingsParams param,
    VoidCallback? onSuccess,
  }) async {
    final result = await iCompanyCreationFacad.createCompanySettings(
      BaseParams(data: param),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Create Company Settings failed: $_errorMessage");
        _setLoading(false);
        notifyListeners();
        notifyListeners();
      },
      (response) {
        Logger.logSuccess(
          "Create Company Settings success : ${response.toJson()}",
        );
        Logger.logSuccess("Status : ${response.status}");
        _setLoading(false);
        notifyListeners();

        if (response.status == 1) {
          _createCompanySettingsDtos = response;
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
    return _createCompanySettingsDtos;
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

  //========================= Create Voucher Numbering =========================

  Future<CreateVoucherNumberingResponse?> createVoucherNumbering({
    required BuildContext context,
    required int companyId,
    required int voucherModeId,
    required List<VoucherNumber> voucherNumbers,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.createVoucherNumber(
      BaseParams(
        data: CreateVoucherNumberingParams(
          companyId: companyId,
          voucherMode: _isGodown ? "Godown" : "Route",
          voucherModeId: voucherModeId,
          voucherNumbers: voucherNumbers,
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
        _voucherNumberingResponsel = response;
        Logger.logSuccess(
          "Voucher numbering created successfull : ${response.toJson()}",
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
      },
    );
    setLoading(false);
    return _voucherNumberingResponsel;
  }

  //========================= Get Voucher Numbering =========================

  Future<VoucherNumberingResponse?> getVoucherNumbering({
    required BuildContext context,
    required String companyId,
    required int voucherModeId,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.getVoucherNumbering(
      companyId: companyId,
      voucherMode: _isGodown ? "Godown" : "Route",
      voucherModeId: voucherModeId,
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
        _voucherNumberingResponse = response;
        _voucherNumberingController.add(
          _voucherNumberingResponse?.voucherNumberingModels ?? [],
        );
        Logger.logSuccess(
          "voucher numbering list fetch successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    return _voucherNumberingResponse;
  }
}
