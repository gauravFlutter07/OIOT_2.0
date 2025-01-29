import 'dart:developer';

import '../../../imports.dart';

class CreateNewPasswordForgotService {
  Dio dio = Dio();
  ErrorHandler errorHandler = ErrorHandler();

  String createNewPasswordUrl = 'api/pin';

  Future<dynamic>? postNewCreateForgotPassword(
      String password, String userId) async {
    try {
      // Response response = await dio.post(
      //   createNewPasswordUrl,
      //   data: {"password": password,"userId":userId},
      // );
      int statusCode = 200;
      if (statusCode == 200) {
        dynamic data = {
          "status": true,
          "message": "New password created successfully"
        };

        return data;
      } else {
        String? errorMessage = errorHandler.errorHandlingFunction(statusCode);
        Fluttertoast.showToast(
            msg: errorMessage.toString(), toastLength: Toast.LENGTH_LONG);
        return null;
      }
    } catch (e) {
      log('Error  : $e');
      return null;
    }
  }
}
