import 'package:flutter/material.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.onPressed,
    required this.title,
    this.showBackButton, this.leading,

  });
  final void Function()? onPressed;
  final String title;
  final bool? showBackButton;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: ColorResources.transparent,
      surfaceTintColor: ColorResources.transparent,
      backgroundColor: ColorResources.transparent,
      leading: leading,
      // showBackButton == true
      //     ? Padding(
      //         padding: const EdgeInsets.only(left: 16),
      //         child: IconButton(
      //             onPressed: onPressed ?? () => Navigator.pop(context),
      //             icon: const Icon(
      //               Icons.keyboard_arrow_left,
      //               size: 32,
      //             )),
      //       )
      //     : const SizedBox.shrink(),
      iconTheme: const IconThemeData(color: ColorResources.white),
      centerTitle: true,
      title: Text(
        title,
        style: context.textStyle.s24.white.bold,
      ),
    );
  }
}
