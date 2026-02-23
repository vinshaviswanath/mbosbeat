import 'package:flutter/services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/product.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';

class OrderDetailsWidget extends StatefulWidget {
  final int companyId;
  final int itemId;
  final int priceListId;
  final VoidCallback? onDelete;
  final TransactionOrderBookingRouteArgs data;
  final Product item;

  const OrderDetailsWidget({
    super.key,
    required this.companyId,
    required this.itemId,
    required this.priceListId,
    this.onDelete,
    required this.data,
    required this.item,
  });

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  late final TextEditingController _discountController;
  late final TextEditingController _freeQtyController;

  DiscountType? _initializedDiscountType;

  @override
  void initState() {
    super.initState();
    _discountController = TextEditingController();
    _freeQtyController = TextEditingController();
  }

  @override
  void dispose() {
    _discountController.dispose();
    _freeQtyController.dispose();
    super.dispose();
  }

  String _formatDiscount(double value, DiscountType type) {
    return type == DiscountType.amount
        ? value.toStringAsFixed(2)
        : value.toStringAsFixed(0);
  }

  List<TextInputFormatter> _discountFormatters(DiscountType type) {
    return type == DiscountType.amount
        ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))]
        : [FilteringTextInputFormatter.digitsOnly];
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final provider = context.watch<CustomerTransactionProvider>();

    final qty = provider.getQty(widget.itemId);

    /// ---------------- BASE RATE ----------------
    final double baseRate = widget.item.rate;

    /// ---------------- DISCOUNT INIT ----------------
    final DiscountType discountType =
        widget.item.discountType == 'A'
            ? DiscountType.amount
            : DiscountType.percentage;

    final double discountValue = widget.item.discount ?? 0;

    if (_initializedDiscountType == null) {
      _initializedDiscountType = discountType;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        provider.setInitialDiscount(
          widget.itemId,
          discountValue,
          discountType,
        );
        _discountController.text =
            _formatDiscount(discountValue, discountType);
      });
    }

    final currentDiscountType =
        provider.getDiscountType(widget.itemId) ?? discountType;

    /// ---------------- UNIT ----------------
    final String selectedUnit =
        provider.getSelectedUnit(widget.itemId, widget.item);

    /// ---------------- RATE (EXCLUSIVE) ----------------
    final double rate = provider.getConvertedRate(
      item: widget.item,
      selectedUnit: selectedUnit,
      baseRate: baseRate,
    );

    /// ---------------- INCLUSIVE RATE ----------------
    final double taxPercent = widget.item.taxPercent ?? 0;
    final double inclRate = rate + (rate * taxPercent / 100);

    /// ---------------- TOTAL ----------------
    final double total = provider.calculateNetTotal(
      itemId: widget.itemId,
      qty: qty,
      inclRate: inclRate,
    );

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: ColorResources.lightGray),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ================= QTY / RATE / DISCOUNT =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// QTY
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalization.order_detail_widget_order_qty,
                    style: context.textStyle.s10.w400.indigoBlue.roboto
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                  h4,
                  Row(
                    children: [
                      Container(
                        width: context.getSize.width * 0.13,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            qty.toStringAsFixed(0),
                            style:
                                context.textStyle.s10.w500.dustyBlue.roboto,
                          ),
                        ),
                      ),
                      w6,
                      Column(
                        children: [
                          QtyButton(
                            icon: Icons.remove,
                            onTap: () => provider.decrementQty(
                              widget.itemId,
                              inclRate,
                            ),
                          ),
                          h4,
                          QtyButton(
                            icon: Icons.add,
                            onTap: () => provider.incrementQty(
    widget.itemId,
    inclRate,
    item: widget.item,   // ⭐ PASS PRODUCT
  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// RATE (EXCLUSIVE)
              ValueColumn(
                title: appLocalization.rate,
                value: rate.toStringAsFixed(
                  widget.data.party.countryId == 1 ? 2 : 3,
                ),
              ),

              /// DISCOUNT
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalization.discount,
                    style: context.textStyle.s10.w400.indigoBlue.roboto
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                  h4,
                  SizedBox(
                    width: 60,
                    height: 35,
                    child: TextField(
                      controller: _discountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.center,
                      style:
                          context.textStyle.s10.w500.dustyBlue.roboto,
                      inputFormatters:
                          _discountFormatters(currentDiscountType),
                      onChanged: (value) {
                        provider.updateDiscount(
                          widget.itemId,
                          double.tryParse(value) ?? 0,
                          inclRate,
                        );
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        suffixText:
                            currentDiscountType == DiscountType.percentage
                                ? '%'
                                : null,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 6,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: ColorResources.mistGray,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          h12,

          /// ================= FREE QTY / UNIT / TOTAL =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// FREE QTY + UNIT
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalization.free_qty,
                    style: context.textStyle.s10.w400.indigoBlue.roboto
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                  h4,
                  Row(
                    children: [
                      Container(
                        width: context.getSize.width * 0.13,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _freeQtyController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            isCollapsed: true,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      w6,

                      /// UNIT DROPDOWN
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedUnit,
                            isDense: true,
                            items: [
                              widget.item.unitName,
                              if (widget.item.altUnit.isNotEmpty &&
                                  widget.item.altUnit !=
                                      widget.item.unitName)
                                widget.item.altUnit,
                            ]
                                .map(
                                  (u) => DropdownMenuItem(
                                    value: u,
                                    child: Text(
                                      u,
                                      style: context.textStyle.s10.w300
                                          .dustyBlue.roboto,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                provider.setUnit(
                                  widget.itemId,
                                  value,
                                  inclRate,
                                );
                              }
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: context.getSize.height * 0.016,
                              color: ColorResources.dustyBlue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              /// TOTAL
              Row(
                children: [
                  Text(
                    appLocalization.order_detail_widget_total,
                    style:
                        context.textStyle.s10.w400.indigoBlue.roboto,
                  ),
                  w8,
                  Text(
                    total.toStringAsFixed(2),
                    style:
                        context.textStyle.s14.bold.dustyBlue.roboto,
                  ),
                ],
              ),

              /// DELETE
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: ColorResources.crimsonRed,
                ),
                onPressed: () {
                  provider.resetQty(widget.itemId);
                  widget.onDelete?.call();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const QtyButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          color: ColorResources.bluishGray,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Icon(icon, color: ColorResources.white, size: 14),
      ),
    );
  }
}

class ValueColumn extends StatelessWidget {
  final String title;
  final String value;

  const ValueColumn({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textStyle.s10.w400.indigoBlue.roboto.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        h4,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: ColorResources.mistGray),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            value,
            style: context.textStyle.s10.w500.dustyBlue.roboto,
          ),
        ),
      ],
    );
  }
}

class UnitChip extends StatelessWidget {
  final String text;
  const UnitChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: ColorResources.mistGray),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}
