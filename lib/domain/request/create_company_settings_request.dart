import 'package:mpos_beat/core/param/param_builder.dart';

class CreateCompanysettingsParams extends ToMap {
  final int id;
  final int companyid;
  final String settingsvalue;
  CreateCompanysettingsParams({
    required this.id,
    required this.companyid,
    required this.settingsvalue,
  });

  @override
  Map<String, dynamic> toMap() {
    return {"ID": id, "CompanyID": companyid, "SETTINGSVALUE": settingsvalue};
  }
}
