import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/skip_reason_response.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';

void skipDialog(BuildContext context) {
  final applocalization = context.l10n;

  int selectedIndex = -1;
  final TextEditingController otherReasonController = TextEditingController();

  CustomDialog.showBottomCustomDialog(
    child: Consumer<UserProvider>(
      builder: (context, provider, _) {
        final List<SkipReasonData> reasons =
            provider.skipReasonResponse?.skipReasons ?? [];

        /// Add "Other" manually
        final bool hasOther = true;
        final int totalCount = hasOther ? reasons.length + 1 : reasons.length;

        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reason for Skip",
                  style: context.textStyle.s12.w500.indigoBlue.roboto,
                ),
                const SizedBox(height: 10),

                RadioGroup<int>(
                  groupValue: selectedIndex,
                  onChanged: (value) {
                    setState(() => selectedIndex = value!);
                  },
                  child: Column(
                    children: List.generate(totalCount, (index) {
                      final bool isOther = hasOther && index == reasons.length;

                      final String title = isOther
                          ? "Other"
                          : (reasons[index].reason ?? "");

                      final bool showOtherField =
                          isOther && selectedIndex == index;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio<int>(
                                value: index,
                                fillColor: const WidgetStatePropertyAll(
                                  ColorResources.indigoBlue,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  title,
                                  style: context
                                      .textStyle
                                      .s12
                                      .roboto
                                      .dustyBlue
                                      .w500,
                                ),
                              ),
                            ],
                          ),

                          /// Show input only for "Other"
                          if (showOtherField)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                bottom: 10,
                              ),
                              child: TextField(
                                controller: otherReasonController,
                                minLines: 4,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  hintText: "Enter reason",
                                  hintStyle:
                                      context.textStyle.s12.w300.bluishGray,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedIndex == -1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please select a reason"),
                              ),
                            );
                            return;
                          }

                          final bool isOther =
                              hasOther && selectedIndex == reasons.length;

                          if (isOther &&
                              otherReasonController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter reason"),
                              ),
                            );
                            return;
                          }

                          /// Final payload
                          Navigator.of(context).pop({
                            "reasonId": isOther
                                ? null
                                : reasons[selectedIndex].id,
                            "reason": isOther
                                ? otherReasonController.text.trim()
                                : reasons[selectedIndex].reason,
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 51),
                          backgroundColor: ColorResources.indigoBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          applocalization
                              .customer_transaction_detail_skip_dilaog_confirm_skip,
                          style: context.textStyle.s12.roboto.white.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 51),
                          backgroundColor: ColorResources.bluishGray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          applocalization
                              .customer_transaction_detail_skip_dilaog_cancel,
                          style: context.textStyle.s12.roboto.white.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    ),
  );
}
