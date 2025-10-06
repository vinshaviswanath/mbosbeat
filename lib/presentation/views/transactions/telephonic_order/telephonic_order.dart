import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/widgets/info_tool_tip.dart';
import 'package:mpos_beat/presentation/views/transactions/purchase/widgets/discount_alert_widget.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';

class TelephonicOrderScreen extends StatelessWidget {
  const TelephonicOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.cloudGray,
        surfaceTintColor: ColorResources.cloudGray,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
            size: context.getSize.height * 0.024,
          ),
        ),
        title: Text(
          appLocalizations.telephonic_order_screen_telephonic_order,
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        centerTitle: true,
        actions: [
          SvgPicture.asset(
            AppAssets.refresh,
            height: 22,
            colorFilter: const ColorFilter.mode(
              ColorResources.indigoBlue,
              BlendMode.srcIn,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code,
              size: 22,
              color: ColorResources.indigoBlue,
            ),
          ),
        ],
        // toolbarHeight: 65,
      ),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: h16),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Alackal Stores, Kuruppamthara",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                    ],
                  ),
                  h4,
                  const EndToEndTextWidget(
                    text1: "T23-24/D-AM120",
                    text2: "29-07-2024",
                  ),
                  h4,
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h16,
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          appLocalizations.product_name,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          appLocalizations.telephonic_order_screen_order_qty,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          appLocalizations.rate,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          appLocalizations.amount,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                    ],
                  ),
                  h2,
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h4,
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "GINGELLY OIL 1 LTR CAN",
                        style: context.textStyle.s09.w500.dustyBlue.roboto,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Salable Stock: 0 Nos",
                        textAlign: TextAlign.end,
                        style: context.textStyle.s09.w400.indigoBlue.roboto,
                      ),
                    ],
                  ),
                  h6,
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Free Qty: 0.0 Qls",
                          style: context.textStyle.s09.w400.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "1.00 Nos",
                          textAlign: TextAlign.center,
                          style: context.textStyle.s09.w400.leafGreen.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "192.44/Nos",
                          textAlign: TextAlign.center,
                          style: context.textStyle.s09.w400.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "194.44",
                          textAlign: TextAlign.end,
                          style: context.textStyle.s09.w400.dustyBlue.roboto,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  // Divider(
                  //   thickness: 1,
                  //   color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  // ),
                  // h16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(
                        appLocalizations.cgst,
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                      w60,
                      Text(
                        "4.81",
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                      h8,
                    ],
                  ),
                  h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(
                        appLocalizations.sgst,
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                      w60,
                      Text(
                        "4.81",
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                    ],
                  ),
                  h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(
                        appLocalizations.cess,
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                      w60,
                      Text(
                        "0.00",
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                    ],
                  ),
                  h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(
                        appLocalizations.grand_total,
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      w60,
                      Text(
                        "0.00",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                    ],
                  ),
                  h32,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalizations.discount_add_minus,
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      CustomSwitch(
                        borderColor: ColorResources.bluishGray,
                        thumbColor: ColorResources.bluishGray,
                        value: false,
                        onChanged: (value) {
                          value == true
                              ? CustomDialog.showBottomCustomDialog(
                                  chid: const DiscountAlertWidget(),
                                )
                              : null;
                        },
                      ),
                    ],
                  ),
                  h12,
                  Text(
                    appLocalizations.remarks,
                    style: context.textStyle.s10.w400.dustyBlue.roboto,
                  ),
                  h13,
                  const CustomTextField(
                    hint: "",
                    borderRadius: 16,
                    borderColor: ColorResources.ashGray,
                  ),
                  h12,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonText: appLocalizations.save,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          isborderEnable: false,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      w10,
                      Expanded(
                        child: CustomButton(
                          buttonText: appLocalizations.cancel,
                          isborderEnable: false,
                          color: ColorResources.bluishGray,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                  h16,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
