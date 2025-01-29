import 'package:oiot/imports.dart';

class QrForTripAndScanProvider extends ChangeNotifier {
  bool _isMyCodeTabSelected = true;

  bool get isMyCodeTabSelected => _isMyCodeTabSelected;

  void selectMyCodeTab() {
    _isMyCodeTabSelected = true;
    notifyListeners();
  }

  void selectScanTab() {
    _isMyCodeTabSelected = false;
    notifyListeners();
  }
}
