// import 'package:oiot/src/home_oiot/home_online/driver_reached_pickup_location/driver_reached_service.dart';
// import 'package:oiot/src/home_oiot/home_online/driver_reached_pickup_location/model/driver_reached_model.dart';

// import '../../../../imports.dart';

// class DriverReachedProvider extends ChangeNotifier {
//   DriverReachedProvider() {
//     fetchTripOtpDetails();
//   }

//   DriverReachedModel? _tripOtp;
//   DriverReachedModel? get tripOtp => _tripOtp;

//   Future<void> fetchTripOtpDetails() async {
//     DriverReachedPickupLocationServices tripOtpData =
//         DriverReachedPickupLocationServices();

//     final result = await tripOtpData.fetchTripOtp();

//     if (result != null) {
//       _tripOtp = result;
//     }
//   }

//   Future<void> shareFunction() async {
//     await FlutterShare.share(
//       title: 'Share via',
//       text: 'Thank you for sharing oiot',
//       chooserTitle: 'Share via',
//     );
//   }
// }
