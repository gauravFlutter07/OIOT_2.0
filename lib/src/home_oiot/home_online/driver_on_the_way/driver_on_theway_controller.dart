import 'dart:developer';
import 'package:get/get.dart';
import 'package:oiot/src/home_oiot/home_online/driver_on_the_way/driver_on_theway_service.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../firebase_api/firebase_trip_flow.dart';
import '../../../../imports.dart';

class DriverOnTheWayProvider extends ChangeNotifier {
  DriverOnTheWayDataModel? _driverOntheawayDetails;
  DriverOnTheWayDataModel? get driverOntheawayDetails =>
      _driverOntheawayDetails;

  DriverOnTheWayProvider() {
    fetchDriverOnTheWayDetails();
  }

  Future<void> fetchDriverOnTheWayDetails() async {
    DriverOnTheWayService driverOnTheWayService = DriverOnTheWayService();

    final result = await driverOnTheWayService.fetchDriverOnTheWay();

    if (result != null) {
      _driverOntheawayDetails = result;
      log(_driverOntheawayDetails!.driverName.toString());
      notifyListeners();
    }
  }

  Future<void> shareFunction() async {
    await Share.share(
      'Thank you for sharing oiot',
    );
  }


}
