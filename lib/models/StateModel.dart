import 'package:flutter/widgets.dart';

class StateModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  bool _register = false;

  /// An unmodifiable view of the items in the cart.
  bool get register => _register;

  void changeRegisterState(value) {
    _register = value;

    notifyListeners();
  }
}
