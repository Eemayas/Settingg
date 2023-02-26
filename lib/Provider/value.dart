import 'package:flutter/material.dart';

class SensitivityValue with ChangeNotifier {
  int _svalue = 1;
  int get svalue => _svalue;
  void schange(int value) {
    _svalue = value;
    notifyListeners();
  }
}

class resolveValue with ChangeNotifier {
  int _rvalue = 1;
  int get rvalue => _rvalue;
  void schange(int value) {
    _rvalue = value;
    notifyListeners();
  }
}

class loadValue with ChangeNotifier {
  int _lvalue = 1;
  int get lvalue => _lvalue;
  void schange(int value) {
    _lvalue = value;
    notifyListeners();
  }
}
