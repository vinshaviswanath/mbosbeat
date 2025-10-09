import 'package:mpos_beat/core/utils/imports.dart';

class CustomerTransactionProvider extends ChangeNotifier {
  int _orderQty = 0;
  int get orderQty => _orderQty;

  void incrementQty() {
    _orderQty++;
    notifyListeners();
  }

  void decrementQty() {
    if (_orderQty > 0) {
      _orderQty--;
      notifyListeners();
    }
  }
 
}