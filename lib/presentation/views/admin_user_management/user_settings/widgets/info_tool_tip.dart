import 'package:mpos_beat/core/utils/imports.dart';

class InfoTooltip extends StatefulWidget {
  final String title;
  final String description;
  final bool initialValue;
  final ValueChanged<bool>? onToggle;

  const InfoTooltip({
    super.key,
    required this.title,
    required this.description,
    this.initialValue = false,
    this.onToggle,
  });

  @override
  State<InfoTooltip> createState() => _InfoTooltipState();
}

class _InfoTooltipState extends State<InfoTooltip> {
  final GlobalKey _iconKey = GlobalKey();
  OverlayEntry? _overlayEntry;

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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 8),
                        color: Color(0x0000000D),
                        blurRadius: 13,
                      ),
                    ],
                  ),
                  child: Text(
                    widget.description,
                    style: const TextStyle(color: Colors.black87, fontSize: 13),
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

  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
      decoration: BoxDecoration(
        color: ColorResources.indigoBlue.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: context.textStyle.s12.w400.bluishGray.roboto,
            ),
          ),
          CustomSwitch(
            value: _isOn,
            onChanged: (val) {
              setState(() => _isOn = val);
              debugPrint("Switch is now: $val");
            },
          ),
          w8,
          GestureDetector(
            key: _iconKey,
            onTap: _toggleTooltip,
            child: const Icon(
              Icons.info_outline,
              color: ColorResources.indigoBlue,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? borderColor;
  final Color? thumbColor;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.borderColor,
    this.thumbColor,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  void _toggleSwitch() {
    setState(() {
      _value = !_value;
      widget.onChanged(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 40,
        height: 22,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: widget.borderColor ?? ColorResources.transparent,
          ),
          color: _value ? ColorResources.indigoBlue : ColorResources.white,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: _value
                  ? Colors.white
                  : widget.thumbColor ?? ColorResources.white,

              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
