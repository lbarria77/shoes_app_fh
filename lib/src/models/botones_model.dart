import 'package:flutter/material.dart';


class BotonesModel with ChangeNotifier {

  bool _isSelected = true;

  bool get isSelected => _isSelected;

  set isSelected(bool valor) {
    _isSelected = valor;
    notifyListeners();
  }

}