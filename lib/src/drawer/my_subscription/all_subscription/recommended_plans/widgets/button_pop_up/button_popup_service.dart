import 'dart:developer';

import '../../../../../../../imports.dart';

class ButtonPopUpService {
  final Map<String, dynamic> buttonPopUpData = {
    "validity": "1 Month",
    "popUpAmount": "₹200",
    "benefit1": "Free Rides",
    "benefit2": "Local Trips",
    "benefit3": "Free Sms",
    "benefit4": "Name Display",
    "benefit5": "Add-Ons",
  };

  String buttonPopUpUrl = 'api/buttonpopup';
  Dio dio = Dio();

  Future<ButtonPopUpDataModel?> fetchButtonPopupData() async {
    try {
      int statusCode = 200;

      if (statusCode == 200) {
        dynamic result = ButtonPopUpDataModel.fromJson(buttonPopUpData);
        return result;
      } else {
        throw Exception('Failed to fetch buttonPopUp data');
      }
    } catch (e) {
      log('Error fetching buttonPopUp data: $e');
      return null;
    }
  }
}
