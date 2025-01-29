import '../../../../../imports.dart';

class PayingSubscriptionScreen extends StatelessWidget {
  const PayingSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final payingSubscriptionProvider =
        Provider.of<PayingSubscriptionProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: padding8,
                child: CustomHeader(
                    title: AppLocalizations.of(context)!.payingSubscription),
              ),
              Container(
                color: whiteColor,
                margin: horizontalPadding20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height10,
                    const OiotContainerWidget(),
                    height10,
                    Container(
                      height: 50,
                      width: 400,
                      color: textfieldBorder,
                      child: Padding(
                        padding: padding8,
                        child: Padding(
                          padding: padding5,
                          child: Text(
                            '9876543215',
                            style: tsRegularBold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: context
                                  .watch<PayingSubscriptionProvider>()
                                  .isChecked,
                              activeColor: blueMain,
                              onChanged: (value) {
                                payingSubscriptionProvider
                                    .setCheckBoxValue(value);
                              },
                            ),
                            Text(
                              AppLocalizations.of(context)!.walletAmount,
                              style: tsRegularBoldGrey,
                            ),
                          ],
                        ),
                        payingSubscriptionProvider.isChecked
                            ? Text(
                                '₹${payingSubscriptionProvider.balanceWalletAmount.toString()}',
                                style: tsRegularBoldGrey,
                              )
                            : Text(
                                '₹${payingSubscriptionProvider.walletAmount.toString()}',
                                style: tsRegularBoldGrey,
                              ),
                      ],
                    ),
                    Text(
                      AppLocalizations.of(context)!.applyCoupon,
                      style: tsRegularBold,
                    ),
                    Padding(
                      padding: topBottomPadding10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: circularBorderRadius10,
                          border: Border.all(color: textGrey, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: payingSubscriptionProvider
                                    .couponCodeController,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.of(context)!.enterCode,
                                  hintStyle: tsRegularBold,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: transperentColor,
                                  )),
                                  border: OutlineInputBorder(
                                    borderRadius: circularBorderRadius5,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: blueMain,
                                  ),
                                ),
                                elevation: 0.0,
                                padding: applyPaddingv20h25,
                                backgroundColor: blueMain,
                              ),
                              onPressed: () {},
                              child: Text(
                                AppLocalizations.of(context)!.apply,
                                style: tsRegularWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    height05,
                    Text(
                      AppLocalizations.of(context)!.allPaymentMethods,
                      style: tsRegularBold,
                    ),
                    PaymentMethodWidget(
                      image: cardLogo,
                      title: AppLocalizations.of(context)!.card,
                      subTitle:
                          AppLocalizations.of(context)!.visaMasterCardAndMore,
                    ),
                    PaymentMethodWidget(
                      image: bankPng,
                      title: AppLocalizations.of(context)!.netBanking,
                      subTitle: AppLocalizations.of(context)!.allIndiaBanks,
                    ),
                    PaymentMethodWidget(
                      image: upiPng,
                      title: AppLocalizations.of(context)!.upi,
                      subTitle: AppLocalizations.of(context)!
                          .instantPaymentUsingUpiApp,
                    ),
                    height20,
                    CustomButton(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteClass.paymentloadingprogress);
                      },
                      title: AppLocalizations.of(context)!.proceed,
                      border: true,
                    ),
                    height30,
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
