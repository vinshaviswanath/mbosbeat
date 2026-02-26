import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';

void confirmBillDialog(context, {required VoidCallback onSave}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final provider = context.read<CustomerTransactionProvider>();
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        title: Center(
          child: Text(
            'Save',
            style: context.textStyle.s16.roboto.bold.indigoBlue,
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.13,
          child: Column(
            children: [
              RichText(
                textAlign: .center,
                text: TextSpan(
                  style: context.textStyle.s14.roboto.bold.bluishGray,
                  children: [TextSpan(text: 'Do you want to save?')],
                ),
              ),
              h20,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onSave.call();
                        provider.clearSelectedItems();
                        Navigator.pop(context);
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
                        'Save',
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
