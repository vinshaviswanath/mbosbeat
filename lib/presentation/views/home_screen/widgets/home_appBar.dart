import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/domain/request/item_master_quary_params.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/common_logoutdialogbox.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Company company;

  const HomeAppBar({super.key, required this.company});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  int? _userId;
  bool isSyncing = false;

  @override
  void initState() {
    super.initState();
    bool isSyncing = false;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorResources.cloudGray,
      centerTitle: true,
      title: Text("Home", style: context.textStyle.s20.indigoBlue.bold.roboto),
      leading: !isSyncing
          ? IconButton(
              icon: const Icon(Icons.sort_sharp, size: 22),
              onPressed: () {},
            )
          : SizedBox.shrink(),
      actions: [
        !isSyncing
            ? IconButton(
                icon: const Icon(Icons.sync),
                onPressed: () async {
                  setState(() {
                    isSyncing = true;
                  });
                  final userProvider = context.read<UserProvider>();

                  userProvider.setHomeLoading(true);

                  try {
                    final appDb = sl<AppDb>();
                    final companyProvider = context
                        .read<CompanyCreationProvider>();
                    final userManagementProvider = context
                        .read<UserManagementProvider>();
                    final userProvider = context.read<UserProvider>();

                    _userId = await appDb.registrationDetailDao
                        .getLoggedInUserId();
                    if (_userId == null) return;

                    final companyId = widget.company.id ?? 0;

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
                    await userProvider.getItemMaster(
                      context,
                      params: ItemMasterQueryParams(
                        companyId: companyId,
                        pageNumber: 1,
                        lastSyncDateTime: DateTime.now(),
                      ),
                    );
                    await userProvider.getPriceLevel(
                      context,
                      companyId: companyId,
                    );
                    await userProvider.getItemPriceDetails(
                      context,
                      companyId: companyId,
                    );
                    await userProvider.loadRouteState();
                    await userProvider.load();
                  } finally {
                    userProvider.setHomeLoading(false);
                    setState(() {
                      isSyncing = false;
                    });
                  }
                },
              )
            : SizedBox.shrink(),
        !isSyncing
            ? IconButton(
                icon: const Icon(Icons.power_settings_new_sharp),
                onPressed: () => CommonLogoutDialog(context),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
