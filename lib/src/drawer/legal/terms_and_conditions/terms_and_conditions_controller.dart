import 'dart:developer';

import 'package:oiot/api/rider_repo.dart';
import 'package:oiot/src/drawer/legal/model/legal_model.dart';

import '../../../../imports.dart';

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

class TermsAndServicesProvider extends ChangeNotifier {
  TermsAndConditionsModel? termsAndConditionsModel;
  LegalModel? legalModel; //added var

  bool isLoading = false; //added var
  List<LegalModel> _tcData = []; //added var
  List<LegalModel> get tcData => _tcData; //added var
  String? termsAndConditions; //added var

  TermsAndServicesProvider() {
    fetchTermsAndConditions();
    fetchtermsAndConditionsData();
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

  //method to  convert html response to string
  String extractTextFromHtml(String html) {
    // Parse the HTML content
    dom.Document document = parse(html);

    // Extract the plain text (ignores tags and returns only text)
    String text = document.body?.text ?? '';
    return text;
  }

  // method to get terms and conditions
  Future<void> fetchtermsAndConditionsData() async {
    try {
      isLoading = true;
      notifyListeners();
      final result = await RiderRepo.fetchLegalData(null);

      if (result != null && result != null) {
        _tcData =
            (result as List).map((item) => LegalModel.fromJson(item)).toList();
        isLoading = false;
        notifyListeners();
      } else {
        log('Failed to fetch terms and conditions data: terms and conditions are null');
      }
    } catch (e) {
      log("Error fetching terms and conditions: $e");
      isLoading = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
