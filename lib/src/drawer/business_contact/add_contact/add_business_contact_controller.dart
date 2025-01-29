import 'package:oiot/src/drawer/business_contact/phone_contacts/business_contacts.dart';

import '../../../../imports.dart';

class AddBusinessContactProvider extends ChangeNotifier {
  AddContactService addContactService = AddContactService();

  //
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();

  TextEditingController get fullName => _fullName;
  TextEditingController get mobileNumber => _mobileNumber;
  TextEditingController get emailAddress => _emailAddress;

  void clearAllTextControllers() {
    _fullName.clear();
    _mobileNumber.clear();
    _emailAddress.clear();
  }

  Future<bool> postAddContactData(BuildContext context) async {
    AddContactModel addContactData = AddContactModel(
      fullname: _fullName.text,
      mobileNumber: _mobileNumber.text,
      emailAddress: _emailAddress.text,
    );
    final result = await addContactService.postAddContact(addContactData);

    if (result != null && result['status'] == true) {
      await Future.delayed(const Duration(seconds: 2));

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, RouteClass.userOfflineHome);
      clearAllTextControllers();

      Fluttertoast.showToast(msg: '${result['message']}');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    }
  }
}
