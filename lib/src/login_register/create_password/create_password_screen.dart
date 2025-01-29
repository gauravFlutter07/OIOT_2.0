// ignore_for_file: must_be_immutable

import 'package:oiot/src/login_register/create_password/create_password_controller.dart';
import '../../../imports.dart';

class CreatePasswordScreen extends StatelessWidget {
  int flag;
  final String otp, mobileNo;
  CreatePasswordScreen({super.key, required this.flag, required this.otp, required this.mobileNo});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final createNewPasswordForgotProvider =
        Provider.of<CreatPasswordProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: padding16,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeader(title: ''),
                  height05,
                  Text(
                    AppLocalizations.of(context)!.setpin,
                    style: tsExtraLargeBold,
                  ),
                  height10,
                  Text(
                    AppLocalizations.of(context)!
                        .yourSetPinMustBeDifferentFromPreviousUsedPassword,
                    style: tsMediumGrey,
                  ),
                  height50,
                  Padding(
                    padding: passwordColumnPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.typeYourPin,
                          style: TextStyle(color: textGrey),
                        ),
                        height10,
                        TextFormField(
                          style: tsMedium,
                          textAlign: TextAlign.center,
                          controller: createNewPasswordForgotProvider
                              .passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          maxLength: 8,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!
                                .enterFourDigitCode,
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            return createNewPasswordForgotProvider
                                .passwordValidation(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  height20,
                  Padding(
                    padding: pinPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.retypeYourPin,
                          style: TextStyle(color: textGrey),
                        ),
                        height10,
                        TextFormField(
                          style: tsMedium,
                          textAlign: TextAlign.center,
                          controller: createNewPasswordForgotProvider
                              .passwordConfirmController,
                          keyboardType: TextInputType.visiblePassword,
                          maxLength: 8,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!
                                .reEnterFourDigitPassword,
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            return createNewPasswordForgotProvider
                                .confirmPasswordValidation(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  height80,
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        final provider = Provider.of<CreatPasswordProvider>(
                            context,
                            listen: false);
                        if (provider.checkPasswordMatch(context)) {
                          provider.createNewPasswordForgotFunction(
                              flag, context, mobileNo,otp);
                        } else {
                          Fluttertoast.showToast(
                              msg: AppLocalizations.of(context)!
                                  .passwordmissmatch);
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: AppLocalizations.of(context)!
                                .pleaseEnterCompleteMpin);
                      }
                    },
                    title: AppLocalizations.of(context)!.submit,
                    border: true,
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
