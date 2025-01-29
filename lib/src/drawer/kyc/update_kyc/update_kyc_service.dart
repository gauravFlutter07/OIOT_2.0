import 'dart:developer';

import '../../../../imports.dart';

class UpdateKycService {
  Dio dio = Dio();

  String kycApiUrl = 'api/kyc_api';

  Future<Map<String, dynamic>?> postKycData(UpdateKycModel data) async {
    try {
      // Response response =
      //     await dio.post(kycApiUrl, data: data.tojson());

      int statusCode = 200;
      if (statusCode == 200) {
        log('data send successfully');

        Map<String, dynamic> status = {
          'status': true,
          'message': 'Data submitted successfully',
        };
        return status;
      } else {
        throw Exception('Failed to post kyc data');
      }
    } catch (e) {
      log('Error in posting kyc data: $e');
      return null;
    }
  }
}
