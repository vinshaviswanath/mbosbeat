import 'package:flutter_svg/svg.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/diamentions.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/theme/theme/theme_provider.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_material_button.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_progress_indicator.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function()? onTap;
  final Color? color;
  final String? imagePath;
  final String buttonText;
  final TextStyle? textStyle;
  final bool isborderEnable;
  final List<BoxShadow>? boxShadow;
  final ColorFilter? colorFilter;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final bool loadingEnabled;
  final Color? borderColor;
  final EdgeInsetsGeometry? buttonPadding;
  final BorderRadiusGeometry? borderRadius;
  const CustomButton({
    super.key,
    this.onTap,
    this.color,
    this.imagePath,
    required this.buttonText,
    this.borderColor,
    this.textStyle,
    required this.isborderEnable,
    this.boxShadow,
    this.height,
    this.width,
    this.colorFilter,
    this.gradient,
    this.padding,
    this.loadingEnabled = false,
    this.buttonPadding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, _) {
        return Container(
          padding: buttonPadding,
          height: height ?? context.getSize.height * 0.06,
          width: width,
          decoration: BoxDecoration(
            color: color ?? ColorResources.indigoBlue,
            // gradient: color == null
            //     ? gradient ?? getButtonColor(provider.themeMode)
            //     : null,
            borderRadius: borderRadius ?? BorderRadius.circular(45),
            border: isborderEnable == true
                ? Border.all(color: borderColor ?? ColorResources.indigoBlue)
                : null,
            boxShadow: boxShadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: CustomMaterialButton(
              onPressed: () {
                onTap?.call();
              },
              child: Padding(
                padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
                child: loadingEnabled
                    ? const CustomProgressIndicater()
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (imagePath != null) ...[
                            SvgPicture.asset(
                              imagePath!,
                              colorFilter: colorFilter,
                              width: 24,
                            ),
                            w4,
                          ],
                          Text(
                            buttonText,
                            style:
                                textStyle ??
                                context.textStyle.s16.bold.white.roboto,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  // LinearGradient getButtonColor(AppThemeMode mode) {
  //   switch (mode) {
  //     case AppThemeMode.light:
  //     case AppThemeMode.dark:
  //       return const LinearGradient(colors: [
  //         ColorResources.buttonGradientColor1,
  //         ColorResources.buttonGradientColor2
  //       ]);
  //   }
  // }
}
