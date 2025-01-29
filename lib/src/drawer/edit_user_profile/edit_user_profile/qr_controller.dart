import '../../../../imports.dart';

class QrProvider extends ChangeNotifier {
  bool _isclicked = false;

  bool get isclicked => _isclicked;

  Color isClickedFunction() {
    _isclicked = !_isclicked;
    if (_isclicked == true) {
      return textBlack;
    } else {
      return blueMain;
    }
  }
}
