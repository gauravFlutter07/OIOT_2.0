// ignore_for_file: file_names

import 'package:oiot/src/drawer/wallet/bonus/widgets/referral_bonus/model/referral_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/referral_bonus/referral_bonus_service.dart';
import '../../../../../../imports.dart';

class ReferralBonusProvider extends ChangeNotifier {
  List<ReferralBonusModel?> _referralBonusModelData = [];
  List<ReferralBonusModel?> get referralBonusModelData =>
      _referralBonusModelData;

  ReferralBonusProvider() {
    fetchReferralBonusDetails();
  }

  Future<void> fetchReferralBonusDetails() async {
    ReferralBonusService referralBonusService = ReferralBonusService();

    final List<ReferralBonusModel>? result =
        await referralBonusService.fetchReferralBonusData();

    if (result != null) {
      _referralBonusModelData = result;
      notifyListeners();
    }
  }
}
