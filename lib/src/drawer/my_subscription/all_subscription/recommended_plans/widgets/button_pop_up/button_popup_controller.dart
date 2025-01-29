import '../../../../../../../imports.dart';

class ButtonPopUpProvider extends ChangeNotifier {
  ButtonPopUpProvider() {
    fetchButtonPopUps();
  }
  ButtonPopUpDataModel? buttonPopUpData;

  Future fetchButtonPopUps() async {
    ButtonPopUpService buttonPopUpService = ButtonPopUpService();

    final ButtonPopUpDataModel? result =
        await buttonPopUpService.fetchButtonPopupData();

    if (result != null) {
      buttonPopUpData = result;
      notifyListeners();
    }
  }
}
