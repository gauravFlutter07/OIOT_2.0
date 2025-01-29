import 'package:flutter/material.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/coupon_bonus/coupon_bonus_service.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/coupon_bonus/model/coupon_bonus_model.dart';

class CouponBonusProvider extends ChangeNotifier {
  List<CouponModel> _couponBonusList = [];
  List<CouponModel> get couponBonusList => _couponBonusList;

  CouponBonusProvider() {
    fetchCouponBonusDetails();
  }

  Future<void> fetchCouponBonusDetails() async {
    CouponBonusService couponBonusService = CouponBonusService();
    List<CouponModel>? result = await couponBonusService.fetchCouponBonusData();
    _couponBonusList = result!;
    notifyListeners();
  }
}
