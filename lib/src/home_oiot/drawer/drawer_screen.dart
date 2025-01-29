import 'package:oiot/models/user_profile_modal.dart';
import 'package:oiot/src/drawer/business_contact/phone_contacts/business_contact_screen.dart';
import 'package:oiot/src/drawer/community/community_page_screen.dart';
import 'package:oiot/src/drawer/helpcentre_or_contactus/help_centre_screen.dart';
import 'package:oiot/src/drawer/faq/faqs/faq_screen.dart';
import 'package:oiot/src/drawer/legal/legal_screen.dart';
import 'package:oiot/widgets/navbar_container.dart';
import 'package:oiot/widgets/navbar_title.dart';
import 'package:oiot/widgets/small_text_button.dart';
import '../../../imports.dart';
import '../../../widgets/material_alert_dialog.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyProfileProvider myProfileProvider =
        Provider.of<MyProfileProvider>(context, listen: false);
    UserProfileModal? myProfile = myProfileProvider.myProfileDetails;

    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: menuPadding,
          child: Padding(
            padding: padding12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavbarContainer(
                  callBack: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyProfile(),
                      ),
                    );
                  },
                  leadWidget: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Consumer<MyProfileProvider>(
                            builder: (BuildContext context, provider,
                                Widget? child) {
                              UserProfileModal? myProfile =
                                  provider.myProfileDetails;
                              double profileCompletion =
                                  provider.profileCompletion;

                              return CircularPercentIndicator(
                                center: SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: (myProfile?.profileurl ?? '').isEmpty
                                      ? Align(
                                          alignment: Alignment.center,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                avatar1,
                                                height: 50,
                                                width: 50,
                                              ),
                                            ],
                                          ),
                                        )
                                      : Align(
                                          alignment: Alignment.center,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  myProfile?.profileurl ?? '',
                                                  height: 60,
                                                  width: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                                radius: 26,
                                lineWidth: 6,
                                percent: profileCompletion,
                                progressColor: blueMain,
                                backgroundColor: transperentColor,
                              );
                            },
                          ),
                          Consumer<MyProfileProvider>(
                            builder: (BuildContext context, provider,
                                Widget? child) {
                              double profileCompletion =
                                  provider.profileCompletion;
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: textBlack.withOpacity(0.4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${(profileCompletion * 100).toStringAsFixed(0)} %',
                                      style: tsExtraWhite,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  backgroundColor: backgroundWhite,
                  isBorder: false,
                  subWidget: Text(
                    myProfile?.phone ?? '',
                    style: tsRegular,
                  ),
                  title: myProfile?.fname ?? '',
                ),
                /*InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyWalletScreen(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: transperentColor,
                        borderRadius: circularBorderRadius7,
                        border: Border.all(
                          color: borderGrey,
                        )),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            walletLogo,
                            scale: 3.5,
                          ),
                          width20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.myWallet,
                                style: tsRegularBold,
                              ),
                              const Text('1200'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                height10,
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubscriptionScreen(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: transperentColor,
                        borderRadius: circularBorderRadius7,
                        border: Border.all(
                          color: borderGrey,
                        )),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            oiotlogo,
                            scale: 25,
                          ),
                          width10,
                          width5,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.mySubscription,
                                style: tsRegularBold,
                              ),
                              SmallTextButton(
                                text: AppLocalizations.of(context)!.active,
                                color: greenShare800,
                                textColor: whiteColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
                height7,
                NavbarTile(
                  icon: Icons.share,
                  text: AppLocalizations.of(context)!.referralShare,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReferFriendCode(),
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    NavbarTile(
                      icon: Icons.verified_user,
                      text: AppLocalizations.of(context)!.kyc,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UpdateKyC(),
                          ),
                        );
                      },
                    ),
                    width5,
                    Card(
                      color: greenShade100,
                      child: Padding(
                        padding: padding8,
                        child: Text(AppLocalizations.of(context)!.completed),
                      ),
                    ),
                  ],
                ),
                NavbarTile(
                  icon: Icons.business,
                  text: AppLocalizations.of(context)!.businessContacts,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BusinessContacts(),
                      ),
                    );
                  },
                ),
                NavbarTile(
                  icon: Icons.directions_car,
                  text: AppLocalizations.of(context)!.myRides,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyRidesScreen(),
                      ),
                    );
                  },
                ),
                NavbarTile(
                  icon: Icons.favorite,
                  text: AppLocalizations.of(context)!.myFavourites,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavouriteScreen(),
                      ),
                    );
                  },
                ),
                NavbarTile(
                  icon: Icons.emergency,
                  text: AppLocalizations.of(context)!.sos,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SosPage(),
                      ),
                    );
                  },
                ),
                NavbarTile(
                  icon: Icons.assessment,
                  text: AppLocalizations.of(context)!.performanceReport,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReportScreenOne(),
                      ),
                    );
                  },
                ),
                NavbarTile(
                  icon: Icons.settings,
                  text: AppLocalizations.of(context)!.settings,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
                NavbarTile(
                  icon: Icons.question_mark,
                  text: AppLocalizations.of(context)!.faq,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FAQsPage(),
                      ),
                    );
                  },
                ),
                NavbarTile(
                  icon: Icons.contact_support,
                  text: AppLocalizations.of(context)!.helpCenterContactUs,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactUsPage(),
                      ),
                    );
                  },
                ),
                NavbarTile(
                  icon: Icons.gavel,
                  text: AppLocalizations.of(context)!.legal,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LegalPage(),
                      ),
                    );
                  },
                ),
                NavbarTile(
                  icon: Icons.people,
                  text: AppLocalizations.of(context)!.community,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CommunityPage(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: textGrey,
                        size: 28,
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, value, child) => TextButton(
                          onPressed: () {
                            value.mobileController.clear();

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const MaterialAlertDialog();
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.logout,
                                style: tsRegularBold,
                              ),
                              width5,
                              Text(
                                '(${AppLocalizations.of(context)!.version}: 1.0.2)',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
