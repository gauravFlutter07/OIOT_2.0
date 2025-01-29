import 'dart:developer';

import '../../../../imports.dart';

class AboutUsService {
  final Map<String, dynamic> aboutUsData = {
    "title": "About OIOT",
    "description":
        "At OIOT, we are dedicated to providing the best taxi booking experience for our customers. Our mission is to make taxi booking convenient, reliable, and hassle-free.",
    "vision":
        "Our vision is to become the go-to platform for taxi bookings, trusted by millions of users worldwide. We aim to innovate continuously, improve our services, and exceed customer expectations.",
    "values": ["Convenience", "Reliability", "Safety", "Customer Satisfaction"],
    "contact": {
      "email": "info@oiot.com",
      "phone": "+1234567890",
      "address": "JP Nagar 2nd phase, Bangalore, India"
    }
  };

  String aboutUsUrl = 'api/aboutUsUrl';

  Dio dio = Dio();

  Future<AboutUsDataModel?> fetchAboutUsDetails() async {
    try {
      // Response response = await dio.get(aboutUsUrl);
      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = AboutUsDataModel.fromJson(aboutUsData);
        return result;
      } else {
        throw Exception('Failed to fetch about us data');
      }
    } catch (e) {
      log('Error fetching about us data: $e');
      return null;
    }
  }
}
