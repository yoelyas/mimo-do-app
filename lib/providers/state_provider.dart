import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  bool _isTap = false;
  bool _comenzar = false;

  reset() {
    _isTap = false;
    _comenzar = false;
  }

  bool getComenzo() => _comenzar;

  setComenzo(bool comenzo) {
    _comenzar = comenzo;
  }

  bool getIsTap() => _isTap;

  setIsTap(bool isTap) {
    _isTap = isTap;
    notifyListeners();
  }

  setSoftIsTap(bool isTap) {
    _isTap = isTap;
  }
}
