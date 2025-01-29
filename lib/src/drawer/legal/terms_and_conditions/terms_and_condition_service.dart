import 'dart:developer';

import '../../../../imports.dart';

class TermsAndConditionsService {
  final Map<String, dynamic> termsAndConditionsData = {
    "content":
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.\n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.\nVarious versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    "acceptedDateTime": "2024-02-03T17:35:00Z",
    "acceptedLocation": "J.P Nagar",
  };

  Future<TermsAndConditionsModel?> fetchTermsAndConditions() async {
    try {
      // Simulating API call delay
      await Future.delayed(const Duration(seconds: 1));

      return TermsAndConditionsModel.fromJson(termsAndConditionsData);
    } catch (e) {
      log('Error fetching terms and conditions: $e');
      return null;
    }
  }
}
