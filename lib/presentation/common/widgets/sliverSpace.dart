import 'package:flutter/material.dart';

class SliverSpace extends StatelessWidget {
  const SliverSpace({super.key, required this.diamention});
  final Widget diamention;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: diamention);
  }
}