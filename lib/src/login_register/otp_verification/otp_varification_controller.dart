import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oiot/src/login_register/create_account_oiot/model/create_account_model.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../api/rider_repo.dart';
import '../../../imports.dart';
import '../create_password/create_password.dart';
import '../create_password/create_password_screen.dart';

class OtpVarificationProvider extends ChangeNotifier with CodeAutoFill {
  int _counter = 120;
  String _otp = "";

  int get counter => _counter;
  String get otp => _otp;

  late Timer _timer;

  OtpVarificationProvider() {
    _startTimer();
    listenOtp();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        _counter--;
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    SmsAutoFill().listenForCode;
    resetCounter();
  }

  void verifyOtp(BuildContext context, String? mobileNo, int flag, String finalOtp, CreateAccountModel? createModal) async {
    if (_otp == finalOtp) {
      Fluttertoast.showToast(msg: 'Otp Verified Successfully');

      if(flag == 1){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  CreatePasswordScreen(
              flag: 1,
              mobileNo: mobileNo!,
              otp: finalOtp,
            ),
          ),
        );
      }else{
        await createAccount(createModal);
      }




    }else{
      Fluttertoast.showToast(msg: 'Invalid OTP');
    }
  }

  Future createAccount(CreateAccountModel? createModal)async{
    final result =  await RiderRepo.createRider(createModal?.toJson());

    if (result != null && result['success'] == true) {

        Navigator.push(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const CreatedAccountSuccess(),
          ),
        );
        Fluttertoast.showToast(msg: '${result['message']}');
      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }
  }

  @override
  void codeUpdated() {
    notifyListeners();
  }

  void resetCounter() {
    _counter = 120;
    notifyListeners();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    _timer.cancel();
    super.dispose();
  }

  setOtp(String value) {
    _otp = value;
    notifyListeners();
  }
}
