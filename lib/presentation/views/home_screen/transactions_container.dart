import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class TransactionsContainers extends StatelessWidget {
  final RegistrationDetail userDetails;
  final Company company;
  const TransactionsContainers({
    super.key,
    required this.userDetails,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      TransactionItem(
        title: "Customer",
        subtitle: "Transactions",
        gradientColors: [
          const Color.fromARGB(255, 166, 210, 245),
          const Color(0xfff1676BF),
        ],
        avatarColor: const Color.fromARGB(255, 117, 188, 247),
        icon: Icons.person_pin_outlined,
        routeName: AppRouterConst.customerTransactions,
        userDetails: userDetails,
        company: company,
      ),
      TransactionItem(
        title: "Other",
        subtitle: "Transactions",
        gradientColors: [
          const Color.fromARGB(255, 247, 168, 205),
          const Color(0xfffF04A99),
        ],
        avatarColor: const Color.fromARGB(255, 245, 159, 199),
        icon: Icons.event_note_outlined,
        routeName: AppRouterConst.otherTransaction,
        userDetails: userDetails,
        company: company,
      ),
      TransactionItem(
        title: "Dashboard",
        subtitle: "",
        gradientColors: [
          const Color.fromARGB(255, 245, 221, 174),
          const Color(0xfffF8BA40),
        ],
        avatarColor: const Color.fromARGB(255, 245, 216, 160),
        icon: Icons.now_widgets_outlined,
        userDetails: userDetails,
        company: company,
      ),
      TransactionItem(
        title: "Other",
        subtitle: "Transactions",
        gradientColors: [
          const Color.fromARGB(255, 210, 169, 248),
          const Color(0xfff9E52E4),
        ],
        avatarColor: const Color.fromARGB(255, 201, 155, 245),
        icon: Icons.receipt_outlined,
        userDetails: userDetails,
        company: company,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Transactions & Reports",
          style: context.textStyle.s14.dustyBlue.w400.roboto,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.010),

        Wrap(
          spacing: MediaQuery.of(context).size.width * 0.015,
          runSpacing: MediaQuery.of(context).size.height * 0.015,
          children: items.map((item) => TransactionCard(item: item)).toList(),
        ),
      ],
    );
  }
}

/// ✅ Data model
class TransactionItem {
  final String title;
  final String subtitle;
  final List<Color> gradientColors;
  final Color avatarColor;
  final IconData icon;
  final String? routeName;
  final RegistrationDetail userDetails;
  final Company company;

  TransactionItem({
    required this.title,
    required this.subtitle,
    required this.gradientColors,
    required this.avatarColor,
    required this.icon,
    this.routeName,
    required this.userDetails,
    required this.company,
  });
}

class TransactionArgs {
  final RegistrationDetail userDetails;
  final Company company;

  TransactionArgs({required this.userDetails, required this.company});
}

/// ✅ Reusable Card widget
class TransactionCard extends StatelessWidget {
  final TransactionItem item;

  const TransactionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        if (item.routeName != null) {
          context.pushNamed(item.routeName!, extra: TransactionArgs(company: item.company,userDetails: item.userDetails));
        }
      },
      child: Stack(
        children: [
          Container(
            width: size.width * 0.45,
            height: size.height * 0.22,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: item.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: context.textStyle.s14.white.roboto),
                  if (item.subtitle.isNotEmpty)
                    Text(
                      item.subtitle,
                      style: context.textStyle.s18.white.roboto,
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 38,
            left: 8,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: item.avatarColor,
              child: Icon(item.icon, size: 30, color: ColorResources.white),
            ),
          ),
        ],
      ),
    );
  }
}
