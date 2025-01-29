import 'dart:developer';

import 'package:oiot/src/home_oiot/home_online/service_type/rental_estimated_price/model/rental_estimated_model.dart';

import '../../../../../imports.dart';

class RentalEstimatedService {
  Map<String, dynamic> estimatedInvoiceData = {
    "hatchBack": {
      "bookingId": "HBK45651321",
      "estimatedAmount": "200",
      "bookingType": "HatchBack",
      "pickUpLocation": "Jp Nagar",
      "destinationLocation": "Satellite bus stand",
      "serviceType": "Rental Ride",
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
      "serviceType": "Rental Ride",
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
      "serviceType": "Rental Ride",
      "package": "15 k.m x 1 hour",
      "basePrice": "300",
      "extraKm": "30 km",
      "extraTime": "300",
      "totalDistance": "15 km",
      "totalRidingTime": "1 hour",
    },
    "luxury": {
      "bookingId": "LUX12345678",
      "estimatedAmount": "600",
      "bookingType": "Luxury",
      "pickUpLocation": "Jp Nagar",
      "destinationLocation": "Satellite bus stand",
      "serviceType": "Rental Ride",
      "package": "15 k.m x 1 hour",
      "basePrice": "500",
      "extraKm": "50 km",
      "extraTime": "500",
      "totalDistance": "15 km",
      "totalRidingTime": "1 hour",
    }
  };

  Dio dio = Dio();

  Future<RentalEstimatModel?> fetchRentalInvoiceData() async {
    try {
      int statusCode = 200;

      if (statusCode == 200) {
        dynamic result = RentalEstimatModel.fromJson(estimatedInvoiceData);
        return result;
      } else {
        throw Exception('Failed to fetch estimated rental invoice data');
      }
    } catch (e) {
      log('Error fetching estimated rental invoice: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> postCouponData({
    required String couponId,
  }) async {
    try {
      int statusCode = 200;

      if (statusCode == 200) {
        Map<String, dynamic> status = {
          'status': true,
          'message': 'Post estimated rental data sent successfully',
        };
        return status;
      } else {
        throw Exception('Failed to post estimated rental data');
      }
    } catch (e) {
      log('Error in posting estimated rental data: $e');
      return null;
    }
  }
}
