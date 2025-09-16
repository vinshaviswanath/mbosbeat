// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_svg/svg.dart';
import 'package:mpos_beat/core/failures/value_object/value_failure.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/app_assets.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.textInputAction,
      this.iconData,
      this.enabled = true,
      required this.hint,
      this.suffixIcon,
      this.onChange,
      this.obscureText = false,
      this.controller,
      this.validater,
      this.inputType,
      this.fomeKey,
      this.inputFormatters,
      this.backgroundColor,
      this.borderRadius,
      this.hintColor,
      this.initialValue,
      this.onTap,
      this.failure,
      this.autovalidateMode,
      this.showError = false,
      this.readOnly = false,
      this.maxLength,
      this.prefixIcon,
      this.borderColor,
      this.minLines,
      this.maxLines,
      this.contentPadding,
      this.onTapOutside,
      this.hintTextStyle,
      this.errorPrefixIcon});

  final GlobalKey<FormState>? fomeKey;
  final Widget? iconData;
  final String hint;
  final TextInputType? inputType;
  final bool enabled;
  final void Function(String)? onChange;
  final String? Function(String?)? validater;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Color? backgroundColor;
  final Color? hintColor;
  final double? borderRadius;
  final String? initialValue;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool showError;
  final ValueFailure? failure;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTapOutside;
  final TextStyle? hintTextStyle;
  final Widget? errorPrefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.grey),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          child: TextFormField(
            onTapOutside: (event) {
              onTapOutside?.call();
            },
            minLines: obscureText ? 1 : minLines,
            maxLines: obscureText ? 1 : maxLines,
            maxLength: maxLength,
            initialValue: initialValue,
            onTap: onTap,
            enabled: enabled,
            controller: controller,
            obscureText: obscureText,
            keyboardType: inputType ?? TextInputType.text,
            textInputAction: textInputAction ?? TextInputAction.next,
            inputFormatters: inputFormatters,
            onChanged: onChange,
            validator: validater,
            readOnly: readOnly,
            style: context.textStyle.s12,
            decoration: InputDecoration(
              counterText: '',
              prefixIcon: iconData,
              suffixIcon: suffixIcon,
              hintText: hint,
              hintStyle: hintTextStyle ??
                  TextStyle(
                    color: hintColor,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          ),
        ),
        if (autovalidateMode == AutovalidateMode.always && failure != null)
          const Gap(5),
        if (autovalidateMode == AutovalidateMode.always && failure != null)
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.alertError,
                height: 16,
              ),
              const Gap(2),
              Text(
                failure!.errorMsg,
                style: context.textStyle.s10.roseRed,
              ),
            ],
          ),
      ],
    );
  }
}
