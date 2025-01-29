import 'dart:developer';

import '../../../../../imports.dart';

class DailyRideService {
  String dailyrideUrl = 'api/dailyride';

  Dio dio = Dio();

  Future<Map<String, dynamic>?> postDailyrideData({
    required bool isMyself,
    required Contact? selectedContact,
    required String userId,
  }) async {
    try {
      // Response response = await dio.post(dailyrideUrl);
      int statusCode = 200;

      if (statusCode == 200) {
        Map<String, dynamic> status = {
          'status': true,
          'message': 'Ride data sent successfully',
        };
        return status;
      } else {
        throw Exception('Failed to post daily ride data');
      }
    } catch (e) {
      log('Error in posting daily ride data: $e');
      return null;
    }
  }
}
