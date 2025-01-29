import 'package:oiot/src/login_register/mpin/mpin_service.dart';

import '../../../imports.dart';

class MpinProvider extends ChangeNotifier {
  final TextEditingController _mpinTextController = TextEditingController();

  TextEditingController get mpinTextController => _mpinTextController;

  String? mpinValidation(BuildContext context) {
    if (_mpinTextController.text.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterCompleteMpin;
    }
    return null;
  }

  void clearAll() {
    _mpinTextController.clear();
    notifyListeners();
  }

  Future<void> createNewPasswordFunction(
      BuildContext context, String userId) async {
    MpinServices mpinServices = MpinServices();

    final result = await mpinServices.postNewCreatePassword(
        userId, _mpinTextController.text);

    if (result != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, RouteClass.userOfflineHome);

      clearAll();
    }
  }
}
