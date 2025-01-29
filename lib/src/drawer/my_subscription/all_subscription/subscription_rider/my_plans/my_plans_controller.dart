import '../../../../../../imports.dart';

class MyPlansProvider extends ChangeNotifier {
  MyPlansProvider() {
    fetchMyPlans();
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

  // --------

  MyPlansModel? myPlansData;

  Future fetchMyPlans() async {
    MyPlansService myPlansService = MyPlansService();

    final MyPlansModel? result = await myPlansService.fetchMyplansData();

    if (result != null) {
      myPlansData = result;
      notifyListeners();
    }
  }
}
