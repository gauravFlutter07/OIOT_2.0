import 'dart:developer';

import '../../../imports.dart';

class OfflineHomeService {
  Dio dio = Dio();

  final offlinameUrl = ApiBaseUrl.baseUrl + ApiEndUrl().meUrl;

  Future<UserOfflineHomeModel?> aboutMeData(String token) async {
    log('message: $offlinameUrl');
    try {
      Response response = await dio.get(
        offlinameUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      log('offlineHomeServiceMessage: ${response.statusCode}');

      if (response.statusCode == 200) {
        log(response.data.toString());
        return UserOfflineHomeModel.fromJson(response.data);
      } else {
        log('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }
}
