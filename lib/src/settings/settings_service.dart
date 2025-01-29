import '../../imports.dart';

class SettingsService extends ChangeNotifier {
  Future<ThemeMode> themeMode() async => ThemeMode.system;
  Future<void> updateThemeMode(ThemeMode theme) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('theme_mode', theme as String);

    // ThemeMode themeMode = (await prefs.getString('theme_mode')) as ThemeMode;
  }

  Future<Locale> language() async => const Locale("en");

  Future<void> updateLanguage(Locale? lang) async {
    if (lang == null) {
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', lang.languageCode);
  }

  Future<Locale?> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_code');

    if (languageCode != null) {
      return Locale(languageCode);
    } else {
      return const Locale('en');
    }
  }
}
