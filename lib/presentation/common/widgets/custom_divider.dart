import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: color ?? const Color(0xFFF1F3F7));
  }
}
