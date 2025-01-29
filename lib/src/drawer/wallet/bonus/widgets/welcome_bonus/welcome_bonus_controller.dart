import 'package:oiot/src/drawer/wallet/bonus/widgets/welcome_bonus/model/welcome_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/welcome_bonus/welcome_bonus_service.dart';

import '../../../../../../imports.dart';

class WelcomeBonusProvider extends ChangeNotifier {
  List<WelcomeBonusModel?> _welcomeBonusModelData = [];
  List<WelcomeBonusModel?> get welcomeBonusModelData => _welcomeBonusModelData;

  WelcomeBonusProvider() {
    fetchWelcomeBonusDetails();
  }

  Future<void> fetchWelcomeBonusDetails() async {
    WelcomeBonusService welcomeBonusService = WelcomeBonusService();

    List<WelcomeBonusModel>? result =
        await welcomeBonusService.fetchWelcomeBonusData();

    if (result != null) {
      _welcomeBonusModelData = result;
      notifyListeners();
    }
  }
}
