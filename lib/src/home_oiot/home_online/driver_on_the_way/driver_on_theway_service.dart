import 'dart:developer';

import '../../../../imports.dart';

class DriverOnTheWayService {
  Map<String, dynamic> driverOnTheWayData = {
    "driverPhoto":
        "https://media.newyorker.com/photos/5b203f425ee2c7040773fedc/4:3/w_2251,h_1688,c_limit/760209_ra523.jpg",
    "driverName": "John",
    "driverRating": "4.3 Since 2020",
    "driverTime": "10",
    "vehiclePhoto":
        "https://thumbs.dreamstime.com/b/volkswagen-vento-cancun-mexico-may-motor-car-city-street-96410066.jpg",
    "vehicleModel": "VW Vento",
    "vehicleNumber": "KA87465",
    "tripAmount": "₹250.00",
    "pickUpLocation": "Jp Nagar, 2nd phase",
    "dropLocation": "Satellite Bus stand",
    "tripTime": "30 mins",
    "tripDistance": "10 km",
    "tripOtp": "7482",
    "tripId": "OIOT00143",
    "tripStartDate": "10 Aug 2023",
    "tripStartTime": "11.00 AM",
    "tripEndDate": "10 Aug 2023",
    "tripEndTime": "12.00 PM"
  };

  String driverOntheWayUrl = "api/driverOntheWayUrl";
  Dio dio = Dio();

  Future<DriverOnTheWayDataModel?> fetchDriverOnTheWay() async {
    try {
      // Response response = await dio.get(driverOntheWayUrl);
      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = DriverOnTheWayDataModel.fromJson(driverOnTheWayData);
        return result;
      } else {
        throw Exception('Failed to fetch driver on the way data');
      }
    } catch (e) {
      log('Error fetching driver on the way data: $e');
      return null;
    }
  }
}
