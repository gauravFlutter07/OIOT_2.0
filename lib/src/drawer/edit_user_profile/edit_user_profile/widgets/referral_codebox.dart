import 'dart:developer';
import 'package:oiot/models/user_profile_modal.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../imports.dart';

class ReferralCodeBox extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ReferralCodeBox({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProfileProvider>(builder: (context, provider, child) {
      UserProfileModal? myProfile = provider.myProfileDetails;

      return Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: radiusCircular7,
            bottomLeft: radiusCircular7,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: leftPadding10,
                child: Text(
                  myProfile != null
                      ? myProfile.referal??""
                      : AppLocalizations.of(context)!.noReferralCode,
                  style: tsRegularBoldGrey,
                ),
              ),
            ),
            SizedBox(
              height: 44,
              child: TextButton.icon(
                onPressed: () async {
                  try {
                    await Share.share(
                      '${AppLocalizations.of(context)!.checkOutthisReferralCode}: ${myProfile?.referal ?? ''}',
                    );
                  } catch (e) {
                    log('Error sharing: $e');
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: blueMain,
                  shape: RoundedRectangleBorder(
                    borderRadius: circularBorderRadius10,
                  ),
                ),
                icon: iconWhiteShare,
                label: Text(
                  AppLocalizations.of(context)!.share,
                  style: tsRegularWhite,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
