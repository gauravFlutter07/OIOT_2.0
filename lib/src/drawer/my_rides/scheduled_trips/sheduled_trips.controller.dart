import '../../../../imports.dart';

class ScheduledTripProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  bool _isclicked = false;

  bool get isclicked => _isclicked;

  Color isClickedFunction() {
    _isclicked = !_isclicked;
    if (_isclicked == true) {
      return textBlack;
    } else {
      return greyColor;
    }
  }

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
