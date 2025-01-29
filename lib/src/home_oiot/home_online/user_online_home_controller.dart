import '../../../imports.dart';

class UserOnlineHomeController extends ChangeNotifier {
  int _currentIndex = 1;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<HomeScreenServiceModel> _onlineHomeData = [];
  List<HomeScreenServiceModel> get onlineHomeData => _onlineHomeData;

  List<CarouselImageModel> _carouselImages = [];
  List<CarouselImageModel> get carouselImages => _carouselImages;

  UserOnlineHomeController() {
    fetchOnlineHomeDetails();
    fetchCarouselImages();
  }

  Future<void> fetchOnlineHomeDetails() async {
    UserOnlineService userOnlineService = UserOnlineService();
    List<HomeScreenServiceModel>? result =
        await userOnlineService.fetchOnlineHomeData();
    _onlineHomeData = result!;
    notifyListeners();
  }

  Future<void> fetchCarouselImages() async {
    UserOnlineService userOnlineService = UserOnlineService();
    List<CarouselImageModel>? result =
        await userOnlineService.fetchCarouselImages();
    _carouselImages = result!;
    notifyListeners();
  }
}
