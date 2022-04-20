import 'package:flutter/cupertino.dart';

class ChooseRadio with ChangeNotifier {
  int _chosenValue = 0;
  choose({required int value}) {
    _chosenValue = value;
    notifyListeners();
  }
  int get chosenValue => _chosenValue;
}
