import 'package:mpos_beat/core/utils/imports.dart';

class MasterDetailsScreen extends StatefulWidget {
  const MasterDetailsScreen({super.key});

  @override
  State<MasterDetailsScreen> createState() => _MasterDetailsScreenState();
}

class _MasterDetailsScreenState extends State<MasterDetailsScreen> {
  final List<Color> colors = [
    ColorResources.pastelPurple.withValues(alpha: 0.6),
    ColorResources.lightIndigo.withValues(alpha: 0.6),
    ColorResources.peachPink.withValues(alpha: 0.6),
    ColorResources.amberLight.withValues(alpha: 0.6),
    ColorResources.skyBlue.withValues(alpha: 0.6),
    ColorResources.mintGreenAccent.withValues(alpha: 0.6),
    ColorResources.pastelPurple.withValues(alpha: 0.6),
    ColorResources.lightIndigo.withValues(alpha: 0.6),
    ColorResources.peachPink.withValues(alpha: 0.6),
  ];

  final List<Color> iconsBGcolors = [
    ColorResources.lavenderMist,
    ColorResources.babyBlue,
    ColorResources.peachBlush,
    ColorResources.paleGold,
    ColorResources.softAzure,
    ColorResources.aquaMint,
    ColorResources.powderBlue,
    ColorResources.periwinkleBlue,
    ColorResources.peachBlush,
  ];

  final List<String> masterIcons = [
    AppAssets.partyGroup,
    AppAssets.partyName,
    AppAssets.itemGroup,
    AppAssets.itemName,
    AppAssets.unit,
    AppAssets.godown,
    AppAssets.itemCategory,
    AppAssets.otherLedgers,
    AppAssets.itemGroup,
  ];

  final List<String> titles = [
    "Party Group",
    "Party Name",
    "Item Group",
    "Item name",
    "Unit",
    "Godown",
    "Item Category",
    "Other Ledgers",
    "Price Lists",
  ];

  List<String> routes = [AppRouterConst.partyGroupScreen];
  @override
  Widget build(BuildContext context) {
    // final appLocalizations = context.l10n;

    return Scaffold(
      backgroundColor: const Color(0xFFE3EDF8),
      appBar: AppBar(
        backgroundColor: ColorResources.dustyBlue.withValues(alpha: 0.10),
        surfaceTintColor: ColorResources.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
          ),
        ),
        title: Column(
          children: [
            Text(
              "Master Details",
              style: context.textStyle.s20.indigoBlue.bold.roboto,
            ),
            Text(
              "Manvish Info Solutions Pvt Ltd.",
              style: context.textStyle.s12.indigoBlue.w500.roboto,
            ),
            h10,
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: titles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final title = titles[index];
            final parts = title.split(' '); // split by newline if exists

            return GestureDetector(
              onTap: () {
                context.pushNamed(routes[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 63,
                        width: 63,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: iconsBGcolors[index],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            masterIcons[index],
                            height: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: parts[0] + (parts.length > 1 ? '\n' : ''),
                              style: context.textStyle.s14.w300.dustyBlue,
                            ),
                            if (parts.length > 1)
                              TextSpan(
                                text: parts[1],
                                style: context.textStyle.s14.w500.dustyBlue,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
