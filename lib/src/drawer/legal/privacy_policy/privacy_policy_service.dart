import 'dart:developer';

import '../../../../imports.dart';

class PrivacyPolicyService {
  final Map<String, dynamic> privacyPolicyData = {
    "lastUpdate": "12 Jun 2022",
    "content":
        "This Privacy Policy sets out how Towner/Oiot Teack will collect, hold and protect information about you when you use our website and /or mobile application to test our Demo Apps. a. We may disclose to third-party services certain personally identifiable information listed below: - Information you provide us such as below: --- name --- email --- mobile phone number --- demographic information --- information we collect as you access and use our service, including device information, location and network carrier - This information is shared with third-party service providers so that we can: --- personalize the app for you --- perform behavioural analytics --- improve our products and services --- To periodically send promotional emails about new products, special offers or other information which we think you may find interesting using the email address which you have provided. b. Security - We are committed to ensuring that your information is secure. - To prevent unauthorized access or disclosure we have put in place suitable physical, electronic and managerial procedures to safeguard and secure the information we collect online. c. Third-Party Website Links - Our website may contain links to other websites. However, once you have used these links to leave our site, you should note that we do not have any control over those websites. Therefore, we cannot be responsible for the protection and privacy of any information which you provide to those websites. - We will not sell, distribute or lease your personal information to third parties unless we have your permission or are required by law to do so. - If you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible at the townertrackcalltaxi@gmail.com/ oiottrackcalltaxi@gmail.com  email address. We will promptly correct any information found to be incorrect."
  };

  final String privacyPolicyUrl = 'api/privacyPolicyUrl';
  final Dio dio = Dio();

  Future<PrivacyPolicyModel?> fetchPrivacyPolicyDetails() async {
    try {
      // Simulate response status code
      int statusCode = 200;
      if (statusCode == 200) {
        return PrivacyPolicyModel.fromJson(privacyPolicyData);
      } else {
        throw Exception('Failed to fetch privacy policy data');
      }
    } catch (e) {
      log('Error fetching privacy policy data: $e');
      return null;
    }
  }
}
