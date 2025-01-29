import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/coupon_bonus/model/coupon_bonus_model.dart';

class CouponBonusService {
  List<Map<String, dynamic>> couponBonusDataList = [
    {
      "id": "COUPON354",
      "couponCode": "SAVE10",
      "discountAmount": "₹50",
      "expirationDate": "30 April 2024",
      "isActive": true,
    },
    {
      "id": "COUPON278",
      "couponCode": "50OFF",
      "discountAmount": "₹50",
      "expirationDate": "15 May 2024",
      "isActive": false,
    },
  ];

  String couponBonusUrl = 'api/couponBonus';

  Dio dio = Dio();

  Future<List<CouponModel>?> fetchCouponBonusData() async {
    try {
      // Simulating API call
      int statusCode = 200;
      if (statusCode == 200) {
        List<CouponModel> couponBonusList = couponBonusDataList
            .map((couponData) => CouponModel.fromJson(couponData))
            .toList();
        return couponBonusList;
      } else {
        throw Exception('Failed to fetch coupon bonus data');
      }
    } catch (e) {
      log('Error fetching coupon bonus data: $e');
      return [];
    }
  }
}
