import 'dart:developer';

import 'package:oiot/api/rider_repo.dart';
import 'package:oiot/src/drawer/legal/model/legal_model.dart';

import '../../../../imports.dart';

//added below 2 imports
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

class AboutUsProvider extends ChangeNotifier {
  AboutUsDataModel? aboutUsDataModel;

  List<LegalModel> _aboutUs = []; // added
  List<LegalModel> get aboutUs => _aboutUs; //added

  AboutUsProvider() {
    fetchAboutUsData();
    fetchAboutUs();
  }

  Future<void> fetchAboutUsData() async {
    AboutUsService aboutUsService = AboutUsService();

    final AboutUsDataModel? result = await aboutUsService.fetchAboutUsDetails();

    if (result != null) {
      aboutUsDataModel = result;
      notifyListeners();
    }
  }

  // method to convert Html to string
  String extractTextFromHtml(String html) {
    // Parse the HTML content
    dom.Document document = parse(html);

    // Extract the plain text (ignores tags and returns only text)
    String text = document.body?.text ?? '';
    return text;
  }

  //method to get about us
  Future<void> fetchAboutUs() async {
    try {
      final result = await RiderRepo.fetchLegalData(null);

      if (result != null && result != null) {
        _aboutUs =
            (result as List).map((item) => LegalModel.fromJson(item)).toList();

        notifyListeners();
      } else {
        log('Failed to fetch terms and conditions data: terms and conditions are null');
      }
    } catch (e) {
      log("Error fetching terms and conditions: $e");
    }
  }
}
