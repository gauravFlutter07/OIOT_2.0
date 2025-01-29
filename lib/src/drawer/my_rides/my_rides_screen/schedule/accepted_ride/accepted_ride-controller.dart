// ignore_for_file: file_names

import 'dart:developer';

import 'package:get/get.dart';
import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../../../api/rider_repo.dart';
import '../../../../../../imports.dart';
import '../../past/model/my_rides_modal.dart';

class AcceptedRidePovider extends ChangeNotifier {
  AcceptedRideModel? _acceptedRideDetails;
  AcceptedRideModel? get acceptedRideDetails => _acceptedRideDetails;

  AcceptedRidePovider() {
    fetchDriverOnTheWayDetails();
  }

  Future<void> fetchDriverOnTheWayDetails() async {
    AcceptedRideServices acceptedRideServices = AcceptedRideServices();

    final result = await acceptedRideServices.fetchAcceptedRideData();

    if (result != null) {
      _acceptedRideDetails = result;
      log(_acceptedRideDetails!.driverName.toString());
      notifyListeners();
    }
  }

  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Thank you for sharing oiot',
      chooserTitle: 'Share via',
    );
  }
}
