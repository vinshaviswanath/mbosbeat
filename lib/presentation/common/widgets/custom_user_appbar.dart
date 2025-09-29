import 'package:flutter/material.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';

class CustomUserAppbar extends StatelessWidget {
  const CustomUserAppbar({
    super.key,
    this.onPressed,
    required this.title,
    this.showBackButton,
    this.leading,
  });

  final void Function()? onPressed;
  final String title;
  final bool? showBackButton;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: ColorResources.transparent,
      surfaceTintColor: ColorResources.transparent,
      backgroundColor: ColorResources.lightGray,
      leading: leading,
      iconTheme: const IconThemeData(color: ColorResources.lightGray),
      centerTitle: true,
      title: Text(title, style: context.textStyle.s22.indigoBlue.bold),
    );
  }
}
