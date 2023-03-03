import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  var costController = TextEditingController();
  bool isSelected = false;
  int? _selectedRadio = null;
  int? get getSelectedRadio => _selectedRadio;
  var radioGroupValues = {
    20: "Amazing 20%",
    18: "Good 18%",
    15: "Ok 15%",
  };
  var total;

  // bool get getIsSelected => _isSelected;

  void tipcalculation(int dato) {
    //todo: fasdf
  }
  void setIsSelected(bool switchValue) {
    isSelected = switchValue;
    notifyListeners();
  }

  void setSelectedRadio(int? radioValue) {
    _selectedRadio = radioValue;
    notifyListeners();
  }
}
