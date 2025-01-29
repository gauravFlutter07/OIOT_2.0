import 'dart:developer';

import '../../../../imports.dart';

class DriverSearchingService {
  List<Map<String, dynamic>?> driverSearchingList = [
    {
      "driverId": "1",
      "driverPhoto":
          "https://media.newyorker.com/photos/5b203f425ee2c7040773fedc/4:3/w_2251,h_1688,c_limit/760209_ra523.jpg",
      "driverName": "John",
      "driverRating": "4.5",
      "driverTimeAway": "4 minutes",
      "vehicleModel": "VW Vento",
      "vehiclePhoto":
          "https://thumbs.dreamstime.com/b/volkswagen-vento-cancun-mexico-may-motor-car-city-street-96410066.jpg",
      "vehicleNumber": "KL109546",
      "discount": "25%",
      "driverCharge": "₹300",
    },
    {
      "driverId": "2",
      "driverPhoto":
          "https://img.freepik.com/premium-photo/indian-cab-driver_599862-8123.jpg",
      "driverName": "Murali",
      "driverRating": "4.8",
      "driverTimeAway": "8 minutes",
      "vehicleModel": "Swift Dzire",
      "vehiclePhoto":
          "https://www.cartoq.com/wp-content/uploads/2018/09/New-Maruti-Dzire-Taxi-Featured.jpg",
      "vehicleNumber": "TN10AB9546",
      "discount": "20%",
      "driverCharge": "₹350",
    },
    {
      "driverId": "3",
      "driverPhoto":
          "https://images.livemint.com/rf/Image-621x414/LiveMint/Period2/2016/11/04/Photos/Processed/cabs2-kPyD--621x414@LiveMint.JPG",
      "driverName": "Abdulla",
      "driverRating": "4.1",
      "driverTimeAway": "14 minutes",
      "vehicleModel": "HM Ambassaror",
      "vehiclePhoto":
          "https://c8.alamy.com/comp/T9MF4M/an-ambassador-cab-taxi-with-passengers-on-board-is-running-on-the-streets-of-kolkata-T9MF4M.jpg",
      "vehicleNumber": "KA815465",
      "discount": "30%",
      "driverCharge": "₹450",
    },
    {
      "driverId": "4",
      "driverPhoto":
          "https://c8.alamy.com/comp/2JN6041/baghwant-singh-silver-top-cab-service-driver-photographed-with-his-cab-in-elizabeth-street-melbourne-2JN6041.jpg",
      "driverName": "Kabir Sing",
      "driverRating": "3.9",
      "driverTimeAway": "10 minutes",
      "vehicleModel": "Honda City",
      "vehiclePhoto":
          "https://5.imimg.com/data5/SELLER/Default/2022/10/GA/AA/RW/161044039/nagpur-to-pune-taxi-service.jpg",
      "vehicleNumber": "KL109546",
      "discount": "15%",
      "driverCharge": "₹240",
    },
    {
      "driverId": "5",
      "driverPhoto":
          "https://prod.betootaadvocate.com/wp-content/uploads/2014/12/Indian-cab-driver.jpg",
      "driverName": "Micheal",
      "driverRating": "4.9",
      "driverTimeAway": "2 minutes",
      "vehicleModel": "Maruthi Ciaz",
      "vehiclePhoto":
          "https://indiarentacar.com/wp-content/uploads/2019/08/Maruti-Ciaz-Front1.jpg",
      "vehicleNumber": "KL109546",
      "discount": "10%",
      "driverCharge": "₹500",
    }
  ];

  String driverListUrl = 'api/driverList';

  Dio dio = Dio();

  Future<List<DriverSearchingModel>?> fetchDriversList() async {
    try {
      // Response response = await dio.get(driverListUrl);
      int statusCode = 200;
      if (statusCode == 200) {
        List<DriverSearchingModel> driverList = driverSearchingList
            .map((driversData) => DriverSearchingModel.fromJson(driversData!))
            .toList();
        return driverList;
      } else {
        throw Exception('Failed to fetch driver list data');
      }
    } catch (e) {
      log('Error fetching driver list data: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> postSelectedDriver({
    required String driverId,
    required String selectedDriverData,
  }) async {
    try {
      int statusCode = 200;

      if (statusCode == 200) {
        Map<String, dynamic> status = {
          'status': true,
          'message': 'Selected driver data sent successfully',
        };
        return status;
      } else {
        throw Exception('Failed to post selected driver data');
      }
    } catch (e) {
      log('Error in posting selected driver data: $e');
      return null;
    }
  }
}
