import '../../../../imports.dart';

class AddBankAccountScreenProvider extends ChangeNotifier {
  final TextEditingController _bankName = TextEditingController();
  final TextEditingController _accountHolderName = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _ifscCode = TextEditingController();

  TextEditingController get bankName => _bankName;
  TextEditingController get accountHolderName => _accountHolderName;
  TextEditingController get accountNumber => _accountNumber;
  TextEditingController get ifscCode => _ifscCode;
}
