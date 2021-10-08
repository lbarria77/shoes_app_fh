import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {

  String _assetImage = 'assets/azul.png';
  double _talla = 9.0;

  String get assetImage => _assetImage;
  double get talla => _talla;

  set assetImage(String valor) {
    _assetImage = valor;
    notifyListeners();
  }

  set talla(double valor) {
    _talla = valor;
    notifyListeners();
  }
   
}