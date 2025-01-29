import 'dart:developer';

import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../../../imports.dart';

class InterestedDriverService {
  List<Map<String, dynamic>> interestedDriverList = [
    {
      "driverName": "Sandeep",
      "mobileNumber": "9845654334",
      "rating": 4.5,
      "price": "₹130",
      "carModel": "VW Polo",
      "drivePhoto":
          "https://media.licdn.com/dms/image/D5603AQFvBknMN02XKA/profile-displayphoto-shrink_800_800/0/1684950074109?e=2147483647&v=beta&t=juqtzPQ5D-Hf6QSluce_yd8BgU5l2IBSPkrhNP_pJQ8",
    },
    {
      "driverName": "Ramesh",
      "mobileNumber": "8884691237",
      "rating": 4.2,
      "price": "₹125",
      "carModel": "Tata Tiago",
      "drivePhoto":
          "https://c8.alamy.com/comp/DXWENP/india-dehradun-driver-of-three-wheeled-taxi-DXWENP.jpg",
    },
    {
      "driverName": "Fayiz",
      "mobileNumber": "9874561234",
      "rating": 4.8,
      "price": "₹135",
      "carModel": "Honda Jazz",
      "drivePhoto":
          "https://media.istockphoto.com/id/469545376/photo/kolkata-taxi-driver.jpg?s=612x612&w=0&k=20&c=iHKQ2fJPsRcFq169yFVk9VUWsrYhTHwBXSlMGhnq5r4=",
    },
    {
      "driverName": "Ansar",
      "mobileNumber": "8645127985",
      "rating": 4.6,
      "price": "₹128",
      "carModel": "Maruthi Swift",
      "drivePhoto":
          "https://images.pond5.com/indian-smiling-taxi-driver-standing-085773462_prevstill.jpeg",
    },
    {
      "driverName": "Junaid",
      "mobileNumber": "9995554321",
      "rating": 4.4,
      "price": "₹132",
      "carModel": "Skoda Fabia",
      "drivePhoto":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBeRSkiqcuMScw99yOpbJMjzBP3QT-o7EZnb7FBF0dQ&s",
    },
  ];

  String interestedDriverUrl = 'api/interestedDriver';

  Dio dio = Dio();

  Future<List<InterestedDriverModel>?> fetchInterestedDriverData() async {
    try {
      // Simulating API call
      int statusCode = 200;
      if (statusCode == 200) {
        List<InterestedDriverModel> interestedDriver = interestedDriverList
            .map((interestedDriverData) =>
                InterestedDriverModel.fromJson(interestedDriverData))
            .toList();
        return interestedDriver;
      } else {
        throw Exception('Failed to fetch interested driver data');
      }
    } catch (e) {
      log('Error fetching interested driver data: $e');
      return [];
    }
  }
}
