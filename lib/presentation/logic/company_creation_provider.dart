import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/failures/value_object/value_object.dart';
import 'package:mpos_beat/presentation/views/godown_wise_screen/godown_wise_screen.dart';
import 'package:mpos_beat/presentation/views/route_wise_screen/route_wise_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyCreationProvider extends ChangeNotifier {
  String? _activePlan;

  String? get activePlan => _activePlan;

  final Set<int> _completedStages = {};

  Set<int> get completedStages => _completedStages;

  final List<bool> stageCompleted = [false, false, false];

  final Map<String, bool> _voucherStates = {
    "Sales Order": false,
    "Sales": false,
    "Sales Return": false,
    "Receipt": false,
    "Payment": false,
    "Purchase": false,
    "Purchase Return": false,
    "Expenses": false,
    "Feedbacks": false,
  };

  bool _isGodown = true;

  bool get isGodown => _isGodown;

  void toggleVoucher() {
    _isGodown = !_isGodown;
    notifyListeners();
  }

  Map<String, bool> get voucherStates => _voucherStates;

  bool getValue(String title) => _voucherStates[title] ?? false;

  void toggleValue(String title, bool? value) {
    _voucherStates[title] = value ?? false;
    notifyListeners();
  }

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

  Future<void> submitRoute(BuildContext context) async {
    final isValid = validateRoute();

    if (!isValid) {
      routeAutovalidateMode = AutovalidateMode.always;
      notifyListeners();
      return;
    }

    final name = _routeName.getOrCrash();
    final code = _routeCode.getOrCrash();

    addRoute(name: name, code: code);
    routeAutovalidateMode = AutovalidateMode.disabled;
    Navigator.pop(context);
  }

  Future<void> _saveRoutes() async {
    final prefs = sl<SharedPreferences>();
    final jsonList = _routes.map((v) => jsonEncode(v.toJson())).toList();
    await prefs.setStringList("routes", jsonList);
  }

  void loadRoutes() {
    final prefs = sl<SharedPreferences>();
    final jsonList = prefs.getStringList("routes") ?? [];
    _routes
      ..clear()
      ..addAll(jsonList.map((e) => RouteDetails.fromJson(jsonDecode(e))));
    notifyListeners();
  }

  void addRoute({required String name, required String code}) {
    _routes.add(
      RouteDetails(routeName: name, routeCode: code, status: "Active"),
    );
    _saveRoutes();
    notifyListeners();
  }

  void editRoute(int index, String newName, String newCode) {
    _routes[index] = RouteDetails(
      routeName: newName,
      routeCode: newCode,
      status: _routes[index].status,
    );
    _saveRoutes();
    notifyListeners();
  }

  void deleteRoute(int index) {
    _routes.removeAt(index);
    _saveRoutes();
    notifyListeners();
  }

  void deactivateRoute(int index) {
    _routes[index] = RouteDetails(
      routeName: _routes[index].routeName,
      routeCode: _routes[index].routeCode,
      status: "Inactive",
    );
    _saveRoutes();
    notifyListeners();
  }

  void activateRoute(int index) {
    _routes[index] = RouteDetails(
      routeName: _routes[index].routeName,
      routeCode: _routes[index].routeCode,
      status: "Active",
    );
    _saveRoutes();
    notifyListeners();
  }
}
