import '../../../../../imports.dart';

class SubscriptionProvider extends ChangeNotifier {
  final List<SubscriptionModel> _validSubscription = [];
  List<SubscriptionModel> get validSubscription => _validSubscription;

  final List<SubscriptionModel> _noVvalidSubscription = [];
  List<SubscriptionModel> get noVvalidSubscription => _noVvalidSubscription;

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

  // void filterValidSubscriptions() {
  //   _validSubscription = subscriptionModelList
  //       .where((subscription) => subscription.remainingDays >= 1)
  //       .toList();
  //   log('list subscription: ${subscriptionModelList.toString()}');

  //   notifyListeners();
  // }

  // void filterNotValidSubscriptions() {
  //   _noVvalidSubscription = subscriptionModelList
  //       .where((subscription) => subscription.remainingDays < 1)
  //       .toList();

  //   notifyListeners();
  // }

  double calculatePercentage(int remainingDays, int totalDays) {
    double percentage = (remainingDays / totalDays * 100) / 100;
    return percentage;
  }
}
