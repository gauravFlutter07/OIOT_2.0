import '../../../../imports.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding8,
          child: Column(
            children: [
              CustomHeader(
                title: AppLocalizations.of(context)!.bonus,
              ),
              Container(
                margin: padding12,
                child: Column(
                  children: [
                    Padding(
                      padding: vertPadding20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          imageWidget(
                            Image(
                              image: AssetImage(
                                welcomeBonus,
                              ),
                            ),
                            AppLocalizations.of(context)!.welcomeBonus,
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const WelcomeBonusScreen(),
                                ),
                              );
                            },
                          ),
                          imageWidget(
                              Image(
                                image: AssetImage(
                                  referralBonus,
                                ),
                              ),
                              AppLocalizations.of(context)!.referralBonus, () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReferralBonusPage(),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                    Padding(
                      padding: vertPadding20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          imageWidget(
                              Image(
                                image: AssetImage(
                                  couponBonus,
                                ),
                              ),
                              AppLocalizations.of(context)!.couponBonus, () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CouponBonusScreen(),
                              ),
                            );
                          }),
                          imageWidget(
                            Image(
                              image: AssetImage(
                                subscriptionBonus,
                              ),
                            ),
                            AppLocalizations.of(context)!.subscriptionBonus,
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SubscriptionBonusScreen(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: vertPadding20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          imageWidget(
                            Image(
                              image: AssetImage(
                                walletBonusImg,
                              ),
                            ),
                            AppLocalizations.of(context)!.walletBonus,
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const WalletBonusScreen(),
                                ),
                              );
                            },
                          ),
                          imageWidget(
                            Image(
                              image: AssetImage(
                                performanceBonus,
                              ),
                            ),
                            AppLocalizations.of(context)!.performanceBonus,
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PerformanceBonusScreen(),
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
            ],
          ),
        ),
      ),
    );
  }
}
