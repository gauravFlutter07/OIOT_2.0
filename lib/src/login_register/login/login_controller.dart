import 'dart:developer';
import 'package:oiot/api/rider_repo.dart';
import 'package:oiot/src/login_register/login/model/user_data_model.dart';
import '../../../imports.dart';

class LoginProvider extends ChangeNotifier {
  LocalStorageService localStorageService = LocalStorageService();

  UserDataModel? _userData;
  UserDataModel? get userData => _userData;

  final TextEditingController _mobileController = TextEditingController();

  TextEditingController get mobileController => _mobileController;

  final TextEditingController _pwdController = TextEditingController();

  TextEditingController get pwdController => _pwdController;

  String? mobileValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterMobile;
    } 
    // else {
    //   Fluttertoast.showToast(
    //       msg: AppLocalizations.of(context)!.youHaveEnteredWrongMobileNumber);
    // }
    return null;
  }

  Future<void> loginRequest(BuildContext context) async {
    // Validate mobile number
    // String? mobileError = mobileValidation(_mobileController.text, context);
    // if (mobileError != null) {
    //   Fluttertoast.showToast(msg: mobileError);
    //   return;
    // }


    var map = {
      "username":_mobileController.text,
      "password":_pwdController.text
    };

    var result = await RiderRepo.login(map);

    if (result != null && result['success']) {

      await localStorageService.init();
      await localStorageService.setToken(result["token"]);
      await localStorageService.setIsLoggedIn(true);
      String token = localStorageService.token;
      log("login token: $token");

      /*_userData = UserDataModel.fromJson(result["userData"]);
      log(_userData!.name);
      await localStorageService.setUserData(_userData);
      _userData = localStorageService.userData;

      log(_userData!.name);*/
      notifyListeners();


      Fluttertoast.showToast(msg: '${result['message']}');

      Navigator.pushNamedAndRemoveUntil(
          context, RouteClass.userOfflineHome, (route) => false);

    }else{
      if(result["message"]!=null){
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }



    /*LoginModel data = LoginModel(
      mobile: _mobileController.text,
    );
    LoginService loginService = LoginService();
    final result = await loginService.postLoginRequest(data);
    if (result != null && result["status"] == true) {
      await localStorageService.init();
      await localStorageService.setToken(result["token"]);
      String token = localStorageService.token;
      log("login token: $token");

      _userData = UserDataModel.fromJson(result["userData"]);
      log(_userData!.name);
      await localStorageService.setUserData(_userData);
      _userData = localStorageService.userData;

      log(_userData!.name);
      notifyListeners();

      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, RouteClass.mpinPage, (route) => false);
    }*/
  }

  Future<void> logout(BuildContext context) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    localStorageService.removeToken();
    _mobileController.clear();
    // Navigate to the login screen
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
        context, RouteClass.loginScreen, (route) => false);
  }
}
