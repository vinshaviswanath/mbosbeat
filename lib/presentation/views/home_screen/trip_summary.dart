import 'package:flutter/material.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';

class TripSummary extends StatelessWidget {
  final List<SummaryItem> items;

  const TripSummary({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index != items.length - 1
                  ? MediaQuery.of(context).size.width * 0.04
                  : 0,
            ),
            child: SummaryCard(item: item),
          );
        }),
      ),
    );
  }
}

class SummaryItem {
  final String value;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  SummaryItem({
    required this.value,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
}

class SummaryCard extends StatelessWidget {
  final SummaryItem item;

  const SummaryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.110,
      width: size.width * 0.280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: item.backgroundColor.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item.value,
            style: context.textStyle.s22.copyWith(color: item.textColor).bold,
          ),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: context.textStyle.s10.copyWith(color: item.textColor),
          ),
        ],
      ),
    );
  }
}
