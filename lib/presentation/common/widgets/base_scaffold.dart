import 'package:flutter/material.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/extentions.dart';

class BaseScaffold extends StatelessWidget {
  final Widget widget;
  final Widget? bottomSheet;
  static const routeName = 'base-scaffold';

  const BaseScaffold({
    super.key,
    required this.widget,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomSheet,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: context.getSize.height * 0.39,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                  color: ColorResources.indigoBlue,
                ),
              ),
            ],
          ),
          Positioned(top: 0, child: widget)
        ],
      ),
    );
  }
}
