import 'dart:developer';

import '../../../../imports.dart';

class ReferFriendServices {
  Map<String, dynamic> referCode = {
    "code": "973568",
  };

  Dio dio = Dio();
  String referCodeUrl = 'api/refer_code';

  Future<ReferFriendsModel?> fetchReferCodeData() async {
    try {
      // Response response = await dio.get(referCodeUrl);
      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = ReferFriendsModel.fromJson(referCode);
        return result;
      } else {
        throw Exception('Failed to fetch refer code');
      }
    } catch (e) {
      log('Error fetching refer code: $e');
      return null;
    }
  }
}
