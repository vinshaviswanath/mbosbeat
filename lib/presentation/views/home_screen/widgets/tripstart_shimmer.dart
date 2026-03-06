import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TripStartShimmer extends StatelessWidget {
  const TripStartShimmer({super.key});

  Widget _box({
    double height = 16,
    double width = double.infinity,
    BorderRadius? radius,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius ?? BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER SHIMMER
            _box(width: 100),

            const SizedBox(height: 12),

            /// TRIP SUMMARY CARDS
            Row(
              children: [
                Expanded(child: _box(height: 90)),
                const SizedBox(width: 12),
                Expanded(child: _box(height: 90)),
                const SizedBox(width: 12),
                Expanded(child: _box(height: 90)),
              ],
            ),
            const SizedBox(height: 24),

            /// Transactions & Reports
            Row(
              children: [
                Expanded(child: _box(height: 190)),
                const SizedBox(width: 12),
                Expanded(child: _box(height: 190)),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _box(height: 190)),
                const SizedBox(width: 12),
                Expanded(child: _box(height: 190)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
