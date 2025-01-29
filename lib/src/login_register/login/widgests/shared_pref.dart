// // preferences_util.dart
// import '../../../../imports.dart';

// class PreferencesUtil {
//   static Future<bool> isInitialSetupComplete(String mobileNumber) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isSetupComplete =
//         prefs.getBool('${mobileNumber}_setupComplete') ?? false;
//     return isSetupComplete;
//   }

//   static Future<void> setInitialSetupComplete(String mobileNumber) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('${mobileNumber}_setupComplete', true);
//   }

//   static Future<void> clearPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }
