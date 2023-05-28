import 'package:flutter/material.dart';
import '../main.dart';

class FormProvider extends ChangeNotifier {
  double _deviceHeight =
      MediaQuery.of(navigatorKey!.currentContext!).size.height * .9;
  bool _changed = false;
  bool _isAllChecked = false;

  bool get changed => _changed;

  bool get isAllChecked => _isAllChecked;

  double get deviceHeight => _deviceHeight;

  ValueNotifier<bool> isFormValid = ValueNotifier<bool>(true);

  void validateForm(List<bool> checkboxStates) {
    bool atLeastOneSelected = checkboxStates.contains(true);
    isFormValid.value = atLeastOneSelected;
  }

  void change() {
    _changed = !_changed;

    notifyListeners();
  }

  void verifyForm(List<bool> values) {
    var result =
        values.firstWhere((element) => element == true, orElse: () => false);
    _isAllChecked = result;

    notifyListeners();
  }

  // void reset() {
  //   _isAllChecked = false;
  //
  //   notifyListeners();
  // }

  void expandScreen(double newSize) {
    _deviceHeight = newSize;

    notifyListeners();
  }
}
