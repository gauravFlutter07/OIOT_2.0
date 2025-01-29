import '../../../../imports.dart';

class AddMoneyWalletScreen extends StatelessWidget {
  const AddMoneyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomHeader(
                title: AppLocalizations.of(context)!.addMoneyToWallet,
              ),
              Container(
                color: whiteColor,
                margin: horizontalPadding20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height10,
                    const OiotContainerWidget(),
                    height30,
                    Text(
                      AppLocalizations.of(context)!.allPaymentMethod,
                      style: tsRegularBold,
                    ),
                    height15,
                    PaymentMethodWidget(
                      image: cardImage,
                      title: AppLocalizations.of(context)!.card,
                      subTitle:
                          AppLocalizations.of(context)!.visaMasterCardMore,
                    ),
                    height15,
                    PaymentMethodWidget(
                      image: bankPng,
                      title: AppLocalizations.of(context)!.netBanking,
                      subTitle: AppLocalizations.of(context)!.allIndiaBanks,
                    ),
                    height15,
                    PaymentMethodWidget(
                      image: upiPng,
                      title: AppLocalizations.of(context)!.upi,
                      subTitle: AppLocalizations.of(context)!
                          .instantPaymentUsingUpiApp,
                    ),
                    height35,
                    CustomButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PaymentLoadingProgressWallet(),
                          ),
                        );
                      },
                      title: AppLocalizations.of(context)!.proceed,
                      border: true,
                    ),
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
