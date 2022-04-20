import 'package:flutter/cupertino.dart';

class IncrementUnit with ChangeNotifier {
  int _incomeIncrementValue = 0;
  int _expenseIncrementValue = 0;

  incomeIncrement({required int value}) {
    _incomeIncrementValue = value;
    notifyListeners();
  }

  expenseIncrement({required int value}) {
    _expenseIncrementValue = value;
    notifyListeners();
  }

  int get incomeIncrementValue => _incomeIncrementValue;
  int get expenseIncrementValue => _expenseIncrementValue;
}
