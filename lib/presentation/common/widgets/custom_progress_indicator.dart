import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mpos_beat/core/theme/colors.dart';

class CustomProgressIndicater extends StatelessWidget {
  const CustomProgressIndicater({
    this.backgroundColor,
    this.valueColor,
    this.value,
    super.key,
  });

  final Color? backgroundColor;
  final Color? valueColor;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: valueColor ?? ColorResources.white,
        size: 40.0,
      ),
    );
  }
}