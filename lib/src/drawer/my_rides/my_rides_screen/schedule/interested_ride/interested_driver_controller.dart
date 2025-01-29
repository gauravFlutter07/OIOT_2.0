import 'dart:developer';

import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../../../imports.dart';

class InterestedDriverProvider extends ChangeNotifier {
  List<InterestedDriverModel> _interestedDriverList = [];
  List<InterestedDriverModel> get interestedDriverList => _interestedDriverList;

  InterestedDriverProvider() {
    fetchInterestedDriverDetails();
  }

  Future<void> fetchInterestedDriverDetails() async {
    InterestedDriverService interestedDriverService = InterestedDriverService();
    List<InterestedDriverModel>? result =
        await interestedDriverService.fetchInterestedDriverData();
    if (result != null) {
      _interestedDriverList = result;
      notifyListeners();
    } else {
      log('Failed to fetch interested driver data');
    }
  }
}
