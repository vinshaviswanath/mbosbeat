import 'package:flutter/material.dart';
import 'user_card_shimmer.dart';

class UserListShimmer extends StatelessWidget {
  const UserListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const UserCardShimmer(),
            childCount: 10, // load 10 shimmer items
          ),
        ),
      ],
    );
  }
}
