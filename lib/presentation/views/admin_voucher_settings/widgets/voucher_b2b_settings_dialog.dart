import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/voucher_numbering_response.dart';

class VoucherB2BSettingsDialog extends StatefulWidget {
  final VoucherNumberingModel data;
  const VoucherB2BSettingsDialog({super.key, required this.data});

  @override
  State<VoucherB2BSettingsDialog> createState() =>
      _VoucherB2BSettingsDialogState();
}

class _VoucherB2BSettingsDialogState extends State<VoucherB2BSettingsDialog> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController get prefixController =>
      TextEditingController(text: widget.data.b2BPrefix);
  TextEditingController get suffixController =>
      TextEditingController(text: widget.data.b2BSuffix);
  TextEditingController get widthController =>
      TextEditingController(text: widget.data.b2BWidth.toString());
  TextEditingController get startFromController =>
      TextEditingController(text: widget.data.b2BStartFrom.toString());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: ColorResources.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Voucher Series Settings:",
                  style: context.textStyle.s14.w500.dustyBlue.roboto.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: ColorResources.indigoBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ---- Section title ----
            Text(
              "Sales Order B2B:",
              style: context.textStyle.s14.w500.bluishGray.roboto,
            ),
            const SizedBox(height: 12),

            // ---- Prefix ----
            Text("Prefix", style: context.textStyle.s10.w300.bluishGray.roboto),
            const SizedBox(height: 4),
            TextFormField(
              controller: prefixController,
              style: context.textStyle.s11.w400.bluishGray.roboto,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.cloudGray,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter prefix';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            // ---- Suffix ----
            Text("Suffix", style: context.textStyle.s10.w300.bluishGray.roboto),
            const SizedBox(height: 4),
            TextFormField(
              controller: suffixController,
              style: context.textStyle.s11.w400.bluishGray.roboto,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.cloudGray,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter suffix';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            // ---- Width ----
            Text("Width", style: context.textStyle.s10.w300.bluishGray.roboto),
            const SizedBox(height: 4),
            TextFormField(
              controller: widthController,
              style: context.textStyle.s11.w400.bluishGray.roboto,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.cloudGray,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter width';
                }
                if (int.tryParse(value) == null) {
                  return 'Width must be a number';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            // ---- Starts From ----
            Text(
              "Starts From",
              style: context.textStyle.s10.w300.bluishGray.roboto,
            ),
            const SizedBox(height: 4),
            TextFormField(
              controller: startFromController,
              style: context.textStyle.s11.w400.bluishGray.roboto,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.cloudGray,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter starting number';
                }
                if (int.tryParse(value) == null) {
                  return 'Must be a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // ---- Save Button ----
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Saved successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorResources.indigoBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: ColorResources.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
