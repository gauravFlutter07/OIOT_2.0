import '../../../../../imports.dart';

class PayingSubscriptionProvider extends ChangeNotifier {
  final TextEditingController _couponCodeController = TextEditingController();
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  final int _walletAmount = 3000;
  int get walletAmount => _walletAmount;
  final int _subscriptionAmount = 1000;
  int get subscriptionAmount => _subscriptionAmount;
  int? _balanceWalletAmount;
  int? get balanceWalletAmount => _balanceWalletAmount;

  TextEditingController get couponCodeController => _couponCodeController;

  setCheckBoxValue(bool? value) {
    if (value == null) {
      return;
    }
    _isChecked = !_isChecked;
    notifyListeners();
    if (_isChecked) {
      _balanceWalletAmount = _walletAmount - subscriptionAmount;
      notifyListeners();
    }
  }

  String? name;
}
