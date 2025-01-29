import '../../../../../imports.dart';

class OngoingRiderProvider extends ChangeNotifier {
  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Thank you for sharing oiot',
      chooserTitle: 'Share via',
    );
  }
}
