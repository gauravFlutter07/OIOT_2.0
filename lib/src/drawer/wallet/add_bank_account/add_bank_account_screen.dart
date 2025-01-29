import '../../../../imports.dart';
import '../../../../widgets/app_text_widget.dart';

class AddBankAccountScreen extends StatelessWidget {
  const AddBankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addBankAccountProvider = context.read<AddBankAccountScreenProvider>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.addBankAccount),
              Container(
                margin: horizontalPadding20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                        AppLocalizations.of(context)!.bankName,
                        pureBlack,
                        FontWeight.w700,
                        16.0,
                        false,
                        null,
                        0.0,
                        30.0,
                        0.0,
                        5.0),
                    CustomTextFormField(
                        textEditingController: addBankAccountProvider.bankName,
                        isPass: false,
                        hint: AppLocalizations.of(context)!.bankName),
                    textWidget(
                        AppLocalizations.of(context)!.accountHolderName,
                        pureBlack,
                        FontWeight.w700,
                        16.0,
                        false,
                        null,
                        0.0,
                        30.0,
                        0.0,
                        5.0),
                    CustomTextFormField(
                        textEditingController: addBankAccountProvider.bankName,
                        isPass: false,
                        hint: AppLocalizations.of(context)!.accountHolderName),
                    textWidget(
                        AppLocalizations.of(context)!.accountNumber,
                        pureBlack,
                        FontWeight.w700,
                        16.0,
                        false,
                        null,
                        0.0,
                        30.0,
                        0.0,
                        5.0),
                    CustomTextFormField(
                        textEditingController: addBankAccountProvider.bankName,
                        isPass: false,
                        hint: AppLocalizations.of(context)!.accountNumber),
                    textWidget(
                        AppLocalizations.of(context)!.ifscCode,
                        pureBlack,
                        FontWeight.w700,
                        16.0,
                        false,
                        null,
                        0.0,
                        30.0,
                        0.0,
                        5.0),
                    CustomTextFormField(
                        textEditingController: addBankAccountProvider.bankName,
                        isPass: false,
                        hint: AppLocalizations.of(context)!.ifscCode),
                    height10,
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const CancelledCheque(),
                        //   ),
                        // );
                      },
                      child: textWidget(
                          AppLocalizations.of(context)!
                              .uploadPassbookAndCancelledCheque,
                          pureBlack,
                          FontWeight.w700,
                          16.0,
                          false,
                          null,
                          0.0,
                          30.0,
                          0.0,
                          5.0),
                    ),
                    height05,
                    CustomTextButton(
                      text: AppLocalizations.of(context)!
                          .uploadPassbookAndCancelledCheque,
                      color: lightGrey,
                      callBack: () {
                        // Navigator.pushNamed(
                        //     context, RouteClass.passbookandchequescreen);
                      },
                      textColor: textGrey,
                      border: 5,
                      fontSize: 14,
                      borderColor: lightGrey,
                    ),
                    height02,
                    PaymentOption(
                        upiPng,
                        AppLocalizations.of(context)!.addUpiId,
                        AppLocalizations.of(context)!
                            .instantPaymentUsingUpiApp),
                    height10,
                    Padding(
                      padding: vertPadding05,
                      child: CustomButton(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => cancelCheque()),
                          // );
                        },
                        title: AppLocalizations.of(context)!.verifyAndAdd,
                        border: true,
                      ),
                    ),
                    Padding(
                      padding: verticalPadding10,
                      child: CustomButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AddBankAccountSuccessScreen(),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.submit,
                        border: true,
                      ),
                    ),
                    height20,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
