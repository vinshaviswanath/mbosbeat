import 'package:flutter/services.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
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
  late TextEditingController _discountController;
  late TextEditingController _freeQtyController;
  late TextEditingController _qtyController;

  DiscountType? _initializedDiscountType;

  @override
  void initState() {
    super.initState();
    _discountController = TextEditingController();
    _freeQtyController = TextEditingController();
    _qtyController = TextEditingController(text: "0");
  }

  @override
  void dispose() {
    _discountController.dispose();
    _freeQtyController.dispose();
    _qtyController.dispose();
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
    final appDb = sl<AppDb>();
    final appLocalization = context.l10n;
    final provider = context.watch<CustomerTransactionProvider>();

    final qty = provider.getQty(widget.itemId);
    final formattedQty = qty == 0 ? '' : qty.toStringAsFixed(0);

    if (_qtyController.text != formattedQty) {
      _qtyController.value = TextEditingValue(
        text: formattedQty,
        selection: TextSelection.collapsed(offset: formattedQty.length),
      );
    }

    /// ---------------- BASE RATE ----------------
    final double baseRate = widget.item.rate;

    /// ---------------- DISCOUNT INIT ----------------
    final DiscountType discountType = widget.item.discountType == 'A'
        ? DiscountType.amount
        : DiscountType.percentage;

    final double discountValue = widget.item.discount ?? 0;

    if (_initializedDiscountType == null) {
      _initializedDiscountType = discountType;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!provider.hasDiscount(widget.itemId)) {
          provider.setInitialDiscount(
            widget.itemId,
            discountValue,
            discountType,
          );
        }
        provider.setInitialDiscount(widget.itemId, discountValue, discountType);
        _discountController.text = _formatDiscount(discountValue, discountType);
      });
    }

    final currentDiscountType =
        provider.getDiscountType(widget.itemId) ?? discountType;

    final providerDiscount = provider.getDiscount(widget.itemId);
    final formattedDiscount = _formatDiscount(
      providerDiscount,
      currentDiscountType,
    );

    if (_discountController.text != formattedDiscount) {
      _discountController.value = TextEditingValue(
        text: formattedDiscount,
        selection: TextSelection.collapsed(offset: formattedDiscount.length),
      );
    }

    /// ---------------- FREE QTY ----------------
    final providerFreeQty = provider.getFreeQty(widget.itemId);
    final formattedFreeQty = providerFreeQty == 0
        ? ''
        : providerFreeQty.toStringAsFixed(0);

    if (_freeQtyController.text != formattedFreeQty) {
      _freeQtyController.value = TextEditingValue(
        text: formattedFreeQty,
        selection: TextSelection.collapsed(offset: formattedFreeQty.length),
      );
    }

    /// ---------------- UNIT ----------------
    final String selectedUnit = provider.getSelectedUnit(
      widget.itemId,
      widget.item,
    );

    final selectedFreeUnit = provider.getSelectedFreeUnit(
      widget.itemId,
      widget.item,
    );
    // final String selectedUnit = provider.getSelectedUnit(
    //     widget.itemId,
    //     widget.item,
    //   );

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
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _qtyController,
                          textAlign: TextAlign.center,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],

                          onChanged: (v) {
                            provider.setQty(
                              widget.itemId,
                              double.tryParse(v) ?? 0,
                              inclRate,
                              item: widget.item,
                            );
                          },

                          decoration: const InputDecoration(
                            isCollapsed: true,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      w6,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedUnit,
                            style: context.textStyle.s10.w500.dustyBlue.roboto,
                            isDense: true,
                            items:
                                [
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
                                          style: context
                                              .textStyle
                                              .s10
                                              .w300
                                              .dustyBlue
                                              .roboto,
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
                            //  qty.toStringAsFixed(0),
                            //   style: context.textStyle.s10.w500.dustyBlue.roboto,
                          ),
                        ),
                      ),
                      w6,
                      Column(
                        children: [
                          QtyButton(
                            icon: Icons.remove,
                            onTap: () =>
                                provider.decrementQty(widget.itemId, inclRate),
                          ),
                          h4,
                          QtyButton(
                            icon: Icons.add,
                            onTap: () => provider.incrementQty(
                              widget.itemId,
                              inclRate,
                              item: widget.item, // ⭝ PASS PRODUCT
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
              StreamBuilder<bool>(
                stream: provider.watchDiscountVisibility(
                  userId: widget.data.data.userDetails.userId,
                  companyId: widget.companyId,
                ),
                builder: (context, snapshot) {
                  final showDiscount = snapshot.data ?? false;

                  if (!showDiscount) {
                    return const SizedBox.shrink();
                  }
                  return Column(
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
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          textAlign: TextAlign.center,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                          inputFormatters: _discountFormatters(
                            currentDiscountType,
                          ),
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
                  );
                },
              ),
            ],
          ),

          h12,

          /// ================= FREE QTY / UNIT / TOTAL =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// FREE QTY + UNIT
              StreamBuilder<bool>(
                stream: appDb.companySettingsDao.watchFreeQuantitytEnabled(
                  companyId: widget.companyId,
                ),
                builder: (context, snapshot) {
                  final showDiscount = snapshot.data ?? false;

                  if (!showDiscount) {
                    return const SizedBox.shrink();
                  }
                  return Column(
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
                              border: Border.all(
                                color: ColorResources.mistGray,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: _freeQtyController,
                              style:
                                  context.textStyle.s10.w500.dustyBlue.roboto,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],

                              onChanged: (v) {
                                provider.updateFreeQty(
                                  widget.itemId,
                                  double.tryParse(v) ?? 0,
                                );
                              },

                              decoration: const InputDecoration(
                                isCollapsed: true,
                                border: InputBorder.none,
                              ),
                              // onChanged: (value) {
                              //   final freeQty = double.tryParse(value) ?? 0;

                              //   context
                              //       .read<CustomerTransactionProvider>()
                              //       .updateFreeQty(widget.itemId, freeQty);
                              // },
                            ),
                          ),
                          w6,

                          /// UNIT DROPDOWN
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorResources.mistGray,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedFreeUnit,
                                style:
                                    context.textStyle.s10.w500.dustyBlue.roboto,
                                isDense: true,
                                items:
                                    [
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
                                              style: context
                                                  .textStyle
                                                  .s10
                                                  .w300
                                                  .dustyBlue
                                                  .roboto,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    provider.setFreeUnit(widget.itemId, value);
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
                          w6,

                          /// +/- BUTTONS
                          Column(
                            children: [
                              QtyButton(
                                icon: Icons.remove,
                                onTap: () =>
                                    provider.decrementFreeQty(widget.itemId),
                              ),
                              h4,
                              QtyButton(
                                icon: Icons.add,
                                onTap: () =>
                                    provider.incrementFreeQty(widget.itemId),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),

              /// TOTAL
              Row(
                children: [
                  Text(
                    appLocalization.order_detail_widget_total,
                    style: context.textStyle.s10.w400.indigoBlue.roboto,
                  ),
                  w8,
                  Text(
                    total.toStringAsFixed(2),
                    style: context.textStyle.s14.bold.dustyBlue.roboto,
                  ),
                ],
              ),

              /// DELETE
              InkWell(
                onTap: () {
                  provider.resetQty(widget.itemId);
                  widget.onDelete?.call();
                },
                child: Icon(Icons.delete, color: ColorResources.crimsonRed),
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
