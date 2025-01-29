// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:oiot/src/login_register/create_account_oiot/create_account.dart';
import 'package:oiot/src/login_register/create_password/create_password_service.dart';
import 'package:oiot/src/login_register/create_password/widget/create_account_success.dart';

import '../../../api/rider_repo.dart';
import '../../../imports.dart';

class CreatPasswordProvider extends ChangeNotifier {
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  final TextEditingController _passwordConfirmController =
      TextEditingController();

  TextEditingController get passwordConfirmController =>
      _passwordConfirmController;

  String? passwordValidation(BuildContext context) {
    if (_passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.pleaseEnterCompleteMpin);
      return '';
    }
    return null;
  }

  String? confirmPasswordValidation(BuildContext context) {
    if (_passwordConfirmController.text.isEmpty) {
      return '';
    }
    return null;
  }

  bool checkPasswordMatch(BuildContext context) {
    if (_passwordController.text == _passwordConfirmController.text) {
      return true;
    } else {
      return false;
    }
  }

  void clearAll() {
    _passwordController.clear();
    _passwordConfirmController.clear();
    notifyListeners();
  }

  Future<void> createNewPasswordForgotFunction(
      int flag, BuildContext context, String mobileNo, String otp) async {
    final isPassMatch = checkPasswordMatch(context);
    if (isPassMatch == false) return;


    try {
      var map = {
        "email":mobileNo,
        "otp":otp,
        "password":_passwordController.text,
        "confirmpassword":_passwordController.text
      };


      final result =  await RiderRepo.resetPassword(map);

      if (result != null && result['success']) {

        if (flag == 1) {
          PopupMessagePasswordResetSuccess popupMessagePasswordResetSuccess =
          PopupMessagePasswordResetSuccess();
          popupMessagePasswordResetSuccess.showMessage(context);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatedAccountSuccess(),
            ),
          );
        }
        clearAll();

      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }
    } on Exception catch (e) {
      log("Error :- ${e.toString()}");
    }

  }
}
