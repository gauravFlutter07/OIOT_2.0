import 'package:oiot/imports.dart';

class AddEmergencyContactProvider extends ChangeNotifier {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();

  TextEditingController get fullName => _fullName;
  TextEditingController get mobileNumber => _mobileNumber;

  String? fullNameValidation(String? fullnameNew) {
    if (fullnameNew == null || fullnameNew.isEmpty) {
      return 'Please enter full name';
    }
    return null;
  }

  String? mobileNumberValidation(String? mobileNumberNew) {
    if (mobileNumberNew == null || mobileNumberNew.isEmpty) {
      return 'Please enter mobile number';
    }
    return null;
  }
}
