import 'package:share_plus/share_plus.dart';

import '../../../../imports.dart';

class InviteFriendsProvider extends ChangeNotifier {
  Future<void> shareFunction(String referralCode) async {
    String text =
        'Thank you for sharing oiot. Your referral code is: $referralCode \nDownload OIOT app now: https://play.google.com/store/apps/details?id=com.oiot.app';
    await Share.share(

       text,

    );
  }
}
