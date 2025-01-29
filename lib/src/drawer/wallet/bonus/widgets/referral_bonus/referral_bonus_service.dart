import 'dart:developer';
import 'package:oiot/src/drawer/wallet/bonus/widgets/referral_bonus/model/referral_bonus_model.dart';
import '../../../../../../imports.dart';

class ReferralBonusService {
  List<Map<String, dynamic>> referralBonusData = [
    {
      "id": "REFERRAL123",
      "bonusAmount": "₹100",
      "date": "20 April 2024",
      "time": "09.00 AM",
      "status": true,
    },
    {
      "id": "REFERRAL046",
      "bonusAmount": "₹80",
      "date": "02 February 2024",
      "time": "04.00 PM",
      "status": false,
    }
  ];

  String referralBonusUrl = 'api/referralbonus';

  Dio dio = Dio();

  Future<List<ReferralBonusModel>?> fetchReferralBonusData() async {
    try {
      // Response response = await dio.get(referralBonusUrl);

      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = referralBonusData;

        log('message r :${result.toString()}');
        List<ReferralBonusModel> referralBonus = referralBonusData
            .map((referral) => ReferralBonusModel.fromJson(referral))
            .toList();
        return referralBonus;
      } else {
        throw Exception('Failed to fetch referralBonus data');
      }
    } catch (e) {
      log('Error fetching referralBonus data: $e');
      return null;
    }
  }
}
