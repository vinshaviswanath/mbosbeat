import 'package:mpos_beat/core/utils/imports.dart';

void skipDialog(BuildContext context) {
  final List<String> options = [
    "Call Back",
    "Next Week",
    "No Order",
    "Price",
    "Other",
  ];
  int? _selectedValue;
  final applocalization = context.l10n;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorResources.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.all(16.0),
        title: Center(
          child: Text(
            'Reason for Skip',
            style: context.textStyle.s14.roboto.indigoBlue.bold,
          ),
        ),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize:
                  MainAxisSize.min, // Dialog height adjusts automatically
              children: [
                // Map each option to a Row with Radio
                ...options.asMap().entries.map((entry) {
                  int index = entry.key;
                  String option = entry.value;
                  return Row(
                    children: [
                      Radio<int>(
                        fillColor: WidgetStatePropertyAll(
                          ColorResources.indigoBlue,
                        ),
                        // side: const BorderSide(
                        //   color: ColorResources.bluishGray,
                        //   width: 2,
                        // ),
                        value: index,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                      ),
                      Text(
                        option,
                        style: context.textStyle.s12.roboto.dustyBlue.w500,
                      ),
                    ],
                  );
                }).toList(),

                const SizedBox(height: 20),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(_selectedValue);
                        },
                        child: Text(
                          applocalization
                              .customer_transaction_detail_skip_dilaog_confirm_skip,
                          style: context.textStyle.s12.roboto.white.w500,
                        ),

                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 51),
                          backgroundColor: ColorResources.bluishGray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          applocalization
                              .customer_transaction_detail_skip_dilaog_cancel,
                          style: context.textStyle.s12.roboto.white.w500,
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 51),
                          backgroundColor: ColorResources.bluishGray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
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
    },
  );
}
