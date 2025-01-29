import 'dart:developer';
import 'package:oiot/src/login_register/create_account_oiot/create_account.dart';
import 'package:oiot/src/login_register/create_account_oiot/model/create_account_model.dart';
import 'package:oiot/src/login_register/create_password/create_password_screen.dart';
import '../../../imports.dart';

class OtpVarificationScreen extends StatelessWidget {
  final int flag;
  final CreateAccountModel? createModal;
  final String? finalOtp;
  final String? mobileNo;
  const OtpVarificationScreen({super.key, required this.flag, required this.createModal, required this.finalOtp, this.mobileNo});

  @override
  Widget build(BuildContext context) {
    final otpVarificationProvider =
        Provider.of<OtpVarificationProvider>(context);

    return Scaffold(
      body: Padding(
        padding: verticalPadding12,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: padding12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomHeader(
                    title: AppLocalizations.of(context)!.verificationCode,
                  ),
                  height30,
                  Text(
                      AppLocalizations.of(context)!
                          .pleaseEnterTheVerificationCode,
                      style: tsMediumGrey),
                  height40,
                  Image.asset(otplogoSmall),
                  height35,
                  Text(
                    AppLocalizations.of(context)!.enterFourDigitCode,
                    style: tsRegularBoldGrey,
                  ),
                  height20,
                  Padding(
                    padding: padding12,
                    child: PinFieldAutoFill(
                      decoration: UnderlineDecoration(
                        colorBuilder: FixedColorBuilder(
                          black54,
                        ),
                        textStyle: tsMedium,
                      ),
                      currentCode: otpVarificationProvider.otp,
                      codeLength: 4,
                      onCodeChanged: (code) {
                        log("onCodeChanged $code");
                        otpVarificationProvider.setOtp(code.toString());
                      },
                      onCodeSubmitted: (val) {
                        log("onCodeSubmitted $val");
                      },
                    ),
                  ),
                  height20,
                  Padding(
                    padding: padding10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<OtpVarificationProvider>(
                          builder: (context, otpVarificationProvider, child) {
                            return Text(
                              '${otpVarificationProvider.counter} sec',
                              style: tsLargeBold,
                            );
                          },
                        ),
                        height20,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: CustomButton(
                              onTap: () {
                                otpVarificationProvider.verifyOtp(context,mobileNo, flag, finalOtp!, createModal);
                                /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CreatePasswordScreen(flag: flag),
                                  ),
                                );*/
                              },
                              title: AppLocalizations.of(context)!.verify,
                              border: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height25,
                  InkWell(
                    onTap: () {
                      otpVarificationProvider.listenOtp();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.didntReceivedTheCode,
                      style: tsRegularGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
