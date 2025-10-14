import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/stock_card.dart';

class OrderBookingAddItemScreen extends StatefulWidget {
  const OrderBookingAddItemScreen({super.key});

  @override
  State<OrderBookingAddItemScreen> createState() =>
      _OrderBookingAddItemScreenState();
}

class _OrderBookingAddItemScreenState extends State<OrderBookingAddItemScreen> {
  final List<Map<String, dynamic>> items = [
    {
      "name": "Black & Broken Rice",
      "category": "Category Name",
      "stock": 0,
      "mrp": 2000.0,
      "tax": 18.0,
      "inclRate": 1800.0,
    },
    {
      "name": "Premium Rice",
      "category": "Category A",
      "stock": 12,
      "mrp": 2500.0,
      "tax": 12.0,
      "inclRate": 2300.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
            size: context.getSize.height * 0.024,
          ),
        ),
        title: Column(
          children: [
            Text(
              "Alackal Stores",
              style: context.textStyle.s20.indigoBlue.bold.roboto,
            ),
            Text(
              "Order Value : 18000.00",
              style: context.textStyle.s12.dustyBlue.w500.roboto,
            ),
            h4,
          ],
        ),
        centerTitle: true,
        actions: [
          SvgPicture.asset(
            AppAssets.refresh,
            height: context.getSize.height * 0.022,
            colorFilter: const ColorFilter.mode(
              ColorResources.indigoBlue,
              BlendMode.srcIn,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code, size: context.getSize.height * 0.022),
          ),
        ],
        toolbarHeight: 65,
      ),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  h10,
                  CustomTextField(
                    // controller: searchController,
                    hint: appLocalizations.manage_user_screen_search_user,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.search,
                        color: ColorResources.bluishGray,
                        size: context.getSize.height * 0.024,
                      ),
                    ),
                    backgroundColor: ColorResources.lightGray,
                    borderRadius: 12,
                    hintColor: ColorResources.silverGray,
                    borderColor: ColorResources.transparent,
                  ),
                  h6,
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h6,
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          height: context.getSize.height * 0.032,
                          arrowSize: context.getSize.height * 0.016,
                          label: appLocalizations
                              .order_booking_add_item_select_by_group,
                          labelTextStyle:
                              context.textStyle.dustyBlue.s10.w400.roboto,
                          hintText: appLocalizations
                              .order_booking_add_item_select_group,
                          hintTextStyle:
                              context.textStyle.bluishGray.s09.w300.roboto,
                          items: [],
                          onChanged: (value) {},
                        ),
                      ),
                      w5,
                      Expanded(
                        child: CustomDropdown(
                          height: context.getSize.height * 0.032,
                          arrowSize: context.getSize.height * 0.016,
                          label: appLocalizations
                              .order_booking_add_item_select_by_category,
                          labelTextStyle:
                              context.textStyle.dustyBlue.s10.w400.roboto,
                          hintText: appLocalizations
                              .order_booking_add_item_select_category,
                          hintTextStyle:
                              context.textStyle.bluishGray.s09.w300.roboto,
                          items: [],
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  h6,
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h6,
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = items[index];
              return Column(
                children: [
                  StockCard(
                    name: item["name"],
                    stock: item["stock"],
                    mrp: item["mrp"],
                    tax: item["tax"],
                    inclRate: item["inclRate"],
                  ),
                  h3,
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h3,
                ],
              );
            }, childCount: items.length),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appLocalizations.grand_total,
                            style: context.textStyle.indigoBlue.s12.w500.roboto,
                          ),
                          Text(
                            "72000.00",
                            style: context.textStyle.indigoBlue.s20.bold.roboto,
                          ),
                        ],
                      ),
                      CustomButton(
                        buttonText: "",
                        isborderEnable: false,
                        width: context.getSize.width / 2.5,
                        borderRadius: BorderRadius.circular(16),
                        icon: Icons.shopping_cart,
                        iconSize: 30,
                        iconColor: ColorResources.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class SliverListExample extends StatelessWidget {
//   const SliverListExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final items = [
//       {
//         "name": "Black & Broken Rice",
//         "category": "Category Name",
//         "stock": 0,
//         "mrp": 2000.0,
//         "tax": 18.0,
//         "inclRate": 1800.0,
//       },
//       {
//         "name": "Premium Rice",
//         "category": "Category A",
//         "stock": 12,
//         "mrp": 2500.0,
//         "tax": 12.0,
//         "inclRate": 2300.0,
//       },
//     ];

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           const SliverAppBar(
//             floating: true,
//             pinned: true,
//             title: Text("Stocks"),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate((context, index) {
//               final item = items[index];
//               return StockCard(
//                 name: item["name"] as String,
//                 category: item["category"] as String,
//                 stock: item["stock"] as int,
//                 mrp: item["mrp"] as double,
//                 tax: item["tax"] as double,
//                 inclRate: item["inclRate"] as double,
//               );
//             }, childCount: items.length),
//           ),
//         ],
//       ),
//     );
//   }
// }
