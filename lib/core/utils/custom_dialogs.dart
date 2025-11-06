import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_progress_indicator.dart';

class CustomDialog {
  /// Centered custom dialog
  static Future<T?> showCustomDialog<T>({
    required Widget chid,
    double? margin,
    double? borderRadius,
    MainAxisAlignment? mainAxisAlignment,
  }) {
    return showDialog<T>(
      context: AppDetails.globalNavigatorKey.currentContext!,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(margin ?? 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorResources.transparent),
                    color: ColorResources.white,
                    borderRadius: BorderRadius.circular(borderRadius ?? 24),
                  ),
                  child: chid,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Bottom custom dialog (scrollable)
  static Future<T?> showCustomBottomDialog<T>({
    required Widget chid,
    double? margin,
    MainAxisAlignment? mainAxisAlignment,
    double? borderRadius,
    double? paddingBottom,
  }) {
    return showDialog<T>(
      barrierDismissible: true,
      context: AppDetails.globalNavigatorKey.currentContext!,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: SingleChildScrollView(
            reverse: true,
            padding: paddingBottom != null
                ? MediaQuery.of(
                    context,
                  ).viewInsets.copyWith(bottom: paddingBottom)
                : MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(margin ?? 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorResources.transparent),
                    color: ColorResources.white,
                    borderRadius: BorderRadius.circular(borderRadius ?? 24),
                  ),
                  child: chid,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Bottom custom dialog with blur background
  static Future<T?> showBottomCustomDialog<T>({
    required Widget chid,
    double? margin,
    double? borderRadius,
    MainAxisAlignment? mainAxisAlignment,
    bool blure = false,
    bool canPop = true,
    EdgeInsetsGeometry? padding,
  }) {
    return showDialog<T>(
      barrierDismissible: false,
      context: AppDetails.globalNavigatorKey.currentContext!,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(
            context,
          ).unfocus(), // dismiss keyboard on tap outside
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blure ? 2 : 0,
              sigmaY: blure ? 2 : 0,
            ),
            child: Material(
              type: MaterialType.transparency,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: padding ?? const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.transparent),
                          color: ColorResources.white,
                          borderRadius: BorderRadius.circular(
                            borderRadius ?? 24,
                          ),
                        ),
                        child: chid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Progress dialog
  static Future<T?> showProgrssDialog<T>() {
    return showDialog<T>(
      context: AppDetails.globalNavigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const Material(
          type: MaterialType.transparency,
          child: Center(
            child: CustomProgressIndicater(valueColor: ColorResources.white),
          ),
        ),
      ),
    );
  }
}
