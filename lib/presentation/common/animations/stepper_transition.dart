import 'package:flutter/material.dart';
import 'package:mpos_beat/core/utils/enums.dart';

class StepperTransition extends StatefulWidget {
  final int delay;
  final Widget child;
  final TransitionDirection transitionDirection;

  const StepperTransition({
    super.key,
    required this.delay,
    required this.child,
    this.transitionDirection = TransitionDirection.leftToRight,
  });

  @override
  State<StepperTransition> createState() => _StepperTransitionState();
}

class _StepperTransitionState extends State<StepperTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _stepperController;
  late Animation<double> _opacity;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    final totalDuration = Duration(milliseconds: widget.delay + 500);

    _stepperController = AnimationController(
      vsync: this,
      duration: totalDuration,
    );

    // calculate interval based on delay
    final start = widget.delay / (widget.delay + 500);

    // opacity animation
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _stepperController,
        curve: Interval(start, 1.0, curve: Curves.easeIn),
      ),
    );

    // determine slide direction
    Offset beginOffset;
    switch (widget.transitionDirection) {
      case TransitionDirection.leftToRight:
        beginOffset = const Offset(-1.0, 0);
        break;
      case TransitionDirection.rightToLeft:
        beginOffset = const Offset(1.0, 0);
        break;
      case TransitionDirection.topToBottom:
        beginOffset = const Offset(0, -1.0);
        break;
      case TransitionDirection.bottomToTop:
        beginOffset = const Offset(0, 1.0);
        break;
    }

    // slide animation
    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _stepperController,
        curve: Interval(start, 1.0, curve: Curves.easeOut),
      ),
    );

    _stepperController.forward();
  }

  @override
  void dispose() {
    _stepperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _stepperController,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: Offset(
              _slideAnimation.value.dx * 50,
              _slideAnimation.value.dy * 50,
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
