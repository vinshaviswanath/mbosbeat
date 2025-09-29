import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        behavior: SnackBarBehavior.floating,
        duration: duration,
        backgroundColor: backgroundColor,
        content: Text(
          message,
          maxLines: 2,
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
