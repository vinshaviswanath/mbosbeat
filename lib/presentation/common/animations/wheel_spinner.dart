import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/enums.dart';

class WheelSpinner extends StatefulWidget {
  const WheelSpinner({
    super.key,
    required this.path,
    required this.imageType,
    this.height,
    this.width,
    this.filterColor,
  });

  final String path;
  final ImageType imageType;
  final double? height;
  final double? width;
  final Color? filterColor;

  @override
  State<WheelSpinner> createState() => WheelSpinnerState();
}

class WheelSpinnerState extends State<WheelSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _wheelController;

//Repeated spinning
  // @override
  // void initState() {
  //   super.initState();
  //   _wheelController = AnimationController(
  //     vsync: this,
  //     duration:
  //         const Duration(seconds: 2), // Adjust the duration for rotation speed
  //   )..repeat(); // Repeat the animation indefinitely
  // }
  
    @override
  void initState() {
    super.initState();
    _wheelController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // spins for 2s
    );
  }

  bool _isDisposed = false;
  
  void startSpin() {
    if (_wheelController.isAnimating) return; // avoid repeat while running
    _wheelController.forward(from: 0);        // 2s, once
  }

  @override
  void dispose() {
    if (!_isDisposed) {
      _wheelController.dispose();
      _isDisposed = true;
    }
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _wheelController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _wheelController.value * 2 * pi, // one full spin
          child: child,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
              widget.filterColor ?? ColorResources.amber, BlendMode.srcIn),
          child: widget.imageType == ImageType.png
              ? Image.asset(
                  widget.path,
                  width: widget.width ?? 28,
                  height: widget.height ?? 28,
                )
              : SvgPicture.asset(
                  widget.path,
                  width: widget.width ?? 28,
                  height: widget.height ?? 28,
                ),
        ),
      ),
    );
  }
}