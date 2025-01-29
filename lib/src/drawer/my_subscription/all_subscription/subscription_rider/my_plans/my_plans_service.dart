import 'dart:developer';

import '../../../../../../imports.dart';

class MyPlansService {
  final Map<String, dynamic> myPlansData = {
    'AnnualPlanDays': '365 days',
    'StandardPlan': '₹40',
    'remainingDays': '10 days',
    'Validity': 'Yearly',
    'StartDate': 'JUNE 30, 23',
    'StartTime': '11.30 A.M',
    'EndDate': 'JULY 30, 24',
    'EndTime': '11.30 A.M',
    '365DaysPack': '₹40',
    '180DaysPack': '₹20',
    '90DaysPack': '₹10',
  };

  String getMyplansUrl = 'api/myplans';

  Dio dio = Dio();

  Future<MyPlansModel?> fetchMyplansData() async {
    try {
      // Response response = await dio.get(getMyplansUrl);

      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = MyPlansModel.fromJson(myPlansData);
        return result;
      } else {
        throw Exception('Failed to fetch my plans data');
      }
    } catch (e) {
      log('Error fetching profile data: $e');
      return null;
    }
  }
}
