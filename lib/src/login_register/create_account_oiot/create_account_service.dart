import 'dart:developer';
import 'package:oiot/core/error_handler.dart';
import 'package:oiot/src/login_register/create_account_oiot/model/create_account_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

class CreateAccountService {
  String createAccountUrl = "api/createAccount";
  ErrorHandler errorHandler = ErrorHandler();
  Dio dio = Dio();

  Future<Map<String, dynamic>?> postCreateAccount(
      CreateAccountModel data) async {
    try {
      // Simulate an API call with hardcoded data
      int? statusCode;
      if (data.mobile == '0123456789') {
        Fluttertoast.showToast(msg: "Success");
        statusCode = 200;
      } else {
        statusCode = 408;
      }

      if (statusCode == 200) {
        dynamic userData = {
          "status": true,
          "message": "Account created successfully"
        };
        return userData;
      } else {
        String? errorMessage = errorHandler.errorHandlingFunction(statusCode);
        Fluttertoast.showToast(
            msg: errorMessage.toString(), toastLength: Toast.LENGTH_LONG);
        return null;
      }
    } catch (e) {
      log('Error in posting create account data: $e');
      return null;
    }
  }
}
