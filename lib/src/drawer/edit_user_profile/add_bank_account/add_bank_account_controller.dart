import '../../../../imports.dart';

class AddBankAccountProvider extends ChangeNotifier {
  AddBankAccountService addBankAccountService = AddBankAccountService();

  final TextEditingController _accountHolderName = TextEditingController();
  final TextEditingController _bankAccountNumber = TextEditingController();
  final TextEditingController _confirmBankAccount = TextEditingController();
  final TextEditingController _ifscCode = TextEditingController();
  File? _passbookImage;
  File? _passbookPdf;
  String? selectedPdfLastPath;
  File? get passbookImage => _passbookImage;
  File? get passbookPdf => _passbookPdf;

  TextEditingController get accountHolderName => _accountHolderName;
  TextEditingController get bankAccountNumber => _bankAccountNumber;
  TextEditingController get confirmBankAccount => _confirmBankAccount;
  TextEditingController get ifscCode => _ifscCode;

  // String? accountHolderNameValidation(String? accountHolderNameValue) {
  //   if (accountHolderNameValue == null || accountHolderNameValue.isEmpty) {
  //     return 'Please enter account holder name';
  //   }
  //   return null;
  // }

  // String? bankAccountNumberValidation(String? bankAccountNumberValue) {
  //   if (bankAccountNumberValue == null || bankAccountNumberValue.isEmpty) {
  //     return 'Please enter bank account number';
  //   }
  //   return null;
  // }

  // String? ifscCodeValidation(String? ifscCodeValue) {
  //   if (ifscCodeValue == null || ifscCodeValue.isEmpty) {
  //     return 'Please enter ifsc code';
  //   }
  //   return null;
  // }

  getLastPdfPathName() {
    final uri = Uri.parse(_passbookPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _passbookImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _passbookPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _passbookImage = null;
    notifyListeners();
  }

  void log(String s) {}

  Future<bool> addBankAccount(BuildContext context) async {
    AddBankAccountModel data = AddBankAccountModel(
      accountHolderName: _accountHolderName.text,
      bankAccountNumber: _bankAccountNumber.text,
      confirmBankAccountNumber: _confirmBankAccount.text,
      ifscCode: _ifscCode.text,
      passbook: _passbookImage ?? _passbookPdf,
    );

    final result = await addBankAccountService.postBankAccountData(data);

    if (result != null && result['status'] == true) {
      await Future.delayed(const Duration(seconds: 2));

      Fluttertoast.showToast(msg: '${result['message']}');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    }
  }

  void clearTextFields() {
    _accountHolderName.clear();
    _bankAccountNumber.clear();
    _confirmBankAccount.clear();
    _ifscCode.clear();
  }
}
