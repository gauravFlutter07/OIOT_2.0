import 'dart:developer';

import 'package:oiot/src/drawer/wallet/bonus/widgets/welcome_bonus/model/welcome_bonus_model.dart';

import '../../../../../../imports.dart';

class WelcomeBonusService {
  List<Map<String, dynamic>> welcomeBonusData = [
    {
      "id": "AKJIF64613",
      "bonusAmount": "₹70",
      "date": "18 April 2024",
      "time": "08.00 AM",
      "isActive": true,
    },
    {
      "id": "ACDFQ12345",
      "bonusAmount": "₹50",
      "date": "14 December 2023",
      "time": "05.00 PM",
      "isActive": false,
    }
  ];

  String welcomeBonusUrl = 'api/welcomeBonus';

  Dio dio = Dio();

  Future<List<WelcomeBonusModel>?> fetchWelcomeBonusData() async {
    try {
      // Response response = await dio.get(welcomeBonusUrl);

      int statuscode = 200;
      if (statuscode == 200) {
        // dynamic result = welcomeBonusData;

        // log('message r :${result.toString()}');
        List<WelcomeBonusModel> welcomeBonusList = welcomeBonusData
            .map((welcomeBonus) => WelcomeBonusModel.fromJson(welcomeBonus))
            .toList();
        return welcomeBonusList;
      } else {
        throw Exception('Failed to fetch welcomeBonus data');
      }
    } catch (e) {
      log('Error fetching welcomeBonus data: $e');
      return null;
    }
  }
}
