import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppProbider with ChangeNotifier {
  int userIndex = -1;
  ThemeMode themMode = ThemeMode.light;
  //List<String> account = getAcount();
  void changeTheme() {
    if (themMode == ThemeMode.dark) {
      themMode = ThemeMode.light;
    } else {
      themMode = ThemeMode.dark;
    }
    // darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
