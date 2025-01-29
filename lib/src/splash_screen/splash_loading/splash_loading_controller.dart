import '../../../imports.dart';

class SplashLoadingProvider extends ChangeNotifier {
  double _progressValue = 0.0;
  double get progressValue => _progressValue;

  void startProgressAnimation(BuildContext context) {
    Timer.periodic(
      const Duration(microseconds: 9000),
      (timer) {
        if (_progressValue > 4.1) {
          timer.cancel();
          Navigator.pushReplacementNamed(
              context, RouteClass.languageSelectScreen);
        } else {
          _progressValue += 0.0001;
          notifyListeners();
        }
      },
    );
  }
}
