import '../../../../imports.dart';

class AboutUsProvider extends ChangeNotifier {
  AboutUsDataModel? aboutUsDataModel;

  AboutUsProvider() {
    fetchAboutUsData();
  }

  Future<void> fetchAboutUsData() async {
    AboutUsService aboutUsService = AboutUsService();

    final AboutUsDataModel? result = await aboutUsService.fetchAboutUsDetails();

    if (result != null) {
      aboutUsDataModel = result;
      notifyListeners();
    }
  }
}
