import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';

void skipDialog(BuildContext context) {
  final List<String> options = [
    "Call Back",
    "Next Week",
    "No Order",
    "Price",
    "Other",
  ];

  int _selectedValue = 0;
  final TextEditingController otherReasonController = TextEditingController();

  final applocalization = context.l10n;

  CustomDialog.showBottomCustomDialog(
    child: StatefulBuilder(
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
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
              child: Column(
                children: options.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;

                  final bool isOtherSelected =
                      option == "Other" && _selectedValue == index;

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
                          Text(
                            option,
                            style: context.textStyle.s12.roboto.dustyBlue.w500,
                          ),
                        ],
                      ),

                      /// ✅ Show TextField only when "Other" is selected
                      if (isOtherSelected)
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 10),
                          child: TextField(
                            controller: otherReasonController,
                            minLines: 4,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: "Enter reason",
                              hintStyle: context.textStyle.s12.w300.bluishGray,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: ColorResources.ashGray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xFFD6D6D6),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorResources.ashGray.withValues(
                                    alpha: 0.2,
                                  ),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      /// Optional validation
                      if (_selectedValue == options.indexOf("Other") &&
                          otherReasonController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter reason")),
                        );
                        return;
                      }

                      Navigator.of(context).pop({
                        "reasonIndex": _selectedValue,
                        "otherReason": otherReasonController.text,
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
    ),
  );
}
