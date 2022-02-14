// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

class StateModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  bool _register = false;
  Map<String, dynamic> _user = {};

  /// An unmodifiable view of the items in the cart.
  bool get register => _register;
  Map<String, dynamic> get user => _user;

  void changeRegisterState(value) {
    _register = value;

    notifyListeners();
  }

  void loadUser(value) {
    _user = value;

    notifyListeners();
  }
}
