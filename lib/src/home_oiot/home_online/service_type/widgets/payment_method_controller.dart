import '../../../../../imports.dart';

class PaymentMethodController extends ChangeNotifier {
  late int _selectedContainer = 1;

  int get selectedContainer => _selectedContainer;

  // Method to update selected container
  void updateSelectedContainer(int value) {
    _selectedContainer = value;
    notifyListeners();
  }
}
