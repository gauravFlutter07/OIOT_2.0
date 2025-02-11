import 'dart:developer';

import 'package:oiot/api/rider_repo.dart';
import 'package:oiot/src/drawer/legal/model/legal_model.dart';

import '../../../../imports.dart';

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

class PrivacyPolicyProvider extends ChangeNotifier {
  PrivacyPolicyModel? privacyPolicyModel;

  LegalModel? legalModel; //added var

  bool isLoading = false; //added var
  List<LegalModel> _privacyPolicy = []; //added var
  List<LegalModel> get privacyPolicy => _privacyPolicy; //added var
  String? privacyPolicyTerms; //added var

  PrivacyPolicyProvider() {
    fetchPrivacyPolicyData();
    fetchPrivacyPolicy();
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

  //to convert Html to String
  String extractTextFromHtml(String html) {
    // Parse the HTML content
    dom.Document document = parse(html);

    // Extract the plain text (ignores tags and returns only text)
    String text = document.body?.text ?? '';
    return text;
  }

  Future<void> fetchPrivacyPolicy() async {
    try {
      final result = await RiderRepo.fetchLegalData(null);

      if (result != null && result != null) {
        _privacyPolicy =
            (result as List).map((item) => LegalModel.fromJson(item)).toList();

        notifyListeners();
      } else {
        log('Failed to fetch  privacy policy data: privacy policy is null');
      }
    } catch (e) {
      log("Error fetching privacy Policy: $e");
    }
  }
}
