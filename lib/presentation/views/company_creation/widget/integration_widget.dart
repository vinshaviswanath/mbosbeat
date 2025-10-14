import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/company_creation/widget/voucher_card.dart';

class IntegrationWidget extends StatelessWidget {
  const IntegrationWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              VoucherCard(
                title: appLocalizations.integration_type_statnd_alone,
                description:
                    appLocalizations.integration_type_statnd_alone_description,
                logoUrl: "",
              ),
              h30,
              VoucherCard(
                title: appLocalizations.integration_type_tally,
                description:
                    appLocalizations.integration_type_statnd_alone_description,
                logoUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/0/09/Tally_-_Logo.png",
              ),
              h30,

              VoucherCard(
                title: appLocalizations.integration_type_tally,
                description:
                    appLocalizations.integration_type_statnd_alone_description,
                logoUrl: "",
              ),
            ]),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsetsGeometry.all(16),
                child: CustomButton(
                  buttonText: appLocalizations.integration_type_finish,
                  onTap: onTap,
                  textStyle: context.textStyle.s16.bold.white.roboto,
                  isborderEnable: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
