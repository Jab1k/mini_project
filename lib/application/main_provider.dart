import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
