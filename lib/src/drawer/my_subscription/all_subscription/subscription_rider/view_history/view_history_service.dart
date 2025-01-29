import 'dart:developer';

import '../../../../../../imports.dart';

class ViewHistoryService {
  final Map<String, dynamic> viewHistoryData = {
    'AnnualPlanDays': '365 days',
    'StandardPlan': '₹40',
    'remainingDays': '0 days',
    'Validity': 'Monthly',
    'StartDate': 'JUNE 30, 23',
    'StartTime': '11.30 A.M',
    'EndDate': 'JULY 30, 24',
    'EndTime': '11.30 A.M',
  };
  String viewHistoryApi = 'api/viewhistorysubscription';
  Dio dio = Dio();

  Future<ViewHistoryModel?> fetchViewHistoryData() async {
    try {
      // Response response = await dio.get(viewHistoryApi);

      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = ViewHistoryModel.fromJson(viewHistoryData);
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
