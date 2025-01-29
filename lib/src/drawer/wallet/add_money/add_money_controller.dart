import '../../../../imports.dart';

class AddMoneyProvider extends ChangeNotifier {
  final TextEditingController _addedAmountController = TextEditingController();
  TextEditingController get addedAmountController => _addedAmountController;

  void setDefaultAmount(String amount) {
    _addedAmountController.text = amount;
  }

  AddWalletService addWalletService = AddWalletService();

  Future<bool> addWallet(BuildContext context) async {
    AddWalletModel data = AddWalletModel(amount: _addedAmountController.text);
    final result = await addWalletService.postWalletData(data);

    if (result != null && result['status'] == true) {
      await Future.delayed(const Duration(seconds: 0));

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddMoneyWalletScreen(),
        ),
      );

      // Fluttertoast.showToast(msg: '${result['message']}');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    }
  }
}
