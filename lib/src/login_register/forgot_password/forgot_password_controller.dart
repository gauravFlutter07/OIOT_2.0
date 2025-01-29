// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:oiot/api/rider_repo.dart';
import 'package:oiot/src/login_register/create_account_oiot/create_account.dart';
import 'package:oiot/src/login_register/create_password/create_password_screen.dart';
import '../../../imports.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final ForgotPasswordService forgotPasswordService = ForgotPasswordService();

  final TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController get mobileNumberController => _mobileNumberController;

  dynamic _appSignatureId;
  String? mobileNumberValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.pleaseEnterMobile);
      return '';
    } else if (value.length != 10) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!
              .pleaseEnteraValidTenDigitMobileNumber);
      return '';
    }
    return null;
  }

  Future<void> autoCopyOtpSignature() async {
    if (_mobileNumberController.text.isEmpty) return;
    _appSignatureId = await SmsAutoFill().getAppSignature;
  }

  Future<void> forgotPassword(BuildContext context) async {
    try {
      await autoCopyOtpSignature();

      final mobileNumber = _mobileNumberController.text;

      if (mobileNumber.isEmpty) {
        Fluttertoast.showToast(
            msg: AppLocalizations.of(context)!
                .pleaseEnterYourRegisteredMobileNumber);
        return;
      }

      var map = {
        "email": mobileNumber
      };


      final result =  await RiderRepo.forgotPassword(map);

      if (result != null && result['success'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  OtpVarificationScreen(
              flag: 1,
              createModal: null,
              finalOtp: result['OTP'],
              mobileNo: mobileNumber,
            ),
          ),
        );

        Fluttertoast.showToast(msg: '${result['message']}');

      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }


      /*final result = await RiderRepo.forgotPassword(map);
      if (result != null && result['success'] == true) {
        Provider.of<OtpVarificationProvider>(context, listen: false)
            .resetCounter();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OtpVarificationScreen(
              flag: 1,
              createModal: null,
              finalOtp: null,
            ),
          ),
        );
        _mobileNumberController.clear();

      }else{
        log('Failed to request password reset');
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }*/
    } catch (e) {
      log('An error occurred: $e');
    }
  }

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }
}
