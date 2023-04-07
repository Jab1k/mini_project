import 'package:flutter/cupertino.dart';
import 'package:setup_provider/infastructura/servises/local_store.dart';

class AppProvider extends ChangeNotifier {
  bool isLightTheme = true;

  change() {
    isLightTheme = !isLightTheme;
    notifyListeners();
    LocalStore.setTheme(isLightTheme);
  }

  setTheme() async {
    await LocalStore.init();
    isLightTheme =  LocalStore.getTheme();
    notifyListeners();
  }
}
