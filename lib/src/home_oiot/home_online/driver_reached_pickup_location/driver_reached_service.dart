// import 'package:oiot/src/home_oiot/home_online/driver_reached_pickup_location/model/driver_reached_model.dart';

// import '../../../../imports.dart';

// class DriverReachedPickupLocationServices {
//   Map<String, dynamic> tripOtpData = {
//     "tripOtp": "5420",
//   };

//   String driverOtp = "api/driverOtp";
//   Dio dio = Dio();

//   Future<DriverReachedModel?> fetchTripOtp() async {
//     try {
//       // Response response = await dio.get(driverOtp);
//       int statuscode = 200;
//       if (statuscode == 200) {
//         dynamic result = DriverReachedModel.fromJson(tripOtpData);
//         return result;
//       } else {
//         throw Exception('Failed to fetch trip otp');
//       }
//     } catch (e) {
//       print('Error fetching trip otp data: $e');
//       return null;
//     }
//   }
// }
