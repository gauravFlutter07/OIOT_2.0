import 'dart:developer';

import '../../../imports.dart';

class MpinServices {
  Dio dio = Dio();
  String mpinUrl = 'api/mpin';

  Future<dynamic>? postNewCreatePassword(String mpin, String userId) async {
    try {
      // Response response = await dio.post(
      //   mpinUrl,
      //   data: {"password": password,"userId":userId},
      // );
      int statusCode = 200;

      if (statusCode == 200) {
        dynamic data = {"status": true, "message": "Mpin entered successfully"};

        return data;
      } else {
        dynamic data = {"status": false, "message": "Mpin is not currect"};
        return data;
      }
    } catch (e) {
      log('Error  : $e');
      return null;
    }
  }
}
