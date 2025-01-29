import '../../../../imports.dart';

class WalletTransactionHistoryProvider extends ChangeNotifier {
  final TextEditingController _selectedDate = TextEditingController();
  final TextEditingController _selectedDate1 = TextEditingController();

  TextEditingController get selectedDate => _selectedDate;
  TextEditingController get selectedDate1 => _selectedDate1;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      _selectedDate.text = picked.toLocal().toString().split(' ')[0];
      notifyListeners();
    }
  }
}
