import 'package:mpos_beat/core/utils/imports.dart';

class CustomAnimatedExpandedWidget extends StatefulWidget {
  const CustomAnimatedExpandedWidget({
    super.key,
    required this.child,
    required this.isExpand,
    this.decoration,
  });

  final Widget child;
  final BoxDecoration? decoration;

  final bool isExpand;

  @override
  State<CustomAnimatedExpandedWidget> createState() =>
      _CustomAnimatedExpandedWidgetState();
}

class _CustomAnimatedExpandedWidgetState
    extends State<CustomAnimatedExpandedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _bottomSheetController;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _bottomSheetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _heightFactor = CurvedAnimation(
      parent: _bottomSheetController,
      curve: Curves.easeInOut,
    );
    if (widget.isExpand) {
      _bottomSheetController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomAnimatedExpandedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpand) {
      _bottomSheetController.forward();
    } else {
      _bottomSheetController.reverse();
    }
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _heightFactor,
      axisAlignment: -1.0,
      child: widget.child,
    );
  }
}
