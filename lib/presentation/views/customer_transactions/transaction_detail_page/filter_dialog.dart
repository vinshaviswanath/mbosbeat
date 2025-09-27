import 'package:mpos_beat/core/utils/imports.dart';
import 'package:popover/popover.dart';

void showFilterPopover(BuildContext context) {
  final List<String> filterOptions = [
    'Sales Order',
    'Sales Return',
    'Receipt',
    'Purchase',
    "Purchase Return",
  ];

  showPopover(
    context: context,
    bodyBuilder: (context) => Material(
      color: ColorResources.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 5),
              child: Text(
                "Filter by",
                style: context.textStyle.s12.roboto.dustyBlue,
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 2,
            color: ColorResources.palegrayblue,
          ),
          Column(
            children: filterOptions.map((option) {
              return Column(
                children: [
                  ListTile(
                    visualDensity: VisualDensity(
                      vertical: -4,
                    ), // reduces vertical space
                    tileColor: ColorResources.white,
                    title: Text(
                      option,
                      style: context.textStyle.s12.roboto.dustyBlue.w500,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: ColorResources.palegrayblue,
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    ),
    onPop: () => print('Popover closed'),
    direction: PopoverDirection.bottom, // show below the icon
    width: 180,
    arrowHeight: 10,
    arrowWidth: 20,
  );
}
