import 'dart:developer';

import 'package:oiot/src/drawer/wallet/bonus/widgets/subscription_bonus/model/subscription_bonus_model.dart';

import '../../../../../../imports.dart';

class SubscriptionBonusService {
  List<Map<String, dynamic>> subscriptionBonusDataList = [
    {
      "id": "SUB456",
      "bonusAmount": "₹100",
      "validityPeriod": "1 month",
      "isActive": true,
    },
    {
      "id": "SUB123",
      "bonusAmount": "₹50",
      "validityPeriod": "6 months",
      "isActive": false,
    },
    {
      "id": "SUB056",
      "bonusAmount": "₹40",
      "validityPeriod": "1 Year",
      "isActive": false,
    },
  ];

  Dio dio = Dio();

  String subscriptionBonusUrl = 'api/subscritionbonus';

  Future<List<SubscriptionBonusModel>?> fetchSubscriptionBonusData() async {
    try {
      int statusCode = 200;

      if (statusCode == 200) {
        List<SubscriptionBonusModel> subscriptionBonusList =
            subscriptionBonusDataList
                .map((subscriptiondata) =>
                    SubscriptionBonusModel.fromJson(subscriptiondata))
                .toList();

        return subscriptionBonusList;
      } else {
        throw Exception('Failed to fetch subscription bonus data');
      }
    } catch (e) {
      log('Error fetching subscription bonus data: $e');
      return [];
    }
  }
}
