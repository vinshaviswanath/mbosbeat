import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/trip_summary/trip_summary_item.dart';

class TripSummarySection extends StatelessWidget {
  const TripSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final summaryItems = [
      SummaryItem(
        value: "3.00",
        label: "Customers\nVisited",
        backgroundColor: ColorResources.pastelPurple,
        textColor: ColorResources.dustyBlue,
      ),
      SummaryItem(
        value: "1.00",
        label: "Customers\nSkipped",
        backgroundColor: ColorResources.lavenderBlue,
        textColor: ColorResources.dustyBlue,
      ),
      SummaryItem(
        value: "0.00",
        label: "Total\nValue",
        backgroundColor: ColorResources.peachPink,
        textColor: ColorResources.dustyBlue,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trip Summary", style: context.textStyle.s14.dustyBlue.roboto),
          const SizedBox(height: 12),
          TripSummary(items: summaryItems),
        ],
      ),
    );
  }
}