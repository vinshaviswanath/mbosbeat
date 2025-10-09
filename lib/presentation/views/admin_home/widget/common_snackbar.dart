import 'package:mpos_beat/core/utils/imports.dart';

class CommonSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = const Color.fromARGB(255, 113, 114, 116),
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        behavior: SnackBarBehavior.floating,
        duration: duration,
        backgroundColor: backgroundColor,
        content: Text(
          message,
          maxLines: 2,
          style: context.textStyle.s12.w600.raleway.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          // GoogleFonts.raleway(
          //   fontWeight: FontWeight.w600,
          //   fontSize: 13,
          //   color: Theme.of(context).colorScheme.onPrimary,
          // ),
        ),
      ),
    );
  }
}
