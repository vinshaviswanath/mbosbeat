import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CheckInOutShimmer extends StatelessWidget {
  const CheckInOutShimmer({super.key});

  Widget _box({
    double height = 12,
    double width = double.infinity,
    BorderRadius? radius,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius ?? BorderRadius.circular(6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TOP SECTION
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// LEFT PARTY DETAILS
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _box(width: 140, height: 14),
                      const SizedBox(height: 6),

                      _box(width: 120),
                      const SizedBox(height: 6),

                      _box(width: 160),
                      const SizedBox(height: 6),

                      _box(width: 110),
                      const SizedBox(height: 6),

                      _box(width: 180),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                /// RIGHT BALANCE + BUTTONS
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _box(width: 60),
                    const SizedBox(height: 6),

                    _box(width: 70, height: 16),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        _box(
                          width: 60,
                          height: 22,
                          radius: BorderRadius.circular(12),
                        ),
                        const SizedBox(width: 8),
                        _box(
                          width: 60,
                          height: 22,
                          radius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// DIVIDER
            Container(height: 1, width: double.infinity, color: Colors.white),

            const SizedBox(height: 16),

            /// MODULE SUMMARY TITLE
            _box(width: 120, height: 14),

            const SizedBox(height: 12),

            /// TAB BUTTONS
            Row(
              children: [
                _box(width: 110, height: 32, radius: BorderRadius.circular(20)),
                const SizedBox(width: 8),
                _box(width: 110, height: 32, radius: BorderRadius.circular(20)),
                const SizedBox(width: 8),
                _box(width: 110, height: 32, radius: BorderRadius.circular(20)),
              ],
            ),
            const SizedBox(height: 20),

            /// 🔹 LIST PLACEHOLDER (10 boxes, 2 per row)
            Column(
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(child: _box(height: 100)),
                      const SizedBox(width: 12),
                      Expanded(child: _box(height: 100)),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
