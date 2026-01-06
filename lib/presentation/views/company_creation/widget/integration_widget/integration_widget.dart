import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/domain/request/integration_request.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/integration_widget/integration_card.dart';

class IntegrationWidget extends StatefulWidget {
  final CompanyViewList? companyData;
  const IntegrationWidget({super.key, this.onTap, this.companyData});
  final void Function()? onTap;

  @override
  State<IntegrationWidget> createState() => _IntegrationWidgetState();
}

class _IntegrationWidgetState extends State<IntegrationWidget> {
  int? companyId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyCreationProvider>();

      // Get companyId either from widget.companyData or provider
      if (widget.companyData != null && widget.companyData!.id != null) {
        companyId = widget.companyData!.id!;
        print(
          'companyId in integration screen  from widget.companyData: $companyId',
        );
      } else {
        companyId = provider.companyid ?? 0;
        print('companyId in integration screen  from provider: $companyId');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                VoucherCard(
                  title: appLocalizations.integration_type_statnd_alone,
                  description: appLocalizations
                      .integration_type_statnd_alone_description,
                  logoUrl: "",
                  companyData: widget.companyData,
                ),
                h30,
                VoucherCard(
                  title: appLocalizations.integration_type_tally,
                  description: appLocalizations
                      .integration_type_statnd_alone_description,
                  logoUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/0/09/Tally_-_Logo.png",
                  companyData: widget.companyData,
                ),
                h30,

                VoucherCard(
                  title: appLocalizations.integration_type_mpos_retail,
                  description: appLocalizations
                      .integration_type_statnd_alone_description,
                  logoUrl: "",
                  companyData: widget.companyData,
                ),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(
          buttonText: appLocalizations.integration_type_finish,
          isborderEnable: false,
          onTap: () {
            final provider = context.read<CompanyCreationProvider>();

            final integrationType = provider.selectedIntegrationType ?? '';
            final serialNo = provider.integrationSerialNoController ?? '';
            final stockInCloud = provider.stockInCloud;

            print('IntegrationType: $integrationType');
            print('SerialNo: $serialNo');
            print('StockInCloud: $stockInCloud');

            provider.integration(
              context,
              onSuccess: widget.onTap,
              params: IntegrationParams(
                companyid: companyId,
                integrationType: integrationType,
                serialNo: serialNo,
                stockInCloud: stockInCloud,
              ),
            );
          },
        ),
      ),
    );
  }
}
