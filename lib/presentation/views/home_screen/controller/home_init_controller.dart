import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/domain/request/item_master_quary_params.dart';
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
    // final companyProvider = context.read<CompanyCreationProvider>();
    // final userManagementProvider = context.read<UserManagementProvider>();
    // final userProvider = context.read<UserProvider>();

    // _userId = await _appDb.registrationDetailDao.getLoggedInUserId();
    // if (_userId == null) return;

    // final companyId = company.id ?? 0;

    // await Future.wait([
    //   companyProvider.fetchVoucherTypes(context, companyId),
    //   companyProvider.getCompanySettings(context, companyId),
    //   companyProvider.getAllGodowns(
    //     context: context,
    //     companyId: companyId.toString(),
    //   ),
    //   companyProvider.getAllRoutess(
    //     context: context,
    //     companyId: companyId.toString(),
    //   ),
    //   userManagementProvider.getUsersSettingsList(
    //     context: context,
    //     userId: _userId.toString(),
    //   ),
    // ]);

    // userProvider.setCompanyId(companyId);
    // await userProvider.partyMasterSync();
    // await userProvider.getItemMaster(
    //   context,
    //   params: ItemMasterQueryParams(
    //     companyId: companyId,
    //     pageNumber: 1,
    //     lastSyncDateTime: DateTime.now(),
    //   ),
    // );
    // await userProvider.getPriceLevel(context, companyId: companyId);
    // await userProvider.getItemPriceDetails(context, companyId: companyId);
    // await userProvider.loadRouteState();
    // await userProvider.load();
  }
}
