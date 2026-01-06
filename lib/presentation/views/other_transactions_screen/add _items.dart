
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  int? selectUnits;
  int? selectQuantitys;
  bool items = false;
  @override
  Widget build(BuildContext context) {
    // final args = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final color = Theme.of(context).colorScheme;
    // final local = AppLocalizations.of(context);
    final texttheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
          "Add Items",
          style: context.textStyle.s22.dustyBlue.bold.roboto,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Row(
                children: [
                  Text(
                    "# : M1ST-002/22/23",
                    style: context.textStyle.s14.roboto.bold.indigoBlue,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Recent Items",
                            style: context.textStyle.s12.roboto.dustyBlue,
                          ),
                          Transform.scale(
                            scale: 0.6,
                            child: Switch(
                              value: items,
                              onChanged: (value) {
                                setState(() => items = value);
                              },
                              activeThumbColor : ColorResources.indigoBlue,
                              inactiveThumbColor: ColorResources.bluishGray,
                              inactiveTrackColor: ColorResources.white,
                              activeTrackColor:ColorResources.white,
                              trackOutlineColor:
                                  WidgetStateProperty .resolveWith<Color?>((
                                    states,
                                  ) {
                                    if (states.contains(
                                      WidgetState .selected,
                                    )) {
                                      return ColorResources.indigoBlue;
                                    }
                                    return ColorResources.bluishGray;
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: ColorResources.cloudGray,
              height: 3,
              thickness: 1.4,
              indent: 20,
              endIndent: 18,
            ),
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Ensures vertical alignment
                children: [
                  Expanded(
                    // Takes available space
                    child: CustomTextField(
                      hint: "Search product",
                      // iconData: Icons.search,
                      // iconColor: ColorResources.bluishGray,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Divider(
              color: ColorResources.cloudGray,
              height: 3,
              thickness: 1.4,
              indent: 20,
              endIndent: 18,
            ),
            SizedBox(height: height * 0.0150),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 72),
              child: Row(
                children: [
                  Text(
                    "Product Name",
                    style: context.textStyle.s12.dustyBlue.roboto,
                  ),
                  Spacer(),
                  Text(
                    "Quantity",
                    style: context.textStyle.s12.dustyBlue.roboto,
                  ),
                  SizedBox(width: width * 0.05),
                  Text("Units", style: context.textStyle.s12.dustyBlue.roboto),
                ],
              ),
            ),
            Divider(
              color: ColorResources.cloudGray,
              height: 3,
              thickness: 1.4,
              indent: 20,
              endIndent: 18,
            ),
            SizedBox(
              height: height * 0.550,
              width: width * 0.920,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorResources.lightGray,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Bisleri Mountan 1 ltr",
                                        style: context
                                            .textStyle
                                            .roboto
                                            .w600
                                            .dustyBlue
                                            .s14,
                                      ),
                                      Spacer(),

                                      //Quantity select
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorResources.dustyBlue,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        height: height * 0.0250,
                                        width: width * 0.150,
                                        child: TextField(
                                          cursorHeight: 11,
                                          style: texttheme.labelSmall!.copyWith(
                                            fontSize: 15,
                                            color: color.onSecondary,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder
                                                .none, // Removes the underline
                                            contentPadding: EdgeInsets.all(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: width * 0.0230),

                                      //Unit select button
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorResources.dustyBlue,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        height: height * 0.0250,
                                        width: width * 0.150,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                            ),
                                            Spacer(),
                                            DropdownButton<int>(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              dropdownColor: color.onPrimary,
                                              value: selectUnits,
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                size: 20,
                                              ),
                                              items: List.generate(
                                                2,
                                                (index) => DropdownMenuItem(
                                                  value: index + 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          right: 5,
                                                        ),
                                                    child: Text(
                                                      (index + 1).toString(),
                                                      style: context
                                                          .textStyle
                                                          .shade100
                                                          .roboto
                                                          .dustyBlue,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectUnits = value;
                                                });
                                              },
                                              underline:
                                                  SizedBox(), // Removes the underline if needed
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Icon(
                                        Icons.delete,
                                        color: ColorResources.dustyBlue,
                                        size: 19,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: ColorResources.cloudGray,
                            height: 3,
                            thickness: 1.4,
                            indent: 20,
                            endIndent: 18,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              "Item Count : 8",
              style: context.textStyle.s12.roboto.dustyBlue,
            ),
            SizedBox(height: height * 0.01),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorResources.indigoBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(width * 0.5, height * 0.0500),
              ),
              onPressed: () {},
              child: Text(
                "Save",
                style: context.textStyle.s14.roboto.white.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
