import 'package:flutter/material.dart';

class Ordersummaryprovider extends ChangeNotifier {
  bool? _isAccepted = false;

  bool? get isAccepted => _isAccepted;

  void acceptedOrder() {
    _isAccepted = true;
    notifyListeners();
  }

  void moveOrderToActive() {
    _isAccepted = false;
    notifyListeners();
  }
}
