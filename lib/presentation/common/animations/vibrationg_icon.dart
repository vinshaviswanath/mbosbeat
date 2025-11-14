import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpos_beat/core/theme/colors.dart';

class VibratingIconAnimation extends StatefulWidget {
  final String icon;
  final double size;
  final Color color;

  const VibratingIconAnimation({
    super.key,
    required this.icon,
    this.size = 65,
    this.color = ColorResources.white,
  });

  @override
  State<VibratingIconAnimation> createState() => _VibratingIconAnimationState();
}

class _VibratingIconAnimationState extends State<VibratingIconAnimation>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _shakeController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    // Scale controller → one-time grow/shrink
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    // Shake controller → oscillates rotation for vibration effect
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _shakeAnimation = Tween<double>(begin: -0.04, end: 0.04).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.easeInOut),
    );
  }

  void _startAnimation() async {
    HapticFeedback.heavyImpact();

    // scale up then back down
    await _scaleController.forward();
    await _scaleController.reverse();

    // small shake
    await _shakeController.forward();
    await _shakeController.reverse();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _startAnimation,
      child: AnimatedBuilder(
        animation: Listenable.merge([_scaleController, _shakeController]),
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _shakeAnimation.value + 0.05,
              child: Image.asset(
                widget.icon,
                height: widget.size,
                color: widget.color,
              ),
            ),
          );
        },
      ),
    );
  }
}
