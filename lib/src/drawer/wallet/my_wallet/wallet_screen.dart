import 'package:oiot/widgets/app_text_widget.dart';
import '../../../../imports.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        List<WalletDataModel> walletList = provider.walletList;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: leftTopPadding10,
                    child: CustomHeaderWallet(
                      title: AppLocalizations.of(context)!.myWallet,
                    ),
                  ),
                  Container(
                    margin: myWalletPagePadding,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height10,
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkWhiteBackground),
                          child: Padding(
                            padding: leftPadding10,
                            child: Row(
                              children: [
                                customTextWidget(
                                  text:
                                      '${AppLocalizations.of(context)!.totalBalance} -',
                                  size: 18.0,
                                  color: blackColor,
                                  weight: bold,
                                ),
                                width10,
                                customTextWidget(
                                  text: walletList.isNotEmpty
                                      ? walletList[0].totalBalance
                                      : '',
                                  size: 22.0,
                                  color: blueMain,
                                  weight: bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                        height20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomButtonOnlyBorder(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const WalletTransctionHistoryScreen(),
                                    ),
                                  );
                                },
                                title: AppLocalizations.of(context)!
                                    .allTransactions,
                                border: true,
                                optionalTextColor: blackColor,
                              ),
                            ),
                            width20,
                            Expanded(
                              child: CustomTextButton(
                                text: AppLocalizations.of(context)!.addMoney,
                                color: blueMain,
                                callBack: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AddMoneyScreen(),
                                    ),
                                  );
                                },
                                textColor: whiteColor,
                                border: 1.0,
                                borderColor: transperentColor,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        height15,
                        customTextWidget(
                          text: AppLocalizations.of(context)!.payNow,
                          size: 16.0,
                          color: blackColor,
                          weight: bold,
                        ),
                        height05,
                        Padding(
                          padding: topPadding10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              imageWidget(
                                  Image(
                                    image: AssetImage(sendMoney),
                                  ),
                                  AppLocalizations.of(context)!.sendMoney, () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      AppLocalizations.of(context)!.comingSoon,
                                    ),
                                    duration: const Duration(
                                      seconds: 2,
                                    ),
                                  ),
                                );
                              }),
                              imageWidget(
                                Image(
                                  image: AssetImage(
                                    requestMoney,
                                  ),
                                ),
                                AppLocalizations.of(context)!.requestMoney,
                                () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        AppLocalizations.of(context)!
                                            .comingSoon,
                                      ),
                                      duration: const Duration(
                                        seconds: 2,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              imageWidget(
                                Image(
                                  image: AssetImage(
                                    bonusLogo,
                                  ),
                                ),
                                AppLocalizations.of(context)!.bonus,
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const BonusPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: topPadding30,
                          child: textWidget(
                              AppLocalizations.of(context)!.history,
                              pureBlack,
                              bold,
                              16.0,
                              false,
                              null,
                              0.0,
                              0.0,
                              0.0,
                              0.0),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: walletList.length,
                          itemBuilder: (BuildContext context, int index) {
                            WalletDataModel walletData = walletList[index];
                            return Padding(
                              padding: vertPadding10,
                              child: customCard(
                                walletData.walletHistoryId,
                                walletData.walletHistoryAmount,
                                walletData.walletHistoryStatus,
                                '${walletData.walletHistoryDate} | ${walletData.walletHistoryTime}',
                                '${AppLocalizations.of(context)!.purpose} :',
                                walletData.purpose,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
