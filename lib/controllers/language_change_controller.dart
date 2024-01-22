import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier {
  Locale? _appLanguage;
  Locale? get appLanguage => _appLanguage;
  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _appLanguage = type;
    if (type == const Locale('en')) {
      await sp.setString('language_code', 'en');
    } else {
      await sp.setString('language_code', 'ur');
    }
    notifyListeners();
  }
}
