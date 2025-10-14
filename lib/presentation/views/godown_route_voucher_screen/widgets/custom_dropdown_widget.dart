import 'package:flutter/material.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_animated_expanded_widget.dart';

class CustomDropdownWidget extends StatefulWidget {
  const CustomDropdownWidget({
    super.key,
    required this.child,
    required this.title,
    required this.isExpand,
  });
  final Widget title;
  final Widget child;
  final bool isExpand;

  @override
  State<CustomDropdownWidget> createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.title,
        CustomAnimatedExpandedWidget(
          isExpand: widget.isExpand,
          child: widget.child,
        ),
      ],
    );
  }
}
