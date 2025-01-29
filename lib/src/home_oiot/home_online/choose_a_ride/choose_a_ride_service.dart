// ignore_for_file: unused_local_variable

import 'dart:developer';

import '../../../../imports.dart';

class ChooseARideService {
  Map<String, dynamic> estimatedInvoiceData = {
    "hatchBack": {
      "bookingId": "HBK45651321",
      "estimatedAmount": "200",
      "bookingType": "HatchBack",
      "pickUpLocation": "Jp Nagar",
      "destinationLocation": "Satellite bus stand",
      "serviceType": "Daily Ride",
      "package": "15 k.m x 1 hour",
      "basePrice": "100",
      "extraKm": "18 km",
      "extraTime": "100",
      "totalDistance": "15 km",
      "totalRidingTime": "1 hour",
    },
    "sedan": {
      "bookingId": "SDN34578930",
      "estimatedAmount": "300",
      "bookingType": "Sedan",
      "pickUpLocation": "Jp Nagar",
      "destinationLocation": "Satellite bus stand",
      "serviceType": "Daily Ride",
      "package": "15 k.m x 1 hour",
      "basePrice": "200",
      "extraKm": "20 km",
      "extraTime": "200",
      "totalDistance": "15 km",
      "totalRidingTime": "1 hour",
    },
    "suv": {
      "bookingId": "SUV12458795",
      "estimatedAmount": "400",
      "bookingType": "Suv",
      "pickUpLocation": "Jp Nagar",
      "destinationLocation": "Satellite bus stand",
      "serviceType": "Daily Ride",
      "package": "15 k.m x 1 hour",
      "basePrice": "300",
      "extraKm": "30 km",
      "extraTime": "300",
      "totalDistance": "15 km",
      "totalRidingTime": "1 hour",
    },
  };

  Dio dio = Dio();

  String chooseARideUrl = 'api/chooseARideapi';
  String couponUrl = 'api/couponapi';

  Future<ChooseARideInvoiceModel?> fetchChooseRideInvoiceData() async {
    // Simulating API call, replace with actual API call using dio.get()
    try {
      int statusCode = 200;

      if (statusCode == 200) {
        dynamic result = ChooseARideInvoiceModel.fromJson(estimatedInvoiceData);
        return result;
      } else {
        throw Exception('Failed to fetch choose a ride invoice data');
      }
    } catch (e) {
      log('Error fetching choose a ride invoice: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> postCouponAndVehicleData({
    required String couponId,
  }) async {
    try {
      int statusCode = 200;

      if (statusCode == 200) {
        Map<String, dynamic> postData = {
          'couponId': couponId,
        };

        // Send postData to the backend
        // Response response = await dio.post(couponUrl, data: postData);

        Map<String, dynamic> status = {
          'status': true,
          'message': 'Post coupon and vehicle data sent successfully',
        };
        return postData;
      } else {
        throw Exception('Failed to post coupon and vehicle data');
      }
    } catch (e) {
      log('Error in posting coupon and vehicle data: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> postSelectedVehicleType({
    required String vehicleType,
  }) async {
    try {
      int statusCode = 200;

      if (statusCode == 200) {
        Map<String, dynamic> postData = {
          'vehicleType': vehicleType,
        };

        // Send postData to the backend
        // Response response = await dio.post(chooseARideUrl, data: postData);

        Map<String, dynamic> status = {
          'status': true,
          'message': 'Post selected vehicle type sent successfully',
        };
        return postData;
      } else {
        throw Exception('Failed to post selected vehicle type');
      }
    } catch (e) {
      log('Error in posting selected vehicle type: $e');
      return null;
    }
  }
}
