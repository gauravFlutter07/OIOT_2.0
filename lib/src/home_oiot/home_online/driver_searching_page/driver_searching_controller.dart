import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oiot/src/home_oiot/home_online/driver_searching_page/model/ride_request_success_modal.dart';

import '../../../../api/rider_repo.dart';
import '../../../../imports.dart';
import '../../../../models/basic_fare_modal.dart';
import 'model/searched_driver_list_modal.dart';

class DriverSearchingProvider extends ChangeNotifier {
  DriverSearchingProvider() {
    fetchDriversList();
    startTimer();
  }

  List<DriverSearchingModel> _driverSearchList = [];
  List<DriverSearchingModel> get driverSearchList => _driverSearchList;

  List<Driver>? _drivers;
  List<Driver>? get drivers => _drivers;

  RideRequestSuccessModal? _tripData;
  RideRequestSuccessModal? get tripData => _tripData;

  late Timer _timer;
  int _remainingSeconds = 60;
  bool _showProgress = true;

  int get remainingSeconds => _remainingSeconds;
  bool get showProgress => _showProgress;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _showProgress = false;
          _timer.cancel();
        }
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> fetchDriversList() async {
    DriverSearchingService driverSearchingService = DriverSearchingService();
    List<DriverSearchingModel>? result =
        await driverSearchingService.fetchDriversList();
    _driverSearchList = result!;
    notifyListeners();

  }


  Future<void> postSelectedDriver(context, Driver driverData, VehicleCategory vehicleCategoryModal) async {


  var estId = await getEstimationId(context, driverData,vehicleCategoryModal.id??'-');

  if(estId==null){
    Fluttertoast.showToast(msg: "Sorry, Not able to proceed at this time");
    return;
  }

  var map =  {
    'promo': '',
    'promoAmt': '',
    'tripType': 'daily',
    'tripDate': DateFormat('dd-MM-yyyy').format(DateTime.now()),
    'paymentMode': 'Cash',
    'pickupCity': 'Madurai',
    'requestFrom': 'app',
    'bookingType': 'rideNow',
    'serviceType': driverData.vehicleType,
    'estimationId': estId,
    'tripTime': DateFormat('hh:mm a').format(DateTime.now()),
    'notesToDriver': '',
    'bookingFor': '',
    'otherPh': '',
    'otherPhCode': '',
    'noofseats': "1"
  };



  try {
    final result = await RiderRepo.requestTaxi(map);
    if (result is Exception) {
      Fluttertoast.showToast(msg: "Something went wrong");
    } else {
      if (result != null) {

        RideRequestSuccessModal data = rideRequestSuccessModalFromMap(jsonEncode(result));
        if(data.success==true){
          _tripData = data;
          print('Trip data set: ${_tripData!.requestDetails}');

          notifyListeners();

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  DriverOnWay(tripData: tripData!,),
              )
          );
        }

      } else {
        Fluttertoast.showToast(msg: 'Something went wrong');
      }
    }
  } on Exception catch (e) {
    e.printError();
  }
}


  Future<String?> getEstimationId(BuildContext context, Driver driverData, String serviceTypeId) async {

    final PickupProvider pickupProvider = context.read<PickupProvider>();


    var map =  {
    "serviceType": driverData.vehicleType,
    "time": "",
    "tripType": "daily",
    "pickupLat": pickupProvider.pickUpModel?.pickUpLatLng.latitude,
    "pickupLng": pickupProvider.pickUpModel?.pickUpLatLng.longitude,
    "dropLat": pickupProvider.pickUpModel?.dropLatLng.latitude,
    "dropLng": pickupProvider.pickUpModel?.pickUpLatLng.longitude,
    "serviceTypeId": serviceTypeId,
    "pickupCity": "",
    "bookingType": "rideNow"
  };


    try {
      final result = await RiderRepo.estimationFare(map);

      if (result is Exception) {
        Fluttertoast.showToast(msg: "Something went wrong");
        return null;;
      } else {
        if (result != null) {
          return result['estimationId'];
        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');
          return null;
        }
      }
    } on Exception catch (e) {
      e.printError();
      return null;
    }
}

}
