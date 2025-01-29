import 'dart:developer';

import '../../../../imports.dart';

class AddBankAccountService {
  Dio dio = Dio();

  String addBankAccountApiUrl = 'api/add_bank_account';

  Future<Map<String, dynamic>?> postBankAccountData(
      AddBankAccountModel data) async {
    try {
      // Response response =
      //     await dio.post(addBankAccountApiUrl, data: data.tojson());

      int statusCode = 200;
      if (statusCode == 200) {
        log('data send successfully');

        Map<String, dynamic> status = {
          'status': true,
          'message': 'Data submitted successfully',
        };
        return status;
      } else {
        throw Exception('Failed to post bank account data');
      }
    } catch (e) {
      log('Error in posting bank account data: $e');
      return null;
    }
  }
}
