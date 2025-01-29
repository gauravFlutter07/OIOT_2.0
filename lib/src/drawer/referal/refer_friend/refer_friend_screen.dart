import '../../../../imports.dart';

class ReferFriendCode extends StatelessWidget {
  const ReferFriendCode({super.key});

  void _showCongratulationsPopup(BuildContext context, int rupees) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const BonusPopup(rupee: 500);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ReferFriendsProvider referFriendsProvider =
        Provider.of<ReferFriendsProvider>(context, listen: false);
    final referFriendsProviderWatch = context.watch<ReferFriendsProvider>();
    return Scaffold(
      body: Padding(
        padding: padding16,
        child: SafeArea(
          child: Consumer<ReferFriendsProvider>(
            builder: (context, provider, child) {
              ReferFriendsModel? referCodeData = provider.referFriendData;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomHeader(
                          title: AppLocalizations.of(context)!.referFriends),
                      Card(
                        color: whiteColor,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ReferHistoryScreen(),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.history,
                            style: tsSmall,
                          ),
                        ),
                      )
                    ],
                  ),
                  height20,
                  Image.asset(
                    referFriend,
                    height: 230,
                    width: 230,
                  ),
                  height30,
                  Text(
                    AppLocalizations.of(context)!.shareFollowingCode,
                    style: tsLargeBold,
                  ),
                  height30,
                  Container(
                    width: double.infinity,
                    padding: vertPadding10,
                    decoration: BoxDecoration(
                      color: greyShade200,
                      borderRadius: circularBorderRadius10,
                    ),
                    child: Padding(
                      padding: horizontalPadding100,
                      child: Center(
                        child: Text(
                          referCodeData?.code ?? '',
                          style: tsExtraLargeBoldLetterSpace5,
                        ),
                      ),
                    ),
                  ),
                  height20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: RadioListTile<int>(
                          title: Text(
                            AppLocalizations.of(context)!.driver,
                            style: tsRegularBold,
                          ),
                          value: 1,
                          activeColor: blackColor,
                          groupValue: referFriendsProviderWatch
                              .selectedButtonDriverorRider,
                          onChanged: (value) {
                            referFriendsProvider
                                .selectedButtonIndCorpFunction(value!);
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<int>(
                          title: Text(
                            AppLocalizations.of(context)!.rider,
                            style: tsRegularBold,
                          ),
                          value: 2,
                          activeColor: blackColor,
                          groupValue: referFriendsProviderWatch
                              .selectedButtonDriverorRider,
                          onChanged: (value) {
                            referFriendsProvider
                                .selectedButtonIndCorpFunction(value!);
                          },
                        ),
                      ),
                    ],
                  ),
                  height25,
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InviteFriendsPage(
                            user: referFriendsProvider
                                        .selectedButtonDriverorRider ==
                                    1
                                ? AppLocalizations.of(context)!.driver
                                : AppLocalizations.of(context)!.rider,
                          ),
                        ),
                      ).then(
                        (result) {
                          if (result != null && result is bool && result) {
                            _showCongratulationsPopup(context, 50);
                          }
                        },
                      );
                    },
                    title: AppLocalizations.of(context)!.next,
                    border: true,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
