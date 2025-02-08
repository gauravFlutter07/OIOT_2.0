import 'dart:developer';

import 'package:oiot/src/login_register/login/model/user_data_model.dart';

import '../imports.dart';

enum _Key {
  firstTime,
  isLoggedIn,
  userData,
  tripId,
  token,
}

class LocalStorageService extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;
  // init should initialize through cunstructor when local storage service call
  LocalStorageService() {
    init();
  }
/* initializing shared preference */
  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  /* users first state for intro store and get function  */
  bool getfirstTime() {
    var res = _sharedPreferences?.getBool(_Key.firstTime.toString());
    log('res : $res');
    return res ?? true;
  }

  setfirstTime(bool state) {
    _sharedPreferences?.setBool(_Key.firstTime.toString(), state);

    log('set isFirst: ${_sharedPreferences?.getBool(_Key.firstTime.toString())}');
  }

  /* Store and get the login state of user */

  bool get isLoggedIn {
    var res = _sharedPreferences?.getBool(_Key.isLoggedIn.toString());
    return res ?? false;
  }

  setIsLoggedIn(bool state) {
    _sharedPreferences?.setBool(_Key.isLoggedIn.toString(), state);
  }

/* Check the token status and store, get and remove the token   */

  String get token {
    var res = _sharedPreferences?.getString(_Key.token.toString());
    return res ?? "invalid";
  }

  setToken(String token) {
    _sharedPreferences?.setString(_Key.token.toString(), token);
  }

  removeToken() {
    _sharedPreferences?.remove(_Key.token.toString());
    log('Removed Token: ${_sharedPreferences?.getString(_Key.token.toString())}');
  }

  /* store the language store and get function */

  Locale get language {
    var languageCode = _sharedPreferences?.getString("language_code") ?? 'en';
    var conuntryCode = _sharedPreferences?.getString("country_code") ?? '';
    Locale language = Locale(languageCode, conuntryCode);
    return language;
  }

  setLanguage(String languageCode, String countryCode) {
    _sharedPreferences?.setString("language_code", languageCode);
    _sharedPreferences?.setString("country_code", countryCode);
  }

  // /*  Store the theme of the app  */

  // int get getThemMode {
  //   var res = _sharedPreferences?.getInt(kThemeMode);
  //   return res ?? ThemeMode.light.index;
  // }

  // setThemeMode(int themeMode) {
  //   _sharedPreferences?.setInt(kThemeMode, themeMode);
  // }

  /* Store the login state of user Model*/

  int? get tripId {
    return _sharedPreferences?.getInt(_Key.tripId.toString());
  }
  UserDataModel? get userData {
    final rawJson = _sharedPreferences?.getString(_Key.userData.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return UserDataModel.fromJson(map);
  }

  setUserData(UserDataModel? userData) {
    if (userData != null) {
      _sharedPreferences?.setString(
          _Key.userData.toString(), json.encode(userData.toJson()));
      log('userData :${userData.mobile}');
    } else {
      _sharedPreferences?.remove(_Key.userData.toString());
    }
  }

  setTripId(int? tripId) {
    if (tripId != null) {
      _sharedPreferences?.setInt(
          _Key.tripId.toString(), tripId!);
      log('trip id set to : $tripId');
    } else {
      _sharedPreferences?.remove(_Key.tripId.toString());
    }
  }
}
