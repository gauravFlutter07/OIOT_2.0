import '../../imports.dart';

class SettingsController extends ChangeNotifier {
  final SettingsService? settingsService;
  // late String _lang;
  SettingsController([this.settingsService]);

  Locale? _lang;
  Locale get language => _lang ?? const Locale('en');

  ThemeMode? _themeMode;
  ThemeMode get themeMode => _themeMode ?? ThemeMode.system;

  Future<void> loadSettings() async {
    _themeMode = await settingsService!.themeMode();
    _lang = await settingsService!.language();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;
    // await settingsService!.updateThemeMode(newThemeMode);
    notifyListeners();
  }

  Future<void> updateLanguage(Locale? newLang) async {
    if (newLang == null) return;

    if (newLang == _lang) return;
    _lang = newLang;
    await settingsService?.updateLanguage(newLang);
    notifyListeners();
  }
}
