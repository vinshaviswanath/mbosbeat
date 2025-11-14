import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_switch.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/popover_body.dart';
import 'package:popover/popover.dart';

class InfoTooltip extends StatefulWidget {
  final String title;
  final String description;
  final bool initialValue;
  final ValueChanged<bool>? onToggle;
  final Widget? child;
  final bool ispremium;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const InfoTooltip({
    super.key,
    required this.title,
    required this.description,
    this.initialValue = false,
    this.onToggle,
    this.child,
    this.ispremium = false,
    this.style,
    this.padding,
    this.backgroundColor,
  });

  @override
  State<InfoTooltip> createState() => _InfoTooltipState();
}

class _InfoTooltipState extends State<InfoTooltip> {
  final GlobalKey _iconKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  bool _isOn = false;

  @override
  void initState() {
    super.initState();
    // ✅ Initialize toggle value correctly
    _isOn = widget.initialValue;
  }

  void _showTooltip() {
    if (_overlayEntry != null) return;

    final renderBox = _iconKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _hideTooltip,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: position.dy + renderBox.size.height,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: context.getSize.width - 32,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color:ColorResources.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 8),
                        color: ColorResources.black.withValues(alpha: 0.2),
                        blurRadius: 13,
                      ),
                    ],
                  ),
                  child: Text(
                    widget.description,
                    style: context.textStyle.s09.w300.dustyBlue.roboto,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _toggleTooltip() {
    if (_overlayEntry == null) {
      _showTooltip();
    } else {
      _hideTooltip();
    }
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          widget.padding ??
          const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
      decoration: BoxDecoration(
        color:
            widget.backgroundColor ??
            ColorResources.indigoBlue.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style:
                      widget.style ??
                      context.textStyle.s12.w400.bluishGray.roboto,
                ),
              ),
              if (widget.ispremium == true) ...[
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: ColorResources.amber,
                  child: Icon(
                    Icons.currency_rupee_outlined,
                    size: 14,
                    color: ColorResources.white,
                  ),
                ),
                w8,
              ],
              CustomSwitch(
                value: widget.initialValue || _isOn,
                thumbColor: !widget.initialValue || !_isOn
                    ? ColorResources.bluishGray
                    : ColorResources.white,
                borderColor: !widget.initialValue || !_isOn
                    ? ColorResources.neutralmidgray
                    : ColorResources.transparent,
 onChanged: (val) {
                  setState(() => _isOn = val);
                  debugPrint("Switch is now: $val");
                  // ✅ Notify parent screen
                  if (widget.onToggle != null) {
                    widget.onToggle!(val);
                  }
 },
              ),
              w8,
              Builder(
                builder: (context) {
                  return GestureDetector(
                    // key: _iconKey,
                    // onTap: _toggleTooltip,
                    onTap: () {
                      showPopover(
                        context: context,
                        bodyBuilder: (context) => Material(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorResources.white,
                          shadowColor: ColorResources.black,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              widget.description.isNotEmpty
                                  ? widget.description
                                  : "By enabling this feature, it will allow the user to use this feature. This is just a demonstration message.",
                              style:
                                  context.textStyle.s09.w300.dustyBlue.roboto,
                            ),
                          ),
                        ),
                        direction: PopoverDirection.bottom,
                        arrowDyOffset: 10,
                        arrowDxOffset: -200,
                        radius: 16,
                        shadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: ColorResources.black.withValues(alpha: 0.2),
                          ),
                        ],
                        width: context.getSize.width / 1.1,
                        // height: 120,
                        arrowHeight: 0,
                        arrowWidth: 30,
                        backgroundColor:ColorResources.white,
                        barrierColor: Colors.transparent,
                      );
                    },
                    child: const Icon(
                      Icons.info_outline,
                      color: ColorResources.indigoBlue,
                      size: 16,
                    ),
                  );
                },
              ),
            ],
          ),
          if (widget.child != null) ...[
            h8,
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widget.child,
            ),
          ],
        ],
      ),
    );
  }
}
