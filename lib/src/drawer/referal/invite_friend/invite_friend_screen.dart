import '../../../../imports.dart';

class InviteFriendsPage extends StatelessWidget {
  final String user;

  const InviteFriendsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding12,
        child: SafeArea(
          child: Consumer<InviteFriendsProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(
                    title: AppLocalizations.of(context)!.inviteFriends,
                  ),
                  RadioListTile<int>(
                    title: Text(
                      user,
                      style: tsLarge,
                    ),
                    value: 0,
                    groupValue: 0,
                    onChanged: (value) {},
                    activeColor: blackColor,
                  ),
                  height20,
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.ifYouInviteARider,
                      style: tsSmallGrey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  height20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'https://referral.oiot.com/',
                        style: TextStyle(fontSize: 16, color: blueMain),
                      ),
                      width2,
                      Text(
                        'PRSHKMAR',
                        style: tsSmall,
                      ),
                    ],
                  ),
                  height50,
                  Row(
                    children: [
                      width10,
                      Image.asset(
                        googleCommunity,
                        height: 30,
                        width: 30,
                      ),
                      width20,
                      Text(
                        AppLocalizations.of(context)!.google,
                        style: tsMediumBold,
                      ),
                    ],
                  ),
                  height25,
                  Row(
                    children: [
                      width10,
                      Image.asset(
                        facebookCommunity,
                        height: 30,
                        width: 30,
                      ),
                      width20,
                      Text(
                        AppLocalizations.of(context)!.facebook,
                        style: tsMediumBold,
                      ),
                    ],
                  ),
                  height25,
                  Row(
                    children: [
                      width10,
                      Image.asset(
                        whatsappLogo,
                        height: 30,
                        width: 30,
                      ),
                      width20,
                      Text(
                        AppLocalizations.of(context)!.whatsapp,
                        style: tsMediumBold,
                      ),
                    ],
                  ),
                  height25,
                  Row(
                    children: [
                      width10,
                      Image.asset(
                        linkedinCommunity,
                        height: 30,
                        width: 30,
                      ),
                      width20,
                      Text(
                        AppLocalizations.of(context)!.linkedIn,
                        style: tsMediumBold,
                      ),
                    ],
                  ),
                  height25,
                  Row(
                    children: [
                      width10,
                      Image.asset(
                        telegramCommunity,
                        height: 30,
                        width: 30,
                      ),
                      width20,
                      Text(
                        AppLocalizations.of(context)!.telegram,
                        style: tsMediumBold,
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    onTap: () {
                      Navigator.pop(context, false);
                      final referFriendsProvider =
                          Provider.of<ReferFriendsProvider>(context,
                              listen: false);
                      final referralCode =
                          referFriendsProvider.referFriendData?.code ?? '';
                      Provider.of<InviteFriendsProvider>(context, listen: false)
                          .shareFunction(referralCode);
                    },
                    title: AppLocalizations.of(context)!.shareNow,
                    border: true,
                  ),
                  height50,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
