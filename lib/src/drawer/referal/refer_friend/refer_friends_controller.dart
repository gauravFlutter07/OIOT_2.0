import '../../../../imports.dart';

class ReferFriendsProvider extends ChangeNotifier {
  ReferFriendsProvider() {
    fetchreferralDetails();
  }

  int _selectedButtonDriverorRider = 1;
  int get selectedButtonDriverorRider => _selectedButtonDriverorRider;

  void selectedButtonIndCorpFunction(int button) {
    _selectedButtonDriverorRider = button;
    notifyListeners();
  }

  ReferFriendsModel? referFriendData;
  Future<void> fetchreferralDetails() async {
    ReferFriendServices referCodeData = ReferFriendServices();

    final ReferFriendsModel? result = await referCodeData.fetchReferCodeData();

    if (result != null) {
      referFriendData = result;
      notifyListeners();
    }
  }
}
