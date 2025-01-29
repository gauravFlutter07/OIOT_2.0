import 'package:flutter/foundation.dart';

class LanguageSelectProvider extends ChangeNotifier {
  String _currentLanguage = 'English';

  String get currentLanguage => _currentLanguage;

  void setIsActive(String name) {
    if (name == 'english') {
      _currentLanguage = 'English';
    } else if (name == 'kannada') {
      _currentLanguage = 'ಕನ್ನಡ';
    } else if (name == 'telugu') {
      _currentLanguage = 'తెలుగు';
    } else if (name == 'marathi') {
      _currentLanguage = 'मराठी';
    }
    notifyListeners();
  }

  void setCurrentLanguage(String selectedLanguage) {
    _currentLanguage = selectedLanguage;
    notifyListeners();
  }
}
