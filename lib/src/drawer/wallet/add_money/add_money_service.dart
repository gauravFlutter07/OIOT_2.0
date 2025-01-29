import 'dart:developer';

import '../../../../imports.dart';

class AddWalletService {
  Dio dio = Dio();

  String addWalletApiUrl = 'api/add_wallet';

  Future<Map<String, dynamic>?> postWalletData(AddWalletModel data) async {
    try {
      // Response response = await dio.post(addWalletApiUrl, data: data.toJson());

      int statusCode = 200;
      if (statusCode == 200) {
        log('Data sent successfully');

        Map<String, dynamic> status = {
          'status': true,
          'message': 'Data submitted successfully',
        };
        return status;
      } else {
        throw Exception('Failed to post wallet data');
      }
    } catch (e) {
      log('Error in posting wallet data: $e');
      return null;
    }
  }
}
