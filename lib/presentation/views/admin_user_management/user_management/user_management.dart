import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_management/widgets/user_management_selection_card.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  static const routeName = "userManagement";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorResources.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.dustyBlue,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserManagementSelectionCard(
            icon: Icons.person,
            text: context.l10n.user_management_user,
            onTap: () => context.pushNamed(AppRouterConst.manageUser),
          ),
          h20,
          UserManagementSelectionCard(
            onTap: () => context.pushNamed(AppRouterConst.userDesignation),
            icon: Icons.file_copy,
            text: context.l10n.user_management_user_designation,
          ),
        ],
      ),
    );
  }
}
