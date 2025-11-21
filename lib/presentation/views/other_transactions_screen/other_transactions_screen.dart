import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';

class OtherTransOptionsScreen extends StatefulWidget {
  const OtherTransOptionsScreen({super.key});

  @override
  State<OtherTransOptionsScreen> createState() =>
      _OtherTransOptionsScreenState();
}

class _OtherTransOptionsScreenState extends State<OtherTransOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final List<Color> containerColors = [
      ColorResources.pastelPurple,
      ColorResources.lavenderBlue,
      ColorResources.peachPink,
      ColorResources.amberLight,
      ColorResources.skyBlue,
      ColorResources.mintGreenAccent,
    ];

    final List<String> images = [
      "assets/images/pngs/stock_transfer.png",
      "assets/images/pngs/stock_unload.png",
      "assets/images/pngs/damage_transfer.png",
      "assets/images/pngs/stock_request.png",
      "assets/images/pngs/stock_receive.png",
      "assets/images/pngs/expense_entry.png",
    ];

    final List<String> screens = [
      "stockjournal",
      "stockjournal",
      "stockjournal",
      "stockjournal",
      "stockreceive",
      "expenseentry",
    ];
    final List<String> detail = [
      "Stock\nTransfer",
      "Stock\nUnload",
      "Damage\nTransfer",
      "Stock\nRequests",
      "Stock\nReceive",
      "Expense\nEntry",
    ];

    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorResources.dustyBlue,
            size: 15,
          ),
        ),
        backgroundColor: ColorResources.cloudGray,
        title: Text(
          "Other Transactions",
          style: context.textStyle.s20.roboto.bold.dustyBlue,
        ),
      ),
      body: Container(
        color: ColorResources.white,

        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 140,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    Color color =
                        containerColors[index % containerColors.length];
                    String image = (images[index % images.length]);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pushNamed(
                              screens[index],
                              extra: {"heading": detail[index]},
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.150,
                            width: MediaQuery.of(context).size.width * 0.450,
                            decoration: BoxDecoration(
                              color: color  .withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Image.asset(image, height: 30, width: 30),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        detail[index],
                                        style: context
                                            .textStyle
                                            .s14
                                            .roboto
                                            .dustyBlue,
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundColor: color  .withValues(alpha: 0.2),
                                          child: Icon(
                                            size: 15,
                                            Icons.arrow_forward_ios_rounded,
                                            color: ColorResources.dustyBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
