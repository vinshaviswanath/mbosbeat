import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';

@lazySingleton
class HomeInitController {
  HomeInitController({required AppDb appDb}) : _appDb = appDb;

  final AppDb _appDb;

  int? _userId;
  int? get userId => _userId;

  Future<void> initialize(BuildContext context, Company company) async {
    final companyProvider = context.read<CompanyCreationProvider>();
    final userManagementProvider = context.read<UserManagementProvider>();
    final userProvider = context.read<UserProvider>();
    userProvider.setHomeLoading(false);

    userProvider.setHomeLoading(true);

    try {
      _userId = await _appDb.registrationDetailDao.getLoggedInUserId();
      if (_userId == null) return;

      final companyId = company.id ?? 0;

      await Future.wait([
        companyProvider.fetchVoucherTypes(context, companyId),
        companyProvider.getCompanySettings(context, companyId),
        companyProvider.getAllGodowns(
          context: context,
          companyId: companyId.toString(),
        ),
        companyProvider.getAllRoutess(
          context: context,
          companyId: companyId.toString(),
        ),
        userManagementProvider.getUsersSettingsList(
          context: context,
          userId: _userId.toString(),
        ),
      ]);

      userProvider.setCompanyId(companyId);
      await userProvider.partyMasterSync();
      await userProvider.loadRouteState();
      await userProvider.load();
    } catch (e, s) {
      debugPrint("HomeInit error: $e");
      debugPrintStack(stackTrace: s);
    } finally {
      userProvider.setHomeLoading(false);
    }
  }
}
