import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_info_widget/company_info_widget.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/integration_widget/integration_widget.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/company_vouchertype/voucher_type_widget.dart';

class CompanyCreationScreen extends StatefulWidget {
  final CompanyViewList? companyData;
  const CompanyCreationScreen({
    super.key,
    required this.initialTabIndex,
    this.companyData,
  });

  final int initialTabIndex;

  @override
  State<CompanyCreationScreen> createState() => _CompanyCreationScreenState();
}

class _CompanyCreationScreenState extends State<CompanyCreationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Color _activeColor = ColorResources.indigoBlue;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );

    // ✅ update circles according to backend company data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CompanyCreationProvider>(
        context,
        listen: false,
      );
      if (widget.companyData != null) {
        provider.updateStageCompletionFromCompanyData(widget.companyData!);

        // optional: move to the first uncompleted tab
        // final nextStage = provider.stageCompleted.indexOf(false);
        // if (nextStage != -1) {
        //   _tabController.animateTo(nextStage);
        // }
      }
    });

    _tabController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CompanyCreationProvider>(context);
    final appLocalizations = context.l10n;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final companyData = widget.companyData;

        final hasIntegration =
            companyData?.hasIntegrationSettings != null &&
            companyData!.hasIntegrationSettings != 0;
        final hasVoucherType =
            companyData?.hasVoucherTypeSettings != null &&
            companyData!.hasVoucherTypeSettings != 0;

        if (!(widget.companyData != null && hasIntegration && hasVoucherType)) {
          final shouldExit = await AuthDialogs.show(context);
          if (shouldExit == true) {
            AuthDialogs.exitApp();
          }
        } else {
          if (context.mounted) context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FC),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            appLocalizations.company_creation,
            style: context.textStyle.s22.bold.indigoBlue.roboto,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.getSize.width / 6,
                vertical: 6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCircle(context, provider, index: 0),
                  _buildLine(provider, index: 1),
                  _buildCircle(context, provider, index: 1),
                  _buildLine(provider, index: 2),
                  _buildCircle(context, provider, index: 2),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: TabBar(
                // onTap: (index) {
                //   if (!provider.canGoToStage(index)) {
                //     Future.delayed(Duration.zero, () {
                //       _tabController.animateTo(
                //         provider.stageCompleted.indexOf(false).clamp(0, 2),
                //       );
                //     });
                //   }
                // },
                controller: _tabController,
                labelColor: _activeColor,
                unselectedLabelColor: ColorResources.bluishGray,
                indicatorColor: _activeColor,
                unselectedLabelStyle:
                    context.textStyle.s12.w500.bluishGray.roboto,
                labelStyle: context.textStyle.s12.w500.indigoBlue.roboto,
                tabs: [
                  Tab(text: appLocalizations.company_creation_company_info),
                  Tab(text: appLocalizations.company_creation_voucher_type),
                  Tab(
                    text: appLocalizations.company_creation_Integrastion_type,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CompanyInfoWidget(
                    onTap: () {
                      provider.markStageCompleted(0);
                      if (0 < 2) {
                        _tabController.animateTo(1);
                      }
                    },
                    companyData: widget.companyData,
                  ),
                  VoucherTypeWidget(
                    onTap: () {
                      if (provider.canGoToStage(1)) {
                        provider.markStageCompleted(1);
                        if (provider.isStageCompleted(1)) {
                          _tabController.animateTo(2);
                        }
                      }
                    },
                    companyData: widget.companyData,
                  ),
                  IntegrationWidget(
                    onTap: () {
                      if (provider.canGoToStage(2)) {
                        provider.markStageCompleted(2);
                        //   context.pushNamed(AppRouterConst.adminDashboard);
                      }
                      // if (0 < 2) {
                      // _tabController.animateTo( 1);
                      // }
                    },
                    companyData: widget.companyData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(
    BuildContext context,
    CompanyCreationProvider provider, {
    required int index,
  }) {
    bool isActive = _tabController.index == index;
    bool isCompleted = provider.isStageCompleted(index);

    Color fillColor;
    Color borderColor;
    Color textColor;

    if (isCompleted) {
      fillColor = ColorResources.aquaGreen;
      borderColor = ColorResources.tealGreen;
      textColor = Colors.white;
    } else if (isActive) {
      fillColor = ColorResources.white;
      borderColor = ColorResources.indigoBlue;
      textColor = ColorResources.indigoBlue;
    } else {
      fillColor = ColorResources.white;
      borderColor = ColorResources.lavenderGray;
      textColor = ColorResources.lavenderGray;
    }

    return GestureDetector(
      onTap: () => _tabController.animateTo(index),
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: fillColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 2),
        ),
        alignment: Alignment.center,
        child: Text(
          '${index + 1}',
          style: context.textStyle.s09.w400.roboto.copyWith(color: textColor),
        ),
      ),
    );
  }

  Widget _buildLine(CompanyCreationProvider provider, {required int index}) {
    final isCompleted = provider.isStageCompleted(index - 1);
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        color: isCompleted ? ColorResources.tealGreen : const Color(0xFFE6E6EF),
      ),
    );
  }

  //   Widget _buildTabPage(
  //     BuildContext context,
  //     CompanyCreationProvider provider,
  //     int index,
  //     Widget child,
  //   ) {
  //     return Column(
  //       children: [
  //         Expanded(child: child),
  //         Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: CustomButton(
  //             buttonText: index == 2 ? "Finish" : "Next",
  //             isborderEnable: false,
  //             onTap: () {
  //               provider.markStageCompleted(index);
  //               if (index < 2) {
  //                 _tabController.animateTo(index + 1);
  //               }
  //             },
  //           ),
  //         ),
  //       ],
  //     );
  //   }
  // }
}
