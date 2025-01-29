import 'dart:developer';
import 'package:oiot/src/login_register/forgot_password/model/forgot_password_model.dart';
import '../../../imports.dart';

class ForgotPasswordService {
  String forgotPasswordUrl = "api/forgotpassword";
  ErrorHandler errorHandler = ErrorHandler();

  Dio dio = Dio();

  Future<Map<String, dynamic>?> postForgotPassword(
      ForgotPasswordModel data) async {
    try {
      log('Data .tojson ${data.toJson()}');
      int? statusCode;
      if (data.mobile == '0123456789') {
        Fluttertoast.showToast(msg: "Success");

        statusCode = 200;
      } else {
        statusCode = 503;
      }

      if (statusCode == 200) {
        dynamic userData = {
          "userData": {
            "Mobile": "0123456789",
          }
        };
        return userData;
      } else {
        String? errorMessage = errorHandler.errorHandlingFunction(statusCode);
        Fluttertoast.showToast(
            msg: errorMessage.toString(), toastLength: Toast.LENGTH_LONG);
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
