import 'package:flutter/material.dart';
import 'package:test_app/model/combined_model.dart';

class CartViewProvider with ChangeNotifier {
  List<CombinedModel> _combinedList = [];

  List<CombinedModel> get combinedList => _combinedList;

  void addCombinedList(CombinedModel combinedModel) {
    _combinedList.add(combinedModel);
    notifyListeners();
  }

  void removeCombinedList(CombinedModel combinedModel) {
    _combinedList.remove(combinedModel);
    notifyListeners();
  }
}
