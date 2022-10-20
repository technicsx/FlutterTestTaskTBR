import 'package:flutter/cupertino.dart';

class ButtonActivation with ChangeNotifier {
  bool _isActivated = false;

  bool get isActivated => _isActivated;

  void toggleButton(bool shouldActivate) {
    _isActivated = shouldActivate;
    notifyListeners();
  }
}
