import 'package:flutter/material.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';

class PriceListScreen extends StatelessWidget {
  const PriceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Price List Screen",
          style: context.textStyle.s16.w500.dustyBlue,
        ),
      ),
    );
  }
}
