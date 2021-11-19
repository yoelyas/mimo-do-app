import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  bool _isTap = false;

  bool getIsTap() => _isTap;

  setIsTap(bool isTap) {
    _isTap = isTap;
    notifyListeners();
  }

  setSoftIsTap(bool isTap) {
    _isTap = isTap;
  }
}
