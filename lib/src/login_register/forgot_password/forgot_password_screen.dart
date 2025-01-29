import 'package:oiot/src/login_register/forgot_password/forgot_password.dart';
import '../../../imports.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordProvider forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: padding16,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(title: ''),
                height15,
                Text(
                  AppLocalizations.of(context)!.forgotpassword,
                  style: tsExtraLargeBold,
                ),
                height20,
                Text(
                  AppLocalizations.of(context)!
                      .dontWorryItHappensPleaseEnterNumber,
                ),
                height20,
                Text(
                  AppLocalizations.of(context)!.mobileemailaddress,
                ),
                height15,
                CustomTextFormField(
                  maxLength: 10,
                  textInputType: TextInputType.number,
                  validator: (value) {
                    return forgotPasswordProvider.mobileNumberValidation(
                        value, context);
                  },
                  textEditingController:
                      forgotPasswordProvider.mobileNumberController,
                  isPass: false,
                  hint: AppLocalizations.of(context)!.enteryourmobilenumber,
                  prefixIcon: SizedBox(
                    width: 5,
                    child: Row(
                      children: [
                        height10,
                        const Text(
                          ' +91',
                        ),
                        width5,
                        Container(
                          color: whiteColor,
                          height: 30,
                          width: 1,
                        ),
                      ],
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      forgotPasswordProvider.mobileNumberController.clear();
                    },
                    icon: Icon(
                      Icons.close,
                      color: textDarkGrey,
                    ),
                  ),
                ),
                const Spacer(),
                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      forgotPasswordProvider.forgotPassword(context);
                    }
                  },
                  title: AppLocalizations.of(context)!.sentotp,
                  border: true,
                ),
                height50,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
