import '../../../../imports.dart';

class AddBankDetails extends StatelessWidget {
  const AddBankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Consumer<AddBankAccountProvider>(
      builder: (context, addbankdetailsprovider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: padding12,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomHeader(
                        title: AppLocalizations.of(context)!.addBankDetails,
                      ),
                      height30,
                      Text(
                        AppLocalizations.of(context)!.accountHolderName,
                        style: tsRegularBold,
                      ),
                      height05,
                      TextFormField(
                        controller: addbankdetailsprovider.accountHolderName,
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)!.accountHolderName,
                          hintStyle: TextStyle(color: textDarkGrey),
                          border: OutlineInputBorder(
                            borderRadius: circularBorderRadius10,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .accountHolderName;
                          }
                          return null;
                        },
                      ),
                      height10,
                      Text(
                        AppLocalizations.of(context)!.bankAccountNumber,
                        style: tsRegularBold,
                      ),
                      height05,
                      TextFormField(
                        controller: addbankdetailsprovider.bankAccountNumber,
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)!.bankAccountNumHint,
                          hintStyle: TextStyle(color: textDarkGrey),
                          border: OutlineInputBorder(
                            borderRadius: circularBorderRadius10,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .bankAccountNumber;
                          }
                          return null;
                        },
                      ),
                      height10,
                      Text(
                        AppLocalizations.of(context)!.confirmBankAccountNumber,
                        style: tsRegularBold,
                      ),
                      height05,
                      TextFormField(
                        controller: addbankdetailsprovider.confirmBankAccount,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .confirmBankAccountNumHint,
                          hintStyle: TextStyle(color: textDarkGrey),
                          border: OutlineInputBorder(
                            borderRadius: circularBorderRadius10,
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value !=
                                  addbankdetailsprovider
                                      .bankAccountNumber.text) {
                            return AppLocalizations.of(context)!
                                .bankAccountNumberMismatch;
                          }
                          return null;
                        },
                      ),
                      height10,
                      Text(
                        AppLocalizations.of(context)!.ifscCode,
                        style: tsRegularBold,
                      ),
                      height05,
                      TextFormField(
                        controller: addbankdetailsprovider.ifscCode,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.ifscHint,
                          hintStyle: TextStyle(color: textDarkGrey),
                          border: OutlineInputBorder(
                            borderRadius: circularBorderRadius10,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.ifscCode;
                          }
                          return null;
                        },
                      ),
                      height10,
                      Text(
                        AppLocalizations.of(context)!.uploadFrontPageOfPassbook,
                        style: tsRegular,
                      ),
                      height10,
                      const ImageContainerBank(),
                      height10,
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: circularBorderRadius5,
                        ),
                        child: ListTile(
                          leading: Image.asset(upi),
                          title: Text(
                            AppLocalizations.of(context)!.addUpi,
                            style: tsRegularBold,
                          ),
                          subtitle: Text(
                            AppLocalizations.of(context)!
                                .instantPaymentUsingUpiApp,
                            style: tsRegular,
                          ),
                        ),
                      ),
                      height20,
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  PopUpSuccessMessage popUpSuccessMessage =
                      PopUpSuccessMessage();
                  popUpSuccessMessage.showMessage(context);
                  addbankdetailsprovider.clearTextFields();
                }
              },
              title: AppLocalizations.of(context)!.addNow,
              border: true,
            ),
          ),
        );
      },
    );
  }
}
