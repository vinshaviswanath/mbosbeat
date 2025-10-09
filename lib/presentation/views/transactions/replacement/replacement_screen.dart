import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';

class ReplacementScreen extends StatelessWidget {
  const ReplacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Scaffold(
      appBar: AppBar(
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
          appLocalizations.replacement_screen_replacemant,
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        centerTitle: true,
        actions: [
          SvgPicture.asset(
            AppAssets.refresh,
            height: context.getSize.height * 0.022,
            colorFilter: const ColorFilter.mode(
              ColorResources.indigoBlue,
              BlendMode.srcIn,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon:  Icon(
              Icons.qr_code,
              size: context.getSize.height * 0.022,
            ),
          ),
        ],
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
                  h6,
                  const EndToEndTextWidget(
                    text1: "T23-24/D-AM120",
                    text2: "29-07-2024",
                  ),
                  h4,
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h12,
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
                        flex: 4,
                        child: Text(
                          appLocalizations.product_name,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          appLocalizations.qty,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          appLocalizations.replacement_screen_inc_rate,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Text(
                          appLocalizations.amount,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                    ],
                  ),
                  h4,
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h8,
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            appLocalizations.replacement_screen_return_products,
                            style: context.textStyle.s10.w500.rosePink.roboto,
                          ),
                        ],
                      ),
                      h120,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorResources.rosePink,
                            ),
                            child: Center(
                              child: Text(
                                appLocalizations.add_item,
                                style: context.textStyle.s10.white.w400,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: context.getSize.width / 2.5,
                            child: const Column(
                              children: [
                                Divider(
                                  thickness: 1,
                                  color: ColorResources.rosePink,
                                ),
                                h20,
                                Divider(
                                  thickness: 1,
                                  color: ColorResources.rosePink,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  h8,
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            appLocalizations.replacement_screen_return_products,
                            style: context.textStyle.s10.w500.rosePink.roboto,
                          ),
                        ],
                      ),
                      h120,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorResources.rosePink,
                            ),
                            child: Center(
                              child: Text(
                                appLocalizations.add_item,
                                style: context.textStyle.s10.white.w400,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: context.getSize.width / 2.5,
                            child: const Column(
                              children: [
                                Divider(
                                  thickness: 1,
                                  color: ColorResources.rosePink,
                                ),
                                h20,
                                Divider(
                                  thickness: 1,
                                  color: ColorResources.rosePink,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  h21,
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
                          buttonText: appLocalizations
                              .replacement_screen_save_replacement,
                          textStyle: context.textStyle.s12.w500.white.roboto,
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
                          textStyle: context.textStyle.s12.w500.white.roboto,
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
