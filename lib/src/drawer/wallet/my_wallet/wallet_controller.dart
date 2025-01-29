import '../../../../imports.dart';

class WalletProvider extends ChangeNotifier {
  WalletProvider() {
    fetchWalletDetails();
  }

  List<WalletDataModel> _walletList = [];
  List<WalletDataModel> get walletList => _walletList;

  Future<void> fetchWalletDetails() async {
    WalletService walletService = WalletService();

    final List<WalletDataModel>? result = await walletService.fetchWalletData();

    if (result != null) {
      _walletList = result;
      notifyListeners();
    }
  }
}
