import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/user_settings_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/sliverSpace.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/widgets/info_tool_tip.dart';

class UserSettingsScreen extends StatefulWidget {
  final String userId;
  const UserSettingsScreen({super.key, required this.userId});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  @override
  void initState() {
    super.initState();
    // final provider = Provider.of<UserManagementProvider>(
    //   context,
    //   listen: false,
    // );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserManagementProvider>().getUsersSettingsList(
        context: context,
        userId: widget.userId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.transparent,
        foregroundColor: ColorResources.transparent,
        surfaceTintColor: ColorResources.transparent,
        leading: IconButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
          ),
        ),
        title: Text(
          appLocalizations.user_settings_screen_user_settings,
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 15),
          child: Container(color: Colors.transparent),
        ),
      ),
      body: StreamBuilder<UserSettingsResponse?>(
        stream: context.read<UserManagementProvider>().userSettingsStream,
        builder: (context, snapshot) {
          final data = snapshot.data?.userSettingsList ?? [];

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: data.length,
                    (context, index) {
                      final settings = data[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: InfoTooltip(
                          title: settings.menuName ?? '',
                          description: settings.description ?? '',
                          initialValue: settings.value?.toLowerCase() == 'yes',
                          onToggle: (val) {
                            context
                                .read<UserManagementProvider>()
                                .createUserSettings(
                                  context: context,
                                  id: settings.id ?? 0,
                                  userId: int.parse(widget.userId),
                                  value: val ? "Yes" : "",
                                );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
