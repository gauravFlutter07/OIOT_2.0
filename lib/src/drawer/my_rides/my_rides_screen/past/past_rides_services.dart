import 'dart:developer';
import '../../../../../imports.dart';

class PastTripServices {
  List<Map<String, dynamic>> pastTripDetails = [
    {
      "tripId": "OIOT00143",
      "serviceType": "Daily Ride",
      "vehicleType": "Sedan",
      "driverPhoto":
          "https://media.newyorker.com/photos/5b203f425ee2c7040773fedc/4:3/w_2251,h_1688,c_limit/760209_ra523.jpg",
      "driverName": "John",
      "vehicleNumber": "KA87465",
      "vehicleModel": "VW Vento",
      "tripAmount": "₹250.00",
      "tripDate": "10 Aug 2023",
      "tripTime": "12.00 PM",
      "tripStatus": "Cash Received",
      "tripCancelledReason": "",
      "pickUpLocation": "Jp Nagar, 2nd phase",
      "dropLocation": "Satellite Bus stand",
      "convenientCharges": "₹200",
      "discount": "₹50",
      "gst": "₹10",
      "sgst": "₹10",
    },
    {
      "tripId": "OIOT007845",
      "serviceType": "Outstation",
      "vehicleType": "SUV",
      "driverPhoto":
          "https://prod.betootaadvocate.com/wp-content/uploads/2014/12/Indian-cab-driver.jpg",
      "driverName": "David",
      "vehicleNumber": "TN4589",
      "vehicleModel": "Toyota Fortuner",
      "tripAmount": "₹500.00",
      "tripDate": "11 Mar 2023",
      "tripTime": "10.00 AM",
      "tripStatus": "Trip Cancelled",
      "tripCancelledReason": "Driver unavailable",
      "pickUpLocation": "Jay Nagar",
      "dropLocation": "Nandihills",
      "convenientCharges": "₹400",
      "discount": "₹100",
      "gst": "₹10",
      "sgst": "₹10",
    },
    {
      "tripId": "OIOT007845",
      "serviceType": "Outstation",
      "vehicleType": "SUV",
      "driverPhoto":
          "https://prod.betootaadvocate.com/wp-content/uploads/2014/12/Indian-cab-driver.jpg",
      "driverName": "David",
      "vehicleNumber": "TN4589",
      "vehicleModel": "Toyota Fortuner",
      "tripAmount": "₹500.00",
      "tripDate": "11 Mar 2023",
      "tripTime": "10.00 AM",
      "tripStatus": "Trip Cancelled",
      "tripCancelledReason": "Driver unavailable",
      "pickUpLocation": "Jay Nagar",
      "dropLocation": "Nandihills",
      "convenientCharges": "₹400",
      "discount": "₹100",
      "gst": "₹10",
      "sgst": "₹10",
    },
    {
      "tripId": "OIOT001451",
      "serviceType": "Rental",
      "vehicleType": "Hatchback",
      "driverPhoto":
          "https://images.livemint.com/rf/Image-621x414/LiveMint/Period2/2016/11/04/Photos/Processed/cabs2-kPyD--621x414@LiveMint.JPG",
      "driverName": "Hameed",
      "vehicleNumber": "KA46598",
      "vehicleModel": "Toyota Etios Liva",
      "tripAmount": "₹350.00",
      "tripDate": "30 Aug 2023",
      "tripTime": "08.00 AM",
      "tripStatus": "Trip Cancelled",
      "tripCancelledReason": "Due to rain",
      "pickUpLocation": "MG Road",
      "dropLocation": "Madiwala",
      "convenientCharges": "₹300",
      "discount": "₹50",
      "gst": "₹10",
      "sgst": "₹10",
    },
    {
      "tripId": "OIOT007845",
      "serviceType": "Outstation",
      "vehicleType": "SUV",
      "driverPhoto":
      "https://prod.betootaadvocate.com/wp-content/uploads/2014/12/Indian-cab-driver.jpg",
      "driverName": "David",
      "vehicleNumber": "TN4589",
      "vehicleModel": "Toyota Fortuner",
      "tripAmount": "₹500.00",
      "tripDate": "11 Mar 2023",
      "tripTime": "10.00 AM",
      "tripStatus": "Trip Cancelled",
      "tripCancelledReason": "Driver unavailable",
      "pickUpLocation": "Jay Nagar",
      "dropLocation": "Nandihills",
      "convenientCharges": "₹400",
      "discount": "₹100",
      "gst": "₹10",
      "sgst": "₹10",
    },{
      "tripId": "OIOT007845",
      "serviceType": "Outstation",
      "vehicleType": "SUV",
      "driverPhoto":
      "https://prod.betootaadvocate.com/wp-content/uploads/2014/12/Indian-cab-driver.jpg",
      "driverName": "David",
      "vehicleNumber": "TN4589",
      "vehicleModel": "Toyota Fortuner",
      "tripAmount": "₹500.00",
      "tripDate": "11 Mar 2023",
      "tripTime": "10.00 AM",
      "tripStatus": "Trip Cancelled",
      "tripCancelledReason": "Driver unavailable",
      "pickUpLocation": "Jay Nagar",
      "dropLocation": "Nandihills",
      "convenientCharges": "₹400",
      "discount": "₹100",
      "gst": "₹10",
      "sgst": "₹10",
    }
  ];

  String pastTripDetailsUrl = 'api/pastTripdetails';

  Dio dio = Dio();

  Future<List<PastTripModel>?> fetchPastTripDetails() async {
    try {
      // Response response = await dio.get(pastTripDetailsUrl);

      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = pastTripDetails;

        log('message r :${result.toString()}');
        List<PastTripModel> pastTripData = pastTripDetails
            .map((pasttrip) => PastTripModel.fromJson(pasttrip))
            .toList();
        return pastTripData;
      } else {
        throw Exception('Failed to fetch past trip data');
      }
    } catch (e) {
      log('Error fetching past trip data: $e');
      return null;
    }
  }
}
