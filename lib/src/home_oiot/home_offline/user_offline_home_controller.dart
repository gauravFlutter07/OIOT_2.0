import 'dart:developer';
import '../../../imports.dart';

class OfflineHomeProvider extends ChangeNotifier {
  OfflineHomeProvider() {
    userHomeMeFunction();
  }
  UserOfflineHomeModel? _userdetails;
  UserOfflineHomeModel? get userdetails => _userdetails;

  Future<void> userHomeMeFunction({String? username, String? image}) async {
    OfflineHomeService offlineHomeService = OfflineHomeService();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    if (token != null) {
      final result = await offlineHomeService.aboutMeData(token);
      log('provider : result ${result.toString()}');
      if (result != null) {
        _userdetails = result;
        notifyListeners();
        SharedPreferences preferences = await SharedPreferences.getInstance();
        final token = preferences.getString('token');
        if (token != null) {
          preferences.setString('token', token);
        }
      }
    }
  }
}
