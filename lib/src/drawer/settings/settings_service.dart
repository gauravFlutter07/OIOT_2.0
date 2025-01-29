import 'dart:developer';
import '../../../imports.dart';

class SettingsServices {
  Map<String, bool> settingsData = {
    "autoSubscription": true,
    "autoInsurance": false,
    "autoAds": true,
    "autoTripShare": false,
    "phoneBookEnabled": true,
    "referralBonusEnabled": true,
    "walletEnabled": false,
    "notificationEnabled": true
  };

  String settingsApi = 'settings_api';
  Dio dio = Dio();
  Future<SettingsModel?> fetchsettingsData() async {
    try {
      // Response response = await dio.get(settingsApi);
      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = SettingsModel.fromJson(settingsData);
        return result;
      } else {
        throw Exception('Failed to fetch settings data');
      }
    } catch (e) {
      log('Error fetching settings data: $e');
      return null;
    }
  }

  String settingsUrl = 'api/settingsUrl';

  Future<Map<String, dynamic>?> postSettingsData(SettingsModel data) async {
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
        throw Exception('Failed to post settings data');
      }
    } catch (e) {
      log('Error in posting settings data: $e');
      return null;
    }
  }
}
