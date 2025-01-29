import '../../../../imports.dart';

class TermsAndServicesProvider extends ChangeNotifier {
  TermsAndConditionsModel? termsAndConditionsModel;

  TermsAndServicesProvider() {
    fetchTermsAndConditions();
  }

  Future<void> fetchTermsAndConditions() async {
    TermsAndConditionsService termsAndConditionsService =
        TermsAndConditionsService();

    final TermsAndConditionsModel? result =
        await termsAndConditionsService.fetchTermsAndConditions();

    if (result != null) {
      termsAndConditionsModel = result;
      notifyListeners();
    }
  }
}
