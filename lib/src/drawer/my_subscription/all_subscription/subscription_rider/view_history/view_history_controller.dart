import '../../../../../../imports.dart';

class ViewHistoryProvider extends ChangeNotifier {
  ViewHistoryProvider() {
    fetchViewHistory();
  }

  TabController? _tabController;
  int _currentIndex = 0;
  Color myPlanColor = mainGreen;
  Color viewHistory = darkBlack;

  int get currentIndex => _currentIndex;
  TabController? get tabController => _tabController;

  void setTabIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  double calculatePercentage(int remainingDays, int totalDays) {
    double percentage = (remainingDays / totalDays * 100) / 100;
    return percentage;
  }

  // ------------------------------------
  ViewHistoryModel? viewHistoryData;

  Future fetchViewHistory() async {
    ViewHistoryService viewHistoryService = ViewHistoryService();

    final ViewHistoryModel? result =
        await viewHistoryService.fetchViewHistoryData();

    if (result != null) {
      viewHistoryData = result;
      notifyListeners();
    }
  }
}
