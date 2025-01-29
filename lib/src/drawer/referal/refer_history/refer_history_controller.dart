import '../../../../imports.dart';

class ReferHistoryProvider extends ChangeNotifier {
  ReferHistoryProvider() {
    fetchreferralDetails();
  }

  ReferHistoryModel? referHistoryData;
  Future<void> fetchreferralDetails() async {
    ReferHistoryService referHistoryService = ReferHistoryService();

    final ReferHistoryModel? result =
        await referHistoryService.fetchReferHistoryData();

    if (result != null) {
      referHistoryData = result;
      notifyListeners();
    }
  }
}
