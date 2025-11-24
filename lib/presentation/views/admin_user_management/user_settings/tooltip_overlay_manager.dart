//import 'package:flutter/material.dart';

// class TooltipOverlayManager {
//   static final TooltipOverlayManager _instance =
//       TooltipOverlayManager._internal();

//   factory TooltipOverlayManager() => _instance;

//   TooltipOverlayManager._internal();

//   OverlayEntry? _currentEntry;

//   void showTooltip(BuildContext context, OverlayEntry entry) {
//     _hideCurrent();
//     _currentEntry = entry;
//     Overlay.of(context).insert(_currentEntry!);
//   }

//   void _hideCurrent() {
//     _currentEntry?.remove();
//     _currentEntry = null;
//   }

//   void hideTooltip() {
//     _hideCurrent();
//   }
// }

import 'package:flutter/rendering.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class TooltipOverlayManager {
  static final TooltipOverlayManager _instance =
      TooltipOverlayManager._internal();
  factory TooltipOverlayManager() => _instance;
  TooltipOverlayManager._internal();

  OverlayEntry? _currentEntry;
  GlobalKey? _currentKey;
  Rect? _currentTooltipBounds;

  void hideCurrent() {
    if (_currentEntry != null) {
      print("🔹 Hiding tooltip for key: $_currentKey");
      _currentEntry?.remove();
      _currentEntry = null;
      _currentKey = null;
      _currentTooltipBounds = null;
    }
  }

  void toggleTooltip({
    required BuildContext context,
    required Widget content,
    required Offset position,
    required double width,
    required GlobalKey key,
    required RenderBox iconBox,
  }) {
    print("🔹 Tapped tooltip key: $key");

    // If same tooltip clicked → hide it
    if (_currentKey == key) {
      print("🔹 Same tooltip clicked → hiding");
      hideCurrent();
      return;
    }

    // Close any previously open tooltip
    if (_currentEntry != null) hideCurrent();

    final overlay = Overlay.of(context);
    if (overlay == null) return;

    _currentKey = key;
    _currentTooltipBounds = Rect.fromLTWH(
      position.dx + 10,
      position.dy + 20,
      width,
      0,
    );

    _currentEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Full-screen listener to detect taps outside tooltip
          Positioned.fill(
            child: Listener(
              behavior: HitTestBehavior.translucent,
              onPointerDown: (event) {
                final tooltipRect = _currentTooltipBounds;
                final iconRect =
                    iconBox.localToGlobal(Offset.zero) & iconBox.size;

                if (tooltipRect != null &&
                    !tooltipRect.contains(event.position) &&
                    !iconRect.contains(event.position)) {
                  print("Tap outside tooltip → hiding tooltip");
                  hideCurrent();
                } else {
                  print("Tap inside tooltip or icon → do nothing");
                }
              },
              child: Container(),
            ),
          ),
          // Tooltip content with dynamic height
          Positioned(
            left: 10,
            top: position.dy + 20,
            width: width,
            child: _TooltipSizeWrapper(
              onLayout: (size) {
                _currentTooltipBounds = Rect.fromLTWH(
                  position.dx + 10,
                  position.dy + 20,
                  width,
                  size.height,
                );
              },
              child: Material(
                color: Colors.white,
                elevation: 4,
                borderRadius: BorderRadius.circular(12),
                child: content,
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_currentEntry!);
  }
}

// Widget to measure tooltip size after layout
class _TooltipSizeWrapper extends SingleChildRenderObjectWidget {
  final void Function(Size size) onLayout;
  const _TooltipSizeWrapper({required Widget child, required this.onLayout})
    : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _TooltipSizeRenderObject(onLayout);
}

class _TooltipSizeRenderObject extends RenderProxyBox {
  final void Function(Size size) onLayout;
  _TooltipSizeRenderObject(this.onLayout);

  @override
  void performLayout() {
    super.performLayout();
    onLayout(size);
  }
}
