import 'package:oiot/imports.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/wallet_bonus/model/wallet_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/wallet_bonus/wallet_bonus_service.dart';

class WalletBonusProvider extends ChangeNotifier {
  List<WalletBonusModel> _walletBonusData = [];
  List<WalletBonusModel> get walletBonusData => _walletBonusData;

  WalletBonusProvider() {
    fetchWalletBonusData();
  }

  Future<void> fetchWalletBonusData() async {
    WalletBonusService walletBonusService = WalletBonusService();

    List<WalletBonusModel>? result =
        await walletBonusService.fetchWalletBonusData();

    if (result != null) {
      _walletBonusData = result;
      notifyListeners();
    }
  }
}
