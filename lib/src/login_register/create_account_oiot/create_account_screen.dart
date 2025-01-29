import 'package:oiot/src/login_register/create_account_oiot/create_account_controller.dart';
import '../../../imports.dart';

class AccountCreateIndividual extends StatelessWidget {
  AccountCreateIndividual({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final CreateAccountProvider createAccountProvider =
        Provider.of<CreateAccountProvider>(context, listen: false);
    final createAccountProviderWatch = context.watch<CreateAccountProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: padding10,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height10,
                  Text(
                    AppLocalizations.of(context)!.createaaccount,
                    style: tsExtraLargeBold,
                  ),
                  height10,
                  Text(
                    AppLocalizations.of(context)!
                        .pleaseProvideYourRegNumberToLogin,
                    style: tsRegularBold,
                  ),
                  height10,
                  InkWell(
                    onTap: () {
                      bottomSheet(
                          context: context,
                          isPdf: false,
                          provider: createAccountProvider);
                    },
                    child: createAccountProvider.image == null
                        ? Align(
                            alignment: centreAlignment,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: lightBlue,
                                borderRadius: circularBorderRadius5,
                              ),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: blueMain,
                                    shape: circleBoxShape,
                                  ),
                                  width: 70,
                                  height: 70,
                                  child: Center(
                                    child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(cameraImage),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Align(
                            alignment: centreAlignment,
                            child: Stack(
                              alignment: centreAlignment,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: circleBoxShape,
                                    color: blackColor,
                                  ),
                                  child: ClipOval(
                                    child: Image.file(
                                      createAccountProvider.image!,
                                      height: 160,
                                      width: 160,
                                      fit: boxfitCover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  height10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.firstName,
                        style: tsRegularBold,
                      ),
                      height05,
                      TextFormField(
                        maxLength: 20,
                        controller: createAccountProvider.fullname,
                        validator: (value) => createAccountProvider
                            .createAccountValidation(value, context),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: circularBorderRadius15,
                          ),
                          hintText: AppLocalizations.of(context)!
                              .hintTextNameCreateAccount,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.mobilenumber,
                        style: tsRegularBold,
                      ),
                      height05,
                      TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: createAccountProvider.mobilenumber,
                        validator: (value) => createAccountProvider
                            .createMobileValidation(value, context),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: circularBorderRadius15,
                          ),
                          hintText: AppLocalizations.of(context)!
                              .hintTextNumberCreateAccount,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.emailAddressCreateAccount,
                        style: tsRegularBold,
                      ),
                      height05,
                      TextFormField(
                        controller: createAccountProvider.emailaddress,
                        validator: (value) => createAccountProvider
                            .createEmailValidation(value, context),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: AppLocalizations.of(context)!
                              .hintTextEmailCreateAccount,
                        ),
                      ),
                      height10,
                      Text(
                        AppLocalizations.of(context)!.password,
                        style: tsRegularBold,
                      ),
                      height05,
                      TextFormField(
                        maxLength: 8,
                        controller: createAccountProvider.pdw,
                        // validator: (value) => createAccountProvider
                        //     .createEmailValidation(value, context),
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
                      height15,
                    ],
                  ),
                  Card(
                    color: whiteColor,
                    child: Row(
                      children: [
                        width45,
                        Radio(
                          value: 1,
                          groupValue: createAccountProviderWatch.selectGender,
                          onChanged: (value) {
                            createAccountProvider.selectGenderFunction(value!);
                          },
                        ),
                        Text(
                          AppLocalizations.of(context)!.maleCreateAccount,
                          style: tsRegularBold,
                        ),
                        width60,
                        Radio(
                          value: 2,
                          groupValue: createAccountProviderWatch.selectGender,
                          onChanged: (value) {
                            createAccountProvider.selectGenderFunction(value!);
                          },
                        ),
                        Text(
                          AppLocalizations.of(context)!.femaleCreateAccount,
                          style: tsRegularBold,
                        ),
                      ],
                    ),
                  ),
                  height05,
                  Padding(
                    padding: vertHori20_20,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: circularBorderRadius10,
                      ),
                      child: Padding(
                        padding: leftPadding10,
                        child: TextFormField(
                          controller: createAccountProvider.referCode,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                AppLocalizations.of(context)!.enterReferralCode,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: createAccountProviderWatch.isClicked,
                          activeColor: blueMain,
                          onChanged: (value) {
                            createAccountProvider.isClickedFunction();
                          }),
                      height05,
                      Text(
                        AppLocalizations.of(context)!
                            .iAcceptAllTheCreateAccount,
                        style: tsRegular,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TermsAndConditions(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!
                              .termsAndConditionsCreateAccount,
                          style: tsRegularUnderline,
                        ),
                      ),
                    ],
                  ),
                  height10,
                  CustomButton(
                    onTap: () async {
                      if (createAccountProvider.isClicked) {
                        await createAccountProvider.submitCreateAccountData(
                            context, _formKey);
                      } else {
                        Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!
                              .hintPleaseAcceptBeforeCreateAccount,
                        );
                      }
                    },
                    title: AppLocalizations.of(context)!.createAccount,
                    border: true,
                  ),
                  height15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.alreadyhaveanaccount,
                        style: tsRegular,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteClass.loginScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signin,
                          style: tsRegularUnderline,
                        ),
                      ),
                    ],
                  ),
                  height15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(googleLogo),
                      ),
                      width30,
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(facebookLogo),
                      ),
                      width30,
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(linkedinLogo),
                      ),
                    ],
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
