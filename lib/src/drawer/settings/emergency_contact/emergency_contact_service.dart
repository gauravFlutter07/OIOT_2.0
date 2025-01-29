import 'dart:developer';

import '../../../../imports.dart';

class EmergencyContactService {
  List<Map<String, dynamic>> emergencyContactList = [
    {
      "name": "Ajeesh",
      "phoneNumber": "+91 8848583025",
    },
    {
      "name": "Sandeep",
      "phoneNumber": "+91 8743541316",
    },
  ];

  String couponBonusUrl = 'api/couponBonus';

  Dio dio = Dio();

  Future<List<EmergencyContactModel>?> fetchEmergencyContactData() async {
    try {
      int statusCode = 200;
      if (statusCode == 200) {
        List<EmergencyContactModel> emergencyContactData = emergencyContactList
            .map((emergencyContact) =>
                EmergencyContactModel.fromJson(emergencyContact))
            .toList();
        return emergencyContactData;
      } else {
        throw Exception('Failed to fetch emergency contact data');
      }
    } catch (e) {
      log('Error fetching emergency contact data: $e');
      return [];
    }
  }

  String addEmergencyUrl = 'api/editprofileurl';

  Future<Map<String, dynamic>?> postEmergencyContact(
      AddEmergencyContactModel data) async {
    try {
      // Response response = await dio.post(addEmergencyUrl,data:data.toJson);
      int statuscode = 200;
      if (statuscode == 200) {
        log('Data sent success');

        Map<String, dynamic> status = {
          'status': true,
          'message': 'Data submitted successfully',
        };

        return status;
      } else {
        throw Exception('Failed to post emergency contact data');
      }
    } catch (e) {
      log('Error in posting emergency contact data: $e');
      return null;
    }
  }
}
