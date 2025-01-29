import 'dart:developer';
import 'package:oiot/src/drawer/business_contact/phone_contacts/business_contacts.dart';

import '../../../../imports.dart';

class AddContactService {
  Dio dio = Dio();

  String addContactUrl = 'api/addContacturl';

  Future<Map<String, dynamic>?> postAddContact(AddContactModel data) async {
    try {
      // Response response = await dio.post(addContactUrl,data:data.toJson);
      int statuscode = 200;
      if (statuscode == 200) {
        log('Data sent success');

        Map<String, dynamic> status = {
          'status': true,
          'message': 'Data submitted successfully',
        };

        return status;
      } else {
        throw Exception('Failed to post add contact data');
      }
    } catch (e) {
      log('Error in posting add contact data: $e');
      return null;
    }
  }
}
