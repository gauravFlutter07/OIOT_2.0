import '../../../../imports.dart';

class EmergencyProvider extends ChangeNotifier {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _regMobileController = TextEditingController();
  final TextEditingController _emailID = TextEditingController();

  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get regMobileController => _regMobileController;
  TextEditingController get emailID => _emailID;

  List<EmergencyContactModel> _emergencyContact = [];
  List<EmergencyContactModel> get emergencyContact => _emergencyContact;

  EmergencyProvider() {
    fetchEmergencyContact();
  }

  Future<void> fetchEmergencyContact() async {
    EmergencyContactService emergencyContactService = EmergencyContactService();
    List<EmergencyContactModel>? result =
        await emergencyContactService.fetchEmergencyContactData();
    _emergencyContact = result!;
    notifyListeners();
  }

  void setSwitchState(int index, bool value) {
    _emergencyContact[index].switchState = value;
    notifyListeners();
  }

  Future<bool> postEmergencyContactDetails(BuildContext context) async {
    EmergencyContactService emergencyContactService = EmergencyContactService();
    AddEmergencyContactModel data = AddEmergencyContactModel(
      fullName: _fullNameController.text,
      mobileNumber: _regMobileController.text,
      email: _emailID.text,
    );

    final result = await emergencyContactService.postEmergencyContact(data);

    if (result != null && result['status'] == true) {
      await Future.delayed(const Duration(seconds: 1));

      // ignore: use_build_context_synchronously
      SaveEmergencyPopUpSuccessMessage saveEmergencyPopUpSuccessMessage =
          SaveEmergencyPopUpSuccessMessage();
      // ignore: use_build_context_synchronously
      saveEmergencyPopUpSuccessMessage.showMessage(context);
      clearAllTextControllers();

      Fluttertoast.showToast(msg: '${result['message']}');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    }
  }

  void clearAllTextControllers() {
    _fullNameController.clear();
    _regMobileController.clear();
    _emailID.clear();
  }
}
