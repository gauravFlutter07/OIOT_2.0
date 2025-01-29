import 'dart:developer';
import 'dart:math' as rnd;
import 'package:oiot/api/rider_repo.dart';
import 'package:oiot/src/login_register/create_account_oiot/create_account.dart';
import 'package:oiot/src/login_register/create_account_oiot/create_account_service.dart';
import 'package:oiot/src/login_register/create_account_oiot/model/create_account_model.dart';
import '../../../imports.dart';

class CreateAccountProvider extends ChangeNotifier {
  CreateAccountService createAccountService = CreateAccountService();

  File? _image;
  File? get image => _image;
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _referCode = TextEditingController();
  final TextEditingController _appSignature = TextEditingController();

  int _selectGender = 1;
  bool _isclicked = false;

  TextEditingController get fullname => _fullName;
  TextEditingController get pdw => _pwd;
  TextEditingController get mobilenumber => _mobileNumber;
  TextEditingController get emailaddress => _emailAddress;
  TextEditingController get referCode => _referCode;
  TextEditingController get appSignature => _appSignature;

  int get selectGender => _selectGender;
  bool get isClicked => _isclicked;

  String? createAccountValidation(String? nameValue, BuildContext context) {
    if (nameValue == null || nameValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterName;
    }
    return null;
  }

  String? createMobileValidation(String? mobileValue, BuildContext context) {
    if (mobileValue == null || mobileValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterMobile;
    } else if (mobileValue.length != 10) {
      return AppLocalizations.of(context)!.mobileMustBeTenDigits;
    }
    return null;
  }

  String? createEmailValidation(String? emailValue, BuildContext context) {
    if (emailValue == null || emailValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterEmailId;
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailValue)) {
      return AppLocalizations.of(context)!.pleaseEnterValidEmailAddress;
    }
    return null;
  }

  void selectGenderFunction(int button) {
    log('gender: $button');
    _selectGender = button;
    notifyListeners();
  }

  void isClickedFunction() {
    _isclicked = !_isclicked;
    notifyListeners();
  }

  // void isTickedFunction() {
  //   _isTicked = !_isTicked;
  //   notifyListeners();
  // }

  setImage(File? imagenew, String? imageName) {
    if (imagenew == null) return;
    _image = imagenew;
    notifyListeners();
  }

  void listenOtp() async {
    await SmsAutoFill().listenForCode();
    notifyListeners();
  }

  Future<void> getAppSignature() async {
    String appSignatureId = await SmsAutoFill().getAppSignature;
    _appSignature.text = appSignatureId;
    notifyListeners();
  }

  Future<void> submitCreateAccountData(
      BuildContext context, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      await getAppSignature();






      CreateAccountModel data = CreateAccountModel(
        fullname: _fullName.text,
        mobile: _mobileNumber.text,
        email: _emailAddress.text,
        gender: _selectGender == 1 ? 'male' : 'female',
        referral: _referCode.text,
        // photo: _image,
        appSignature: _appSignature.text,
        password: _pwd.text,
      );



      var map = {
        "phone": _mobileNumber.text
      };


      final result =  await RiderRepo.verifyNumber(map);

      if (result != null && result['success'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  OtpVarificationScreen(
              flag: 2,
              createModal: data,
              finalOtp: result['code'],
            ),
          ),
        );

        Fluttertoast.showToast(msg: '${result['message']}');
        clearTextControllers();
      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }

      // final result =  await RiderRepo.createRider(data.toJson());

      // final result = await createAccountService.postCreateAccount();

      /*if (result != null && result['success'] == true) {
        await Future.delayed(const Duration(seconds: 2));

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  OtpVarificationScreen(
              flag: 2,
              createModal: data,
            ),
          ),
        );
        Fluttertoast.showToast(msg: '${result['message']}');
        clearTextControllers();
      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }*/
    }
  }

  void clearTextControllers() {
    _fullName.clear();
    _mobileNumber.clear();
    _emailAddress.clear();
    _pwd.clear();
  }
}
