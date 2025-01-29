import 'package:get/get.dart';
import 'package:oiot/models/user_profile_modal.dart';

import '../../../../api/rider_repo.dart';
import '../../../../imports.dart';

class MyProfileProvider extends ChangeNotifier {
  UserProfileModal? myProfileDetails;
  double profileCompletion = 0.0;

  MyProfileProvider() {
    fetchMyProfile();
  }

  Future<void> fetchMyProfile() async {

    try {
      final result =  await RiderRepo.fetchProfile(null);

      if (result != null) {
        myProfileDetails = userProfileModalFromMap(jsonEncode(result)).first;
        calculateProfileCompletion();
        notifyListeners();

      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }
    } on Exception catch (e) {
      e.printError();
    }
  }

  void calculateProfileCompletion() {
    if (myProfileDetails == null) return;

    int totalFields = 7;
    int filledFields = 0;

    // if (myProfileDetails!.photo.isNotEmpty) filledFields++;
    if (myProfileDetails!.fname?.isNotEmpty??false) filledFields++;
    if (myProfileDetails!.phone?.isNotEmpty??false) filledFields++;
    // if (myProfileDetails!.age.isNotEmpty) filledFields++;
    if (myProfileDetails!.gender?.isNotEmpty??false) filledFields++;
    if (myProfileDetails!.email?.isNotEmpty??false) filledFields++;
    if (myProfileDetails!.address?.isNotEmpty??false) filledFields++;
    if (myProfileDetails!.state?.isNotEmpty??false) filledFields++;
    if (myProfileDetails!.city?.isNotEmpty??false) filledFields++;
    // if (myProfileDetails!.aadhar.isNotEmpty) filledFields++;
    // if (myProfileDetails!.dateOfBirth.isNotEmpty) filledFields++;

    profileCompletion = filledFields / totalFields;
  }
}
