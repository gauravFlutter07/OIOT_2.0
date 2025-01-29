import '../../../../imports.dart';

class FAQProvider extends ChangeNotifier {
  FAQProvider() {
    fetchFaqDetails();
  }
  List<FaqModel> _faqList = [];
  List<FaqModel> _filteredFaqList = [];

  List<FaqModel> get faqList => _filteredFaqList;

  Future<void> fetchFaqDetails() async {
    FaqServices faqServices = FaqServices();
    List<FaqModel> result = await faqServices.fetchFaqData();
    _faqList = result;
    _filteredFaqList = List.from(_faqList);
    notifyListeners();
  }

  void search(String searchText) {
    if (searchText.isEmpty) {
      _filteredFaqList = List.from(_faqList);
    } else {
      _filteredFaqList = _faqList
          .where((faq) =>
              faq.heading.toLowerCase().contains(searchText.toLowerCase()) ||
              faq.faq.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
