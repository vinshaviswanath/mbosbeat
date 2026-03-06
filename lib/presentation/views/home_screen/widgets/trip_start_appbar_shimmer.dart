import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppbarShimmer extends StatelessWidget {
  const AppbarShimmer({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// LEFT SIDE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _box(width: 80, height: 12),
                    const SizedBox(height: 6),
                    _box(width: 160, height: 12),
                  ],
                ),

                /// RIGHT SIDE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _box(width: 70, height: 12),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        _box(width: 40, height: 12),
                        const SizedBox(width: 6),
                        _box(
                          width: 10,
                          height: 10,
                          radius: BorderRadius.circular(10),
                        ),
                        const SizedBox(width: 6),
                        _box(
                          width: 45,
                          height: 16,
                          radius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        _box(width: 40, height: 12),
                        const SizedBox(width: 6),
                        _box(
                          width: 10,
                          height: 10,
                          radius: BorderRadius.circular(10),
                        ),
                        const SizedBox(width: 6),
                        _box(
                          width: 45,
                          height: 16,
                          radius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
