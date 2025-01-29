import '../../../../imports.dart';

class PrivacyPolicyProvider extends ChangeNotifier {
  PrivacyPolicyModel? privacyPolicyModel;

  PrivacyPolicyProvider() {
    fetchPrivacyPolicyData();
  }

  Future<void> fetchPrivacyPolicyData() async {
    PrivacyPolicyService privacyPolicyService = PrivacyPolicyService();

    final PrivacyPolicyModel? result =
        await privacyPolicyService.fetchPrivacyPolicyDetails();

    if (result != null) {
      privacyPolicyModel = result;
      notifyListeners();
    }
  }
}
