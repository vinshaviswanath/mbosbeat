import 'package:mpos_beat/core/utils/imports.dart';

class CompletedTickMark extends StatelessWidget {
  final double size;
  const CompletedTickMark({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: ColorResources.lightgreen,
        shape: BoxShape.circle,

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: const Center(
        child: Icon(Icons.check, size: 13, color: ColorResources.white),
      ),
    );
  }
}
