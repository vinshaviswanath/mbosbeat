import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/common_logoutdialogbox.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorResources.cloudGray,
      centerTitle: true,
      title: Text("Home", style: context.textStyle.s20.indigoBlue.bold.roboto),
      leading: IconButton(
        icon: const Icon(Icons.sort_sharp, size: 22),
        onPressed: () {},
      ),
      actions: [
        IconButton(icon: const Icon(Icons.sync), onPressed: () {}),
        IconButton(
          icon: const Icon(Icons.power_settings_new_sharp),
          onPressed: () => CommonLogoutDialog(context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}