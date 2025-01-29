import 'dart:developer';
import '../../../../imports.dart';

class MyProfileService {
  Map<String, dynamic> myProfileData = {
    "photo":
        "https://media.licdn.com/dms/image/v2/D5603AQFvBknMN02XKA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1684950074109?e=1731542400&v=beta&t=ontKjHN66kJfc_2g23rKUYusuo2FbPDvS0lhPzZIu-Y",
    "Name": "Sandeep",
    "Mobile": "+91 8848583025",
    "Age": "34 years",
    "Gender": "Male",
    "Email": "sandeeprko@gmail.com",
    "Location": "Bangalore",
    "State": "Karnataka",
    "City": "Bangalore",
    "Aadhar": "5084 6845 1240",
    "DOB": "09/11/1989",
    "ReferralCode": "OIOT36TF635",
    "userRating": "4.3  Since 2019",
  };

  String getMyProfileUrl = "api/myprofile";
  Dio dio = Dio();

  Future<MyProfileModel?> fetchMyProfile() async {
    try {
      // Response response = await dio.get(getMyProfileUrl);
      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = MyProfileModel.fromJson(myProfileData);
        return result;
      } else {
        throw Exception('Failed to fetch profile data');
      }
    } catch (e) {
      log('Error fetching profile data: $e');
      return null;
    }
  }
}
