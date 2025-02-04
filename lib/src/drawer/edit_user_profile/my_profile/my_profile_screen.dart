import 'package:oiot/models/user_profile_modal.dart';

import '../../../../imports.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<MyProfileProvider>(builder: (context, provider, child) {
          UserProfileModal? myProfile = provider.myProfileDetails;
          if (myProfile == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          double profileCompletion = provider.profileCompletion;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              height10,
              const Padding(
                padding: horizontalPadding12,
                child: CustomMyProfileHeader(),
              ),
              height20,
              Consumer<EditProfileProvider>(
                builder:
                    (BuildContext context, editprofileprovider, Widget? child) {
                  return CircularPercentIndicator(
                    center: SizedBox(
                      width: 120,
                      height: 120,
                      child: myProfile.profileurl==null
                          ? Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    avatar1,
                                    height: 160,
                                    width: 160,
                                  ),
                                ],
                              ),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 160,
                                    width: 160,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        myProfile.profileurl!,
                                        height: 160,
                                        width: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    radius: 64,
                    lineWidth: 6,
                    percent: profileCompletion,
                    progressColor: blueMain,
                    backgroundColor: transperentColor,
                  );
                },
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.hello,
                    style: tsLargeBold,
                  ),
                  Text(
                    myProfile.fname ?? AppLocalizations.of(context)!.empty,
                    style: tsLargeBold,
                  ),
                ],
              ),
              height10,
              Text(
                '${myProfile.phone!.isEmpty ? AppLocalizations.of(context)!.empty : myProfile.phone} | ${myProfile.balance!=0 ? AppLocalizations.of(context)!.empty : myProfile.balance!} | ${myProfile.gender =="" ? AppLocalizations.of(context)!.empty : myProfile.gender}',
                style: tsRegularBoldGrey,
              ),
              height05,
              Expanded(
                child: Card(
                  color: whiteColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: radiusCircular15,
                      topRight: radiusCircular15,
                    ),
                  ),
                  child: Padding(
                    padding: padding16,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.email,
                                style: tsRegularBoldGrey,
                              ),
                              Text(
                                myProfile.email?.isEmpty??false
                                    ? AppLocalizations.of(context)!.empty
                                    : myProfile.email!,
                                style: tsRegularBold,
                              ),
                            ],
                          ),
                          height15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.location,
                                  style: tsRegularBoldGrey),
                              Text(
                                myProfile.address?.firstOrNull?["address"] ?? AppLocalizations.of(context)!.empty,
                                style: tsRegularBold,
                              ),
                            ],
                          ),
                          height15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.state,
                                style: tsRegularBoldGrey,
                              ),
                              Text(
                                myProfile.state?.isEmpty??false
                                    ? AppLocalizations.of(context)!.empty
                                    : myProfile.statename!,
                                style: tsRegularBold,
                              ),
                            ],
                          ),
                          height15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.city,
                                style: tsRegularBoldGrey,
                              ),
                              Text(
                                myProfile.city?.isEmpty??false
                                    ? AppLocalizations.of(context)!.empty
                                    : myProfile.cityname!,
                                style: tsRegularBold,
                              ),
                            ],
                          ),
                          height15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.aadhaar,
                                style: tsRegularBoldGrey,
                              ),
                              Text("-"
                                /*myProfile.aadhar.isEmpty
                                    ? AppLocalizations.of(context)!.empty
                                    : myProfile.aadhar,*/,
                                style: tsRegularBold,
                              ),
                            ],
                          ),
                          height15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.dateOfBirth,
                                style: tsRegularBoldGrey,
                              ),
                              Text("-"
                                /*myProfile.dateOfBirth.isEmpty
                                    ? AppLocalizations.of(context)!.empty
                                    : myProfile.dateOfBirth*/,
                                style: tsRegularBold,
                              ),
                            ],
                          ),
                          height05,
                          const Divider(),
                          Align(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: circularBorderRadius7,
                                color: greyShade200,
                              ),
                              child: Padding(
                                padding: symmetricpadding20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .yourReferralCode,
                                      style: tsRegular,
                                    ),
                                    height05,
                                    const ReferralCodeBox(),
                                    height15,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
