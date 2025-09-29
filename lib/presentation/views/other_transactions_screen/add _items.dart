import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_textField.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  int? selectUnits;
  int? selectQuantitys;
  bool recent = false;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final local = AppLocalizations.of(context);
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
            color: color.onSecondary,
            size: 15,
          ),
        ),
        backgroundColor: color.onTertiaryContainer,
        title: Text("Add Items"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Row(
                children: [
                  Text(
                    "# : M1ST-002/22/23",
                    style: texttheme.displayMedium!.copyWith(
                      color: color.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Recent Items",
                    style: texttheme.labelSmall!.copyWith(
                      color: color.onSecondary,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.6,
                    child: Switch(
                      inactiveThumbColor: color.secondary,
                      activeColor: color.onPrimary,
                      inactiveTrackColor: color.onPrimary,
                      activeTrackColor: color.primary,
                      value: recent,
                      onChanged: (value) {
                        setState(() {
                          recent = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              height: 3,
              thickness: 1.4,
            ),
            Container(
              height: height * 0.08,
              width: width * 0.930,
              child: CustomTextField(
                iconData: Icons.search,
                hint: "Search Product",
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              height: 3,
              thickness: 1.4,
            ),
            SizedBox(height: height * 0.0150),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 72),
              child: Row(
                children: [
                  Text(
                    "Product Name",
                    style: texttheme.labelSmall!.copyWith(
                      color: color.onSecondary,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Quantity",
                    style: texttheme.labelSmall!.copyWith(
                      color: color.onSecondary,
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Text(
                    "Units",
                    style: texttheme.labelSmall!.copyWith(
                      color: color.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              height: 3,
              thickness: 1.4,
              indent: 20,
              endIndent: 18,
            ),
            Container(
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
                              color: color.onSecondaryFixed,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Bisleri Mountan 1 ltr",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: color.onSecondary,
                                            ),
                                      ),
                                      Spacer(),

                                      //Quantity select
                                      Container(
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
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: color.onSecondary,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        height: height * 0.0250,
                                        width: width * 0.150,
                                      ),
                                      SizedBox(width: width * 0.0230),
                                      //Unit select button
                                      Container(
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
                                                      style: texttheme
                                                          .labelSmall!
                                                          .copyWith(
                                                            color: color
                                                                .onSecondary,
                                                          ),
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
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: color.onSecondary,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        height: height * 0.0250,
                                        width: width * 0.150,
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Icon(
                                        Icons.delete,
                                        color: color.onSecondary,
                                        size: 19,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Theme.of(
                              context,
                            ).colorScheme.onTertiaryContainer,
                            height: 3,
                            thickness: 1.4,
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
              "${"Item Count:"}8",
              style: texttheme.labelSmall!.copyWith(color: color.onSecondary),
            ),
            SizedBox(height: height * 0.01),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(width * 0.5, height * 0.0500),
              ),
              onPressed: () {},
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
