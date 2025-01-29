import 'package:get/get.dart';

import '../../../imports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: loginPadding,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height30,
                Text(
                  AppLocalizations.of(context)!.letsLogin,
                  style: tsExtraLargeBold,
                ),
                height20,
                Text(
                  AppLocalizations.of(context)!
                      .pleaseProvideYourRegNumberToLogin,
                  style: tsRegular,
                ),
                height30,
                Text(
                  AppLocalizations.of(context)!.mobilenumber,
                  style: tsSmallGrey,
                ),
                height10,
                CustomTextFormField(
                  maxLength: 10,
                  textInputType: inputTypeNumber,
                  textEditingController: loginProvider.mobileController,
                  isPass: false,
                  hint: AppLocalizations.of(context)!.enteryourmobilenumber,
                  validator: (value) {
                  return loginProvider.mobileValidation(value, context);
                  },
                  prefixIcon: SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        Text(
                          ' +91',
                          style: tsRegular,
                        ),
                        Container(
                          color: whiteColor,
                          height: 30,
                          width: 2,
                        ),
                      ],
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginProvider.mobileController.clear();
                    },
                    icon: Icon(
                      Icons.close,
                      color: textDarkGrey,
                    ),
                  ),
                ),
                height02,

                Text(
                  AppLocalizations.of(context)!.password,
                  style: tsSmallGrey,
                ),
                height05,
                TextFormField(
                  maxLength: 8,
                  controller: loginProvider.pwdController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) => loginProvider
                      .mobileValidation(value, context),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: AppLocalizations.of(context)!
                        .pleaseenterpassword,
                  ),
                ),

                height05,
                Align(
                  alignment: centreRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteClass.forgotPasswordScreen);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.forgotpassword,
                      style: tsSmallUnderline,
                    ),
                  ),
                ),
                height90,
                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      loginProvider.loginRequest(context);
                    }
                  },
                  title: AppLocalizations.of(context)!.login,
                  border: true,
                ),
                height25,
                Center(
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .donthaveanaccountswiperightto,
                        style: tsRegular,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RouteClass.accountCreateIndividual);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.createanewaccount,
                          style: tsRegularBlueUnderline,
                        ),
                      ),
                    ],
                  ),
                ),
                height30,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
