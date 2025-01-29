import '../../../../imports.dart';

class InviteFriendsProvider extends ChangeNotifier {
  Future<void> shareFunction(String referralCode) async {
    String text =
        'Thank you for sharing oiot. Your referral code is: $referralCode \nDownload OIOT app now: https://play.google.com/store/apps/details?id=com.oiot.app';
    await FlutterShare.share(
      title: 'Share via',
      text: text,
      chooserTitle: 'Share via',
    );
  }
}
