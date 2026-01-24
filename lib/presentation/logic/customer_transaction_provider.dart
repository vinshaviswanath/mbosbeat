import 'package:mpos_beat/core/utils/imports.dart';

class CustomerTransactionProvider extends ChangeNotifier {
  final Map<int, int> _itemQty = {}; // stockItemId → qty

  int getQty(int itemId) => _itemQty[itemId] ?? 1;

  void incrementQty(int itemId) {
    _itemQty[itemId] = getQty(itemId) + 1;
    notifyListeners();
  }

  void decrementQty(int itemId) {
    final current = getQty(itemId);
    if (current > 1) {
      _itemQty[itemId] = current - 1;
      notifyListeners();
    }
  }

  void resetQty(int itemId) {
    _itemQty[itemId] = 1;
    notifyListeners();
  }

  void clear() {
    _itemQty.clear();
    notifyListeners();
  }
}
