import 'dart:developer';

import 'package:oiot/imports.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/performance_bonus/model/performance_bonus_model.dart';

class PerformanceBonusService {
  List<Map<String, dynamic>> performanceBonusDataList = [
    {
      'id': 'PER1465',
      'bonusAmount': '₹50',
      'expiryDate': '23-08-2024',
      'expiryTime': '10.20 AM',
      'isActive': true,
    },
    {
      'id': 'PER1012',
      'bonusAmount': '₹75',
      'expiryDate': '25-01-2024',
      'expiryTime': '11.30 PM',
      'isActive': false,
    },
  ];

  Dio dio = Dio();

  Future<List<PerformanceBonusModel>?> fetchPerformanceBonusData() async {
    try {
      int statusCode = 200;
      if (statusCode == 200) {
        List<PerformanceBonusModel> performanceBonusData =
            performanceBonusDataList
                .map((performanceData) =>
                    PerformanceBonusModel.fromJson(performanceData))
                .toList();
        return performanceBonusData;
      } else {
        throw Exception('Failed to fetch performance bonus data');
      }
    } catch (e) {
      log('Error fetching performance bonus data: $e');
      return [];
    }
  }
}
