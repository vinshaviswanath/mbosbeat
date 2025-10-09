import 'package:mpos_beat/core/utils/imports.dart';

class PaymentModeAlertWidget extends StatelessWidget {
  const PaymentModeAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            appLocalizations.payment_mode_alert_select_payment_mode,
            style: context.textStyle.s12.w500.indigoBlue.roboto,
          ),
          h20,
          Row(
            children: [
              Text(
                appLocalizations.cash,
                style: context.textStyle.s10.w400.indigoBlue.roboto,
              ),
              w16,

              Expanded(
                child: TextField(
                  style: context.textStyle.s09.w400.dustyBlue.roboto,
                  decoration: InputDecoration(
                    hintText: "",

                    hintStyle: context.textStyle.s09.w400.dustyBlue.roboto,
                    isCollapsed: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorResources.mistGray,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorResources.mistGray,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorResources.mistGray,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              w16,
              Text(
                appLocalizations.upi,
                style: context.textStyle.s10.w400.indigoBlue.roboto,
              ),
              w16,

              Expanded(
                child: TextField(
                  style: context.textStyle.s09.w400.dustyBlue.roboto,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorResources.mistGray,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorResources.mistGray,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorResources.mistGray,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          h16,
          Row(
            children: [
              Text(
                appLocalizations.cheque,
                style: context.textStyle.s10.w400.indigoBlue.roboto,
              ),
              w16,
              Expanded(
                child: TextField(
                  style: context.textStyle.s09.w400.dustyBlue.roboto,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorResources.mistGray,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorResources.mistGray,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorResources.mistGray,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(width: context.getSize.width / 2.6),
            ],
          ),
          h30,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: appLocalizations.save,
                  textStyle: context.textStyle.s12.w500.white.roboto,
                  isborderEnable: false,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              w10,
              Expanded(
                child: CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: appLocalizations.cancel,
                  textStyle: context.textStyle.s12.w500.white.roboto,
                  isborderEnable: false,
                  color: ColorResources.bluishGray,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
