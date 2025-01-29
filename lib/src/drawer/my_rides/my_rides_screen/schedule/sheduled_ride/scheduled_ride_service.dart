import 'dart:developer';

import '../../../../../../imports.dart';

class ScheduledRideService {
  List<Map<String, dynamic>?> scheduledRideDatas = [
    {
      "serviceType": "Daily Ride",
      "vehicleType": "Sedan",
      "tripId": "OIOT549R15",
      "tripDate": "23 Aug 2024",
      "tripTime": "02.30 PM",
      "driverName": "Joseph",
      "driverPhoto":
          "https://prod.betootaadvocate.com/wp-content/uploads/2014/12/Indian-cab-driver.jpg",
      "driverRating": "4.3 Since 2020",
      "pickUpLocation": "Jp Nagar, 2nd phase",
      "dropLocation": "Satellite Bus stand",
      "vehicleNumber": "KA87465",
      "vehicleModel": "VW Vento",
      "tripAmount": "₹250.00",
      "driverReachTime": "Reach in 10 minutes",
      "tripKmAway": "6 km away",
      "tripDistance": "12 km",
      "tripDuration": "20 mins",
      "extraKm": "₹30",
      "extraTime": "₹2",
      "baseFare": "5 KM - ₹80",
      "baseTime": "15 mins - free time",
    },
    {
      "serviceType": "Outstation",
      "vehicleType": "SUV",
      "tripId": "OIOT678G21",
      "tripDate": "25 Aug 2024",
      "tripTime": "10.00 AM",
      "driverName": "Dinakar Reddy",
      "driverPhoto":
          "https://media.licdn.com/dms/image/D4D03AQH89FTAvy18AA/profile-displayphoto-shrink_200_200/0/1706285179575?e=2147483647&v=beta&t=TKI_bNSV1ldcrU7ktN1jZtILlzmB47_Wnl9XYMWwFAM",
      "driverRating": "4.8 Since 2019",
      "pickUpLocation": "Indiranagar",
      "dropLocation": "Whitefield",
      "vehicleNumber": "KA12345",
      "vehicleModel": "Toyota Fortuner",
      "tripAmount": "₹450.00",
      "driverReachTime": "Reach in 5 minutes",
      "tripKmAway": "8 km away",
      "tripDistance": "15 km",
      "tripDuration": "30 mins",
      "extraKm": "₹40",
      "extraTime": "₹3",
      "baseFare": "5 KM - ₹80",
      "baseTime": "15 mins - free time",
    },
    {
      "serviceType": "Outstation",
      "vehicleType": "Hatchback",
      "tripId": "OIOT234K56",
      "tripDate": "30 Aug 2024",
      "tripTime": "08.00 AM",
      "driverName": "John",
      "driverPhoto":
          "https://images.livemint.com/rf/Image-621x414/LiveMint/Period2/2016/11/04/Photos/Processed/cabs2-kPyD--621x414@LiveMint.JPG",
      "driverRating": "4.5 Since 2021",
      "pickUpLocation": "MG Road",
      "dropLocation": "Electronic City",
      "vehicleNumber": "KA67890",
      "vehicleModel": "Hyundai i20",
      "tripAmount": "₹350.00",
      "driverReachTime": "Reach in 15 minutes",
      "tripKmAway": "10 km away",
      "tripDistance": "20 km",
      "tripDuration": "40 mins",
      "extraKm": "₹35",
      "extraTime": "₹2.5",
      "baseFare": "5 KM - ₹80",
      "baseTime": "15 mins - free time",
    }
  ];

  final String scheduledTripDetailsUrl = 'api/scheduledTripdetails';

  final Dio dio = Dio();

  Future<List<ScheduledRideModel>?> fetchScheduledTripDetails() async {
    try {
      // Response response = await dio.get(scheduledTripDetailsUrl);

      int statuscode = 200; //
      if (statuscode == 200) {
        dynamic result = scheduledRideDatas;

        log('message :${result.toString()}');
        List<ScheduledRideModel> scheduleTripData = scheduledRideDatas
            .whereType<Map<String, dynamic>>()
            .map((scheduledtrip) => ScheduledRideModel.fromJson(scheduledtrip))
            .toList();
        return scheduleTripData;
      } else {
        throw Exception('Failed to fetch scheduled trip data');
      }
    } catch (e) {
      log('Error fetching scheduled trip data: $e');
      return null;
    }
  }
}
