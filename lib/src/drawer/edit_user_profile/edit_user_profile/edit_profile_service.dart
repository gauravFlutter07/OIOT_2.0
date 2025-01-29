import 'dart:developer';

import '../../../../imports.dart';

class EditProfileService {
  Dio dio = Dio();

  String editProfileUrl = 'api/editprofileurl';

  Future<Map<String, dynamic>?> postEditProfile(EditProfileModel data) async {
    try {
      // Response response = await dio.post(editProfileUrl,data:data.toJson);
      int statuscode = 200;
      if (statuscode == 200) {
        log('Data sent success');

        Map<String, dynamic> status = {
          'status': true,
          'message': 'User profile updated successfully',
        };

        return status;
      } else {
        throw Exception('Failed to post edit profile data');
      }
    } catch (e) {
      log('Error in posting edit profile data: $e');
      return null;
    }
  }
}
