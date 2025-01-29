// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import '../../../imports.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider();

  Future<void> checkFirstTimeAndAuthToken(BuildContext context) async {
    LocalStorageService localStorageService = LocalStorageService();
    await localStorageService.init();
    bool? isFirstLogin = localStorageService.getfirstTime();

    if (isFirstLogin == true) {
      localStorageService.setfirstTime(false);
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, RouteClass.splashLoadingScreen);
    } else {
      await localStorageService.init();
      String? authToken = localStorageService.token;
      log('auth token : ${authToken.toString()}');
      await Future.delayed(const Duration(seconds: 2));
      if (authToken == "invalid") {
        Navigator.pushReplacementNamed(context, RouteClass.loginScreen);
      } else {
        Navigator.pushReplacementNamed(context, RouteClass.userOfflineHome);
      }
    }
  }
}
