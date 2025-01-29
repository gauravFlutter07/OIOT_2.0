// ignore_for_file: use_build_context_synchronously

import 'package:oiot/src/drawer/business_contact/phone_contacts/business_contacts.dart';
import '../../../../imports.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final addBusinessContactProviderWatch =
        context.watch<AddBusinessContactProvider>();

    return Scaffold(
      body: Container(
        margin: padding15,
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(title: AppLocalizations.of(context)!.addContact),
                  height40,
                  customTextWidget(
                    text: AppLocalizations.of(context)!.fullNameCreateAccount,
                    size: 16.0,
                    color: blackColor,
                    weight: fontWeight500,
                  ),
                  height10,
                  TextFormField(
                    controller: addBusinessContactProviderWatch.fullName,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.egRaghuYadav,
                      border: OutlineInputBorder(
                        borderRadius: circularBorderRadius10,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!
                            .pleaseEnterFullName;
                      }
                      return null;
                    },
                  ),
                  height20,
                  customTextWidget(
                    text: AppLocalizations.of(context)!.mobilenumber,
                    size: 16.0,
                    color: blackColor,
                    weight: fontWeight500,
                  ),
                  height10,
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    controller: addBusinessContactProviderWatch.mobileNumber,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.egMobileNumber,
                      border: OutlineInputBorder(
                        borderRadius: circularBorderRadius10,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterMobile;
                      } else if (value.length != 10) {
                        return AppLocalizations.of(context)!
                            .pleaseEnterTenDigitMobileNumber;
                      }
                      return null;
                    },
                  ),
                  // height05,
                  customTextWidget(
                    text: AppLocalizations.of(context)!.emailAddress,
                    size: 16.0,
                    color: blackColor,
                    weight: fontWeight500,
                  ),
                  height10,
                  TextFormField(
                    controller: addBusinessContactProviderWatch.emailAddress,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.egEmailAddress,
                      border: OutlineInputBorder(
                        borderRadius: circularBorderRadius10,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterEmailId;
                      }
                      return null;
                    },
                  ),
                  height150,
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        bool success = await addBusinessContactProviderWatch
                            .postAddContactData(context);
                        if (success) {
                          AddContactPopUpSuccessMessage
                              addContactPopUpSuccessMessage =
                              AddContactPopUpSuccessMessage();
                          addContactPopUpSuccessMessage.showMessage(context);
                        } else {
                          // Handle failure case here if needed
                          Fluttertoast.showToast(
                              msg: AppLocalizations.of(context)!
                                  .somethingWentWrong);
                        }
                      }
                    },
                    title: AppLocalizations.of(context)!.addContact,
                    border: true,
                  ),

                  height45,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
