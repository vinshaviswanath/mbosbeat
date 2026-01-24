import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/order_details_widget.dart';

class StockCard extends StatefulWidget {
  final int itemId; // ✅ ADD
  final int priceListId; // ✅ ADD
  final String name;
  final int stock;
  final double mrp;
  final double tax;
  final double inclRate;
  final int companyId;

  const StockCard({
    super.key,
    required this.name,
    required this.stock,
    required this.mrp,
    required this.tax,
    required this.inclRate,
    required this.companyId,
    required this.itemId,
    required this.priceListId,
  });

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),

      decoration: BoxDecoration(
        color: ColorResources.lightGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: context.textStyle.dustyBlue.s12.w500.roboto,
                    ),
                    h4,
                    Text(
                      appLocalizations.stock_card_group,
                      style: context.textStyle.dustyBlue.s09.w400.roboto,
                    ),
                    Text(
                      appLocalizations.stock_card_category_name,
                      style: context.textStyle.dustyBlue.s09.w400.roboto,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${appLocalizations.stock_card_sealable_stock} ${widget.stock} ${appLocalizations.stock_card_qls}",
                    style: context.textStyle.indigoBlue.s12.bold.roboto,
                  ),
                  Row(
                    children: [
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       appLocalizations.stock_card_mrp,
                      //       style: context.textStyle.rosePink.s09.w400.roboto,
                      //     ),
                      //     Text(
                      //       widget.mrp.toStringAsFixed(0),
                      //       style: context.textStyle.rosePink.s09.w400.roboto,
                      //     ),
                      //   ],
                      // ),
                      w18,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appLocalizations.stock_card_tax_percentage,
                            style: context.textStyle.rosePink.s09.w400.roboto,
                          ),
                          Text(
                            "${widget.tax.toStringAsFixed(0)}%",
                            style: context.textStyle.rosePink.s09.w400.roboto,
                          ),
                        ],
                      ),
                      w16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appLocalizations.stock_card_inc_rate,
                            style: context.textStyle.rosePink.s09.w400.roboto,
                          ),
                          Text(
                            widget.inclRate.toStringAsFixed(2),
                            style: context.textStyle.rosePink.s09.w400.roboto,
                          ),
                        ],
                      ),
                      w13,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showDetails = !_showDetails;
                          });
                        },
                        child: CircleAvatar(
                          radius: context.getSize.height * 0.010,
                          backgroundColor: ColorResources.indigoBlue,
                          child: Icon(
                            _showDetails
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: ColorResources.white,
                            size: context.getSize.height * 0.016,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          if (_showDetails)
            OrderDetailsWidget(
              companyId: widget.companyId,
              itemId: widget.itemId,
              priceListId: widget.priceListId,
              inclRate: widget.inclRate,
              onDelete: () {
                setState(() {
                  _showDetails = false;
                });
              },
            ),
        ],
      ),
    );
  }
}
