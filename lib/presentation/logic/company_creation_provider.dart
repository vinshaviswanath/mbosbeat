import 'dart:convert';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/failures/value_object/value_object.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/complete_voucher_settings_model.dart';
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
import 'package:mpos_beat/presentation/views/route_wise_screen/widgets/add_route.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyCreationProvider extends ChangeNotifier {
  final ICompanyCreationFacad iCompanyCreationFacad;
  final AppDb db;
  CompanyCreationProvider(this.iCompanyCreationFacad, {required this.db});

  String? _activePlan;

  String? get activePlan => _activePlan;

  final Set<int> _completedStages = {};

  Set<int> get completedStages => _completedStages;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<bool> stageCompleted = [false, false, false];

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

  ResponseModel? _responseModel;
  ResponseModel? get responseModel => _responseModel;

  final _voucherNumberingGodownController =
      StreamController<List<VoucherNumberingModel>>.broadcast();
  Stream<List<VoucherNumberingModel>> get voucherNumberingGodownStream =>
      _voucherNumberingGodownController.stream;
  VoucherNumberingResponse? _voucherNumberingGodownResponse;
  VoucherNumberingResponse? get voucherNumberingGodownResponse =>
      _voucherNumberingGodownResponse;

  final _voucherNumberingRouteController =
      StreamController<List<VoucherNumberingModel>>.broadcast();
  Stream<List<VoucherNumberingModel>> get voucherNumberingRouteStream =>
      _voucherNumberingRouteController.stream;
  VoucherNumberingResponse? _voucherNumberingRouteResponse;
  VoucherNumberingResponse? get voucherNumberingRouteResponse =>
      _voucherNumberingRouteResponse;

  VehicleList? _selectedVehicle;
  VehicleList? get selectedVehicle => _selectedVehicle;

  RouteList? _selectedRoute;
  RouteList? get selectedRoute => _selectedRoute;

  final List<VoucherNumber> _voucherNumberList = [];
  List<VoucherNumber>? get voucherNumberList => _voucherNumberList;

  CompanyViewList? _selectedCompany;
  bool _isGodown = true;

  CompanyViewList? get selectedCompany => _selectedCompany;
  bool get isGodown => _isGodown;

  String version = "";

  Future<void> fetchVersion() async {
    final info = await PackageInfo.fromPlatform();
    version = "${info.version}+${info.buildNumber}";
    notifyListeners();
  }

  void setSelectedCompany({required CompanyViewList company}) {
    _selectedCompany = company;
    _isGodown =
        company.vchNumberingMode == null ||
        company.vchNumberingMode == "Godown";

    notifyListeners();
  }

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

  void resetSelections() {
  _selectedVehicle = null;
  _selectedRoute = null;
  notifyListeners();
}


  void toggleVoucher(BuildContext context) {
    _isGodown = !_isGodown;
    final companyId = selectedCompany?.id;

    // getVoucherNumbering(
    //   context: context,
    //   companyId: companyId,
    //   voucherModeId: _isGodown
    //       ? selectedVehicle?.id ?? 0
    //       : selectedRoute?.id ?? 0,
    // );
    Logger.logSuccess(
      "Godown Id : ${selectedVehicle?.id}, Route id :${selectedRoute?.id} ",
    );
    setVoucherNumberingMode(
      context: context,
      companyId: _selectedCompany?.id.toString() ?? '',
      voucherMode: _isGodown ? "Godown" : "Route",
    );
    getAllRoutess(context: context, companyId: companyId.toString());
    if (isGodown) {
      if (_isGodown) {
        getAllGodowns(context: context, companyId: companyId.toString());
        if (selectedVehicle != null) {
          getVoucherNumberingGodown(
            context: context,
            companyId: companyId.toString(),
            voucherModeId: selectedVehicle?.id ?? 0,
          );
        }
      } else {
        getAllRoutess(context: context, companyId: companyId.toString());
        if (selectedRoute != null) {
          getVoucherNumberingRoute(
            context: context,
            companyId: companyId.toString(),
            voucherModeId: selectedVehicle?.id ?? 0,
          );
        }
      }

      Logger.logSuccess("Switched to ${_isGodown ? 'Godown' : 'Route'} wise");

      notifyListeners();
    }
  }

  final formKey = GlobalKey<FormState>();

  // bool isPlanActive(String planTitle) => _activePlan == planTitle;
  bool isStageCompleted(int index) => stageCompleted[index];

  ///  Update stage completion based on backend data
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

  void resetStageCompletion() {
    stageCompleted = [false, false, false];
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
  Address2 _address2 = Address2("");
  Address3 _address3 = Address3("");
  Pincode _pincode = Pincode("");
  Country _country = Country("");
  CountryState _countryState = CountryState("");
  RegistrationType _registrationType = RegistrationType("");

  AutovalidateMode companyinfoAutovalidateMode = AutovalidateMode.disabled;
  CompanyName get companyName => _companyName;
  DisplayName get displayName => _displayName;
  Address1 get address1 => _address1;
  Address2 get address2 => _address2;
  Address3 get address3 => _address3;
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

  void updateAddress2(String input) {
    _address1 = Address1(input);
    notifyListeners();
  }

  void updateAddress3(String input) {
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

  void resetCompanyInfo() {
    _companyName = CompanyName('');
    _displayName = DisplayName('');
    _address1 = Address1('');
    _pincode = Pincode('');
    _country = Country('');
    _selectedCountry = CountryListData(
      id: 0,
      countryName: "",
      stateTitle: "",
      pinTitle: "",
      currency: "",
      altCurrency: "",
      currencyNod: 0,
      currencySymbol: "",
      taxApplicable: "",
      taxType: "",
      taxRegNoTitle: "",
      cessApplicable: "",
      exciseApplicable: "",
    );
    _selectedState = StateListData(id: 0, countryId: 0, stateName: "");
    _selectedregistrationtype = RegistrationTypeData(
      id: 0,
      countryId: 0,
      registrationType: "",
    );
    companyinfoAutovalidateMode = AutovalidateMode.disabled;
  }

  //CompanyInformations....
  Future<CompanyInfoDtos?> companyinfo(
    BuildContext context, {
    required CompanyInfoParams params,
    VoidCallback? onSuccess,
  }) async {
    setLoading(true);

    final isValid = validateCompanyInfoFields();
    if (!isValid) {
      companyinfoAutovalidateMode = AutovalidateMode.always;
      notifyListeners();
      setLoading(false);

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
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Comapany Info success : ${response.toJson()}");
        Logger.logSuccess("Status : ${response.status}");
        Logger.logSuccess("Company ID : ${response.id}");

        notifyListeners();

        if (response.status == 1) {
          _companyCreationDtos = response;
          _companyid = _companyCreationDtos!.id;
          // resetCompanyInfo();
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            // final prefs = sl<SharedPreferences>();
            // await prefs.setInt('selected_company_id', _companyCreationDtos!.id);
            // final companyId = prefs.getInt('selected_company_id');
            Logger.logSuccess(
              "Company info tab SELECTED COMPANY ID: $_companyid",
            );
          });
          // getCompanyId();
          //getAllCompanies(context);
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
    setLoading(false);
    notifyListeners();

    return _companyCreationDtos;
  }

  //fetchCountryList........

  Future<CountryListDtos?> fectchCountryList(BuildContext context) async {
    setLoading(true);

    final result = await iCompanyCreationFacad.countryList();

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Fetch Country List Failed : $_errorMessage");
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Fetch Country List success : ${response.toJson()}");
        Logger.logSuccess("Status : ${response.status}");

        _countryListDtos = response;
        _countries = _countryListDtos?.countryListData ?? [];

        notifyListeners();
      },
    );

    setLoading(false);
    notifyListeners();
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
    setLoading(true);

    final result = await iCompanyCreationFacad.stateList(countryId);

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Fetch State List Failed : $_errorMessage");
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Fetch State List success : ${response.toJson()}");
        Logger.logSuccess("Status : ${response.status}");

        _stateListDtos = response;
        _statelists = _stateListDtos?.stateListData ?? [];

        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
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
    setLoading(true);

    final result = await iCompanyCreationFacad.getRegistrationType(countryId);

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Fetch Registration List Failed : $_errorMessage");
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

        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
    return _registrationTypeDtos;
  }

  void selectRegistrationType(RegistrationTypeData? registrationTypelist) {
    _selectedregistrationtype = registrationTypelist;
    notifyListeners();
  }

  void clearSelections() {
    _selectedCountry = null;
    _selectedState = null;
    _selectedregistrationtype = null;
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

  bool _isIntegrationActive = false;
  bool get isIntegrationActive => _isIntegrationActive;

  void setIntegrationActive(value) {
    _isIntegrationActive = value;
  }

  void resetIntegration() {
    _selectedIntegrationType = null;
    stockInCloud = false;
    integrationSerialNoController = null;
    _isIntegrationActive = false;
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

  // Future<IntegrationDtos?> integration(
  //   BuildContext context, {
  //   required IntegrationParams params,
  //   VoidCallback? onSuccess,
  // }) async {
  //       setLoading(true);

  //   final integrationType = _selectedIntegrationType;
  //   final isStandAlone = integrationType == "Stand Alone";
  //   final isValid = validateIntegrationSerialNo();

  //   if (!isValid && !isStandAlone) {
  //     integrationSerialNoAutovalidateMode = AutovalidateMode.always;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           "Please select any one integration",
  //           textAlign: TextAlign.center,
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //       ),
  //     );

  //     notifyListeners();
  //       setLoading(false);
  //     return null;
  //   } else if (!_isIntegrationActive && !isStandAlone) {
  //     print('isIntegrationActive......$isIntegrationActive');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           "Please activate the selected integration",
  //           textAlign: TextAlign.center,
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //       ),
  //     );

  //     notifyListeners();
  //       setLoading(false);
  //     return null;
  //   }

  //   final result = await iCompanyCreationFacad.integartion(
  //     BaseParams(data: params),
  //   );

  //   result.fold(
  //     (failure) {
  //       _errorMessage = failure.errorMsg.toString();
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
  //       Logger.logError("Integration Type failed : $_errorMessage");
  //       notifyListeners();
  //     },
  //     (response) {
  //       Logger.logSuccess("Integration Type success : ${response.toJson()}");
  //       Logger.logSuccess("Status : ${response.status}");
  //       notifyListeners();

  //       if (response.status == 1) {
  //         _integrationDtos = response;
  //         markStageCompleted(2);
  //         context.pushNamed(AppRouterConst.adminDashboard);
  //         onSuccess?.call();
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(response.message, textAlign: TextAlign.center),
  //             behavior: SnackBarBehavior.floating,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(16),
  //             ),
  //             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //           ),
  //         );
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(response.message, textAlign: TextAlign.center),
  //             behavior: SnackBarBehavior.floating,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(16),
  //             ),
  //             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //           ),
  //         );
  //       }
  //     },
  //   );
  //       setLoading(false);

  //   return _integrationDtos;
  // }

  Future<IntegrationDtos?> integration(
    BuildContext context, {
    required IntegrationParams params,
    VoidCallback? onSuccess,
  }) async {
    setLoading(true);

    final integrationType = _selectedIntegrationType;
    final isStandAlone = integrationType == "Stand Alone";
    final isValid = validateIntegrationSerialNo();

    if (!isValid && !isStandAlone) {
      integrationSerialNoAutovalidateMode = AutovalidateMode.always;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "Please select any one integration",
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      );
      setLoading(false);
      return null;
    }

    if (!_isIntegrationActive && !isStandAlone) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "Please activate the selected integration",
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      );
      setLoading(false);
      return null;
    }

    try {
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
        },
        (response) {
          Logger.logSuccess("Integration Type success : ${response.toJson()}");

          if (response.status == 1) {
            _integrationDtos = response;
            markStageCompleted(2);
            context.pushNamed(AppRouterConst.adminDashboard);
            onSuccess?.call();
          }

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
        },
      );
    } catch (e) {
      Logger.logError("Integration exception: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
    } finally {
      setLoading(false); // ensures loading stops in all cases
    }

    return _integrationDtos;
  }

  //CREATE COMPANY VOUCHER TYPE
  Future<CreateCompanyvochertypeDtos?> createCompanyVoucherTypes(
    BuildContext context, {
    required CreateCompanyVocherParams request,
    VoidCallback? onSuccess,
  }) async {
    setLoading(true);

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
        notifyListeners();
      },
      (response) {
        Logger.logSuccess("Create Voucher success : ${response.toJson()}");
        Logger.logSuccess("Status : ${response.status}");
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
    setLoading(false);
    notifyListeners();
    return _createdVouchers;
  }

  //GetAllCompanySettings
final _settingsController =
      StreamController<List<CompanySettingsListData>>.broadcast();

  Stream<List<CompanySettingsListData>> get settingsStream =>
      _settingsController.stream;

        List<CompanySettingsListData> _comapanySettingsListData = [];
  List<CompanySettingsListData> get comapanySettingsListData =>
      _comapanySettingsListData;

  CompanysettingslistDtos? _companySettingslistDtos;

  Future<CompanysettingslistDtos?> getCompanySettings(
    BuildContext context,
    int companyID,
  ) async {
    setLoading(true);

    final result = await iCompanyCreationFacad.getCompanySettings(companyID);
    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Fetch Company Settings failed: $_errorMessage");
        notifyListeners();
      },

      (response) {
        Logger.logSuccess("Status : ${response.status}");
        _companySettingslistDtos = response;
        _comapanySettingsListData = response.companySettingsList;
        _settingsController.add(_comapanySettingsListData);
      },
    );
    setLoading(false);
    // notifyListeners();
    return _companySettingslistDtos;
  }

  //completeVoucherSettings
  CompleteVoucherSettingsDtos? _completeVoucherSettingsDtos;
  CompleteVoucherSettingsDtos? get completeVoucherSettingsDtos =>
      _completeVoucherSettingsDtos;

  Future<CompleteVoucherSettingsDtos?> completeVouchers(
    BuildContext context, {
    int? companyId,
    VoidCallback? onSuccess,
  }) async {
    setLoading(true);

    final result = await iCompanyCreationFacad.completeVouchers(companyId ?? 0);

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Complete Voucher Settings failed : $_errorMessage");
        notifyListeners();
      },
      (response) {
        Logger.logSuccess(
          "Complete Voucher Settings success : ${response.toJson()}",
        );
        Logger.logSuccess("Status : ${response.status}");
        notifyListeners();

        if (response.status == 1) {
          _completeVoucherSettingsDtos = response;
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(response.message, textAlign: TextAlign.center),
          //     behavior: SnackBarBehavior.floating,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(16),
          //     ),
          //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   ),
          // );
        } else {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(response.message, textAlign: TextAlign.center),
          //     behavior: SnackBarBehavior.floating,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(16),
          //     ),
          //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   ),
          // );
        }
      },
    );
    setLoading(false);
    notifyListeners();
    return _completeVoucherSettingsDtos;
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

  //get companyvuchertypelist
  Future<CompanyvouchertypeslistDtos?> fetchVoucherTypes(
    BuildContext context,
    int companyId,
    // int companyID,
  ) async {
    setLoading(true);
    //final prefs = sl<SharedPreferences>();

    //final companyId = prefs.getInt('selected_company_id');
    final result = await iCompanyCreationFacad.getVoucherType(companyId);
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

    setLoading(false);
    notifyListeners();
    return _companyvouchertypeslistDtos;
  }

  // void _setLoading(bool value) {
  //   _isLoading = value;
  //   notifyListeners();
  // }

  CreateCompanySettingsDtos? _createCompanySettingsDtos;
  CreateCompanySettingsDtos? get createCompanySettingsDtos =>
      _createCompanySettingsDtos;
  //create company settings
    Future<CreateCompanySettingsDtos?> createCompanySettings(
    BuildContext context, {
    required CreateCompanysettingsParams param,
  }) async {
    final result = await iCompanyCreationFacad.createCompanySettings(
      BaseParams(data: param),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Create Setting failed: $_errorMessage");
      },
      (response) {
        Logger.logSuccess("Setting updated: ${response.message}");
      },
    );

    return _createCompanySettingsDtos;
  }


  Future<void> updateParentAndChildren(
    BuildContext context,
    int parentId,
    bool newValue,
    int companyId,
  ) async {
    String parentValue = newValue ? "Yes" : "No";

    // UPDATE PARENT LOCALLY
    for (var item in _comapanySettingsListData) {
      if (item.id == parentId) {
        item.settingsValue = parentValue;
      }
    }

    // STREAM UPDATE
    _settingsController.add(_comapanySettingsListData);

    // API UPDATE FOR PARENT
    await createCompanySettings(
      context,
      param: CreateCompanysettingsParams(
        id: parentId,
        companyid: companyId,
        settingsvalue: parentValue,
      ),
    );

    // IF PARENT TURNED OFF → TURN OFF CHILDREN
    if (!newValue) {
      final children = _comapanySettingsListData
          .where((item) => item.parentId == parentId)
          .toList();

      for (var child in children) {
        child.settingsValue = "No";
      }

      // STREAM UPDATE
      _settingsController.add(_comapanySettingsListData);

      // API UPDATE
      for (var child in children) {
        await createCompanySettings(
          context,
          param: CreateCompanysettingsParams(
            id: child.id,
            companyid: companyId,
            settingsvalue: "No",
          ),
        );
      }
    }
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
        // final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllGodowns(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
          );
        });
        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
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
        // final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllGodowns(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
          );
        });
        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
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
        // final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllGodowns(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
          );
        });
        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
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
        // final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllGodowns(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
          );
        });
        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
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
        final message = failure.errorMsg?.isNotEmpty == true
            ? failure.errorMsg!
            : "Something went wrong";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message, textAlign: TextAlign.center),
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
        // final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllRoutess(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
          );
        });
        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
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
    notifyListeners();
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
        // final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllRoutess(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
          );
        });
        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
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
        // final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllRoutess(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
          );
        });

        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
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
        // final companyId = await getCompanyId();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getAllRoutess(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
          );
        });
        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
    return _routeResponse;
  }

  //========================= Create Voucher Numbering =========================

  Future<ResponseModel?> setVoucherNumberingMode({
    required BuildContext context,
    required String companyId,
    required String voucherMode,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.setVoucherNumberMethod(
      companyId: companyId,
      voucherMode: voucherMode,
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
        _responseModel = response;
        Logger.logSuccess(
          "Voucher numbering mode set successfull : ${response.toJson()}",
        );
      },
    );
    setLoading(false);
    notifyListeners();
    return _responseModel;
  }

  //========================= Create Voucher Numbering =========================

  Future<ResponseModel?> createVoucherNumbering({
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
        _responseModel = response;
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
    _isGodown
        ? getVoucherNumberingGodown(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
            voucherModeId: voucherModeId,
          )
        : getVoucherNumberingRoute(
            context: context,
            companyId: selectedCompany?.id.toString() ?? '',
            voucherModeId: voucherModeId,
          );
    setLoading(false);
    notifyListeners();
    return _responseModel;
  }

  //========================= Get Voucher Numbering =========================

  Future<VoucherNumberingResponse?> getVoucherNumberingGodown({
    required BuildContext context,
    required String companyId,
    required int voucherModeId,
  }) async {
    setLoading(true);
    final result = await iCompanyCreationFacad.getVoucherNumbering(
      companyId: companyId,
      voucherMode: "Godown",
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
        _voucherNumberingGodownResponse = response;
        _voucherNumberingGodownController.add(
          _voucherNumberingGodownResponse?.voucherNumberingModels ?? [],
        );
        Logger.logSuccess(
          "voucher numbering list (Godown) successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
    return _voucherNumberingGodownResponse;
  }

  Future<VoucherNumberingResponse?> getVoucherNumberingRoute({
    required BuildContext context,
    required String companyId,
    required int voucherModeId,
  }) async {
    setLoading(true);
    setLoading(true);

    final result = await iCompanyCreationFacad.getVoucherNumbering(
      companyId: companyId,
      voucherMode: "Route",
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
        _voucherNumberingRouteResponse = response;
        _voucherNumberingRouteController.add(
          _voucherNumberingRouteResponse?.voucherNumberingModels ?? [],
        );
        Logger.logSuccess(
          "voucher numbering list (Route) successfull : ${response.toJson()}",
        );
        notifyListeners();
      },
    );
    setLoading(false);
    notifyListeners();
    return _voucherNumberingRouteResponse;
  }

    @override
  void dispose() {
    _settingsController.close();
    super.dispose();
  }
}
