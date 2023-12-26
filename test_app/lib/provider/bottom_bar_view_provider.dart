import 'package:flutter/material.dart';

class BottomBarViewProvider with ChangeNotifier {
  //Bottom bar index state
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    if (index == _currentIndex) {
      return;
    }
    _currentIndex = index;
    notifyListeners();
  }

  //Cart state
  bool _isCartShowing = false;

  bool get isCartShowing => _isCartShowing;

  void setCartStatus(bool value) {
    if (_isCartShowing == value) {
      return;
    }
    _isCartShowing = value;
    notifyListeners();
  }
}
