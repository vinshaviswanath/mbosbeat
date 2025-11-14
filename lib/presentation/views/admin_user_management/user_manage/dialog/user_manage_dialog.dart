import 'package:mpos_beat/core/utils/constants.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/manage_user_screen.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/option_item.dart';

class UserManageDialog {
  static Future<void> showUserOptionsDialog({
    required BuildContext context,
    required List<UserModel> items,
    required int selectedIndex,
    required int optionIndex,
    required List<VoidCallback> optionActions,
  }) {
    assert(optionActions.length == 5, 'You must provide 5 actions.');

    return CustomDialog.showBottomCustomDialog(
      padding: const EdgeInsets.symmetric(vertical: 16),
      chid: StatefulBuilder(
        builder: (context, setStateDialog) {
          return Container(
            decoration: BoxDecoration(
              color:ColorResources.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      w24,
                      Column(
                        children: [
                          Text(
                            items[selectedIndex].name,
                            style: context.textStyle.s12.w500.roboto.indigoBlue,
                          ),
                          h4,
                          Text(
                            items[selectedIndex].designation,
                            style: context.textStyle.s10.w400.roboto.dustyBlue,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const CircleAvatar(
                          radius: 12,
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: ColorResources.dustyBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                h20,
                // ...List.generate(optionActions.length, (i) {
                //   return Column(
                //     children: [
                //       OptionItem(
                //         index: i,
                //         selectedIndex: optionIndex,
                //         title: optionTitles[i],
                //         icon: optionIcons[i],
                //         onTap: (_) {
                //           setStateDialog(() => optionIndex = i);
                //           optionActions[i]();
                //         },
                //       ),
                //       if (i < optionActions.length - 1) _buildDivider(),
                //     ],
                //   );
                // }),

                ListView.separated(itemBuilder: (context, index) {
                  return OptionItem(
                        index: index,
                        selectedIndex: optionIndex,
                        title: optionTitles[index],
                        icon: optionIcons[index],
                        onTap: (_) {
                          setStateDialog(() => optionIndex = index);
                          optionActions[index]();
                        },
                      );
                }, separatorBuilder: (context, index) => _buildDivider(), itemCount: optionTitles.length)
              ],
            ),
          );
        },
      ),
    );
  }

  static Widget _buildDivider() => Divider(height: 1, color: Colors.grey[300]);
}
