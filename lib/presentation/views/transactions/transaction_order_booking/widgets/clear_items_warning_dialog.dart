import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';

void clearItemsWarningDialog(context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final provider = context.read<CustomerTransactionProvider>();
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.all(16.0),
        title: Center(
          child: Text(
            'Warning',
            style: context.textStyle.s16.roboto.bold.indigoBlue,
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.13,
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: context.textStyle.s14.roboto.bold.roseRed,
                  children: [
                    TextSpan(text: 'Are you sure, You want to go back?\n'),
                    TextSpan(
                      text: 'Your selected list will be cleared.',
                      style: context.textStyle.s12.roboto.bold.dustyBlue,
                    ),
                  ],
                ),
              ),
              h20,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        provider.clearSelectedItems();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorResources.indigoBlue,
                        minimumSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Clear',
                        style: context.textStyle.s14.roboto.white,
                      ),
                    ),
                  ),
                  w10,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorResources.dustyBlue,
                        minimumSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: context.textStyle.s14.roboto.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
