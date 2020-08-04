import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsProvider extends ChangeNotifier {
  bool isDarkThemeOn = Hive.box('settingsBox').get('isDarkModeOn') ?? false;
  String activeLanguge = Hive.box('settingsBox').get('activeLang') ?? 'English';

  void darkTheme(bool status) {
    isDarkThemeOn = status;

    final themeBox = Hive.box('settingsBox');
    themeBox.put('isDarkModeOn', status);
    print(themeBox.get('isDarkModeOn'));

    notifyListeners();
  }

  void setLang(String value) {
    activeLanguge = value;

    final langBox = Hive.box('settingsBox');
    langBox.put('activeLang', value);

    notifyListeners();
  }
}
