import 'package:oiot/src/drawer/wallet/bonus/widgets/subscription_bonus/model/subscription_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/subscription_bonus/subscription_bonus_service.dart';

import '../../../../../../imports.dart';

class SubscriptionBonusProvider extends ChangeNotifier {
  List<SubscriptionBonusModel> _subscriptionBonusList = [];
  List<SubscriptionBonusModel> get subscriptionBonusList =>
      _subscriptionBonusList;

  SubscriptionBonusProvider() {
    fetchSubscriptionBonusData();
  }

  Future<void> fetchSubscriptionBonusData() async {
    SubscriptionBonusService subscriptionBonusService =
        SubscriptionBonusService();
    List<SubscriptionBonusModel>? result =
        await subscriptionBonusService.fetchSubscriptionBonusData();
    if (result != null) {
      _subscriptionBonusList = result;
      notifyListeners();
    }
  }
}
