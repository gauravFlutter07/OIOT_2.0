import 'dart:developer';

import 'package:oiot/src/drawer/business_contact/phone_contacts/business_contacts.dart';

import '../../../../imports.dart';

class ContactService {
  final Dio dio = Dio();

  Future<void> sendContactsToBackend(List<PhoneContactModel> contacts) async {
    // String phone_contact_api = 'phone_contact_api';

    try {
      FormData formData = FormData();

      for (PhoneContactModel contact in contacts) {
        formData.fields.add(MapEntry('displayName', contact.displayName));
        formData.fields.add(MapEntry('phoneNumber', contact.phoneNumber));

        if (contact.photo != null) {
          formData.files.add(
            MapEntry(
              'photo',
              await MultipartFile.fromFile(contact.photo!.path),
            ),
          );
        }
      }

      // Response response = await dio.post(
      //   phone_contact_api,
      //   data: formData,
      // );

      int statusCode = 200;
      if (statusCode == 200) {
        log("Contacts sent successfully!");
      } else {
        log("Failed to send contacts: $statusCode}");
      }
    } catch (e) {
      log("Error sending contacts: $e");
    }
  }
}
