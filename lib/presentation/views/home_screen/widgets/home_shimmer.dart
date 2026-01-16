import 'package:mpos_beat/core/utils/imports.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

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
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 HEADER LEFT
              _box(width: 120),
              const SizedBox(height: 8),
              _box(height: 26, width: 220),
              const SizedBox(height: 6),
              _box(width: 90),
              const SizedBox(height: 24),

              /// 🔹 HEADER RIGHT (Day / Route)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _box(width: 60, height: 14),
                  const SizedBox(width: 8),
                  _box(
                    width: 40,
                    height: 16,
                    radius: BorderRadius.circular(12),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// 🔹 TRIP SUMMARY TITLE
              _box(width: 100),
              const SizedBox(height: 12),

              /// 🔹 TRIP SUMMARY CARDS
              Row(
                children: [
                  Expanded(child: _box(height: 90)),
                  const SizedBox(width: 12),
                  Expanded(child: _box(height: 90)),
                  const SizedBox(width: 12),
                  Expanded(child: _box(height: 90)),
                ],
              ),

              const SizedBox(height: 30),

              /// 🔹 TRANSACTION / LIST PLACEHOLDER
              _box(height: 120),
              const SizedBox(height: 16),
              _box(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
