import '../../../../../imports.dart';

class AddBankAccountModel {
  final String accountHolderName;
  final String bankAccountNumber;
  final String confirmBankAccountNumber;
  final String ifscCode;
  final File? passbook;

  AddBankAccountModel({
    required this.accountHolderName,
    required this.bankAccountNumber,
    required this.confirmBankAccountNumber,
    required this.ifscCode,
    this.passbook,
  });

  Map<String, dynamic> tojson() {
    return {
      'accountHolderName': accountHolderName,
      'bankAccountNumber': bankAccountNumber,
      'confirmBankAccountNumber': confirmBankAccountNumber,
      'ifscCode': ifscCode,
      'passBook': passbook,
    };
  }
}
