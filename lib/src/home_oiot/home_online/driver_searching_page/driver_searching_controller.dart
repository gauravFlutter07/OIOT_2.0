
import 'package:firebase_database/firebase_database.dart';
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
    'pickupCity': '',
    'requestFrom': 'app',
    'bookingType': 'rideNow',
    "driverid": driverData.id,
    'serviceType': driverData.vehicleType,
    'estimationId': estId,
    'tripTime': DateFormat('hh:mm a').format(DateTime.now()),
    'notesToDriver': '',
    'bookingFor': '',
    'otherPh': '',
    'otherPhCode': '',
    'noofseats': "1"
  };

  /*var map2 = {
    "userId": "",
    "phone": "",
    "email": "",
    "fname": "",
    "requestFrom": "app",
    "adminId": "",
    "promo": "",
    "promoAmt": "",
    "tripType": "daily",
    "driverAssignmentType": "auto-assign",
    "driverName": "",
    "driverId": driverData.id,
    "tripTime": DateFormat('hh:mm a').format(DateTime.now()),
    "tripDate": DateFormat('dd-MM-yyyy').format(DateTime.now()),
    "paymentMode": "Cash",
    "pickupCity": "",
    "bookingType": "rideNow",
    "serviceType": vehicleCategoryModal.type,
    "estimationId": estId,
    "hotelId": "",
    "packageId": "",
    "vehicleTypeId": "",
    "pickupLat": "",
    "pickupLng": "",
    "noofseats": 0,
    "pickupAddress": "",
    "outstationType": "",
    "dropLng": "",
    "dropLat": "",
    "acneeded": true,
    "startDay": "",
    "returnDay": ""
  };*/



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
          print('Trip data set: ${_tripData!.tripId}');

          initializeTripFlow(context, _tripData!);

          notifyListeners();



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
        return null;
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

Future<void> initializeTripFlow(context, RideRequestSuccessModal modal) async {
    try {

      final prefs = await SharedPreferences.getInstance();
       String tripId = modal.tripId.toString();

      DatabaseReference ref = FirebaseDatabase.instance.ref();

      // Create database reference
      var tripFlowReference = ref.child('trips_data').child(tripId);

      // Add value event listener
      tripFlowReference.onValue.listen((event) async {
        print("Firebase  ---- Value :-${event.snapshot.value} ");
        if (event.snapshot.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Trip data not found')),
          );
          return;
        }

        try {
          final Map<dynamic, dynamic> data = event.snapshot.value as Map;

          print("Firebase  ---- Firebase  ---- Status :- ${data['status']}");
          // Handle status changes
          final String? status = data['status'];
          if (status != null && status != "0") {
            String tripStatus = ref.child("tripstatus").get().toString();
            if ( tripStatus != "0") {
              tripFlowSwitch(context, status, tripData);
              // _handleTripFlowStatus(context, tripStatus, event.snapshot);
            }
            // Constants.flowStatus = status;
          }

          // Handle driver token
          final String? driverToken = data['driver_token'];
          if (driverToken != null && driverToken != '0') {
            // Constants.driverToken = driverToken;
            print("Firebase  ---- Driver token :- $driverToken");
          }
        } catch (e) {
          debugPrint('Error processing trip data: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error processing trip data: $e')),
          );
        }
      }, onError: (error) {
        debugPrint('Database error: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Database error: $error')),
        );
      });

    } catch (e) {
      debugPrint('Error initializing trip flow: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initializing trip flow: $e')),
      );
    }
  }

  void _handleTripFlowStatus(BuildContext context, String status, DataSnapshot snapshot, ) {
    print("Firebase  ---- Status :- _handleTripFlowStatus $status");
    switch (status) {
      case "Processing":
      // Handle pending status
      
      var requestId = snapshot.child('requestId');
      print("Firebase  ---- requestId :- $requestId");

        break;
      case "No Driver Found":
        print("Firebase  ---- No Driver Found :-");
      // Handle in progress status  `
        break;
      case "Accepted":
        tripFlowSwitch(context, status, snapshot);
        break;
      case "canceled":
      // Handle Cancelled status
        break;
      default:
      // Handle unknown status
        break;
    }
  }

  void tripFlowSwitch(context, String status, tripData) {
    switch (status) {
      case "1":
      // tripTitle.text = 'Your driver is on the way';
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  DriverOnWay(tripData: tripData!,),
            )
        );
        print("Firebase  ---- Your driver is on the way");
        break;

      case "2":
        // tripTitle.text = 'Driver has arrived';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const DriverReachedScreen(),
          ),
        );
        print("Firebase  ---- Driver has arrived");
        break;

      case "3":

        // tripTitle.text = 'Welcome happy ride';
        print("Firebase  ---- Welcome happy ride");
        break;

      case "4":
        // tripTitle.text = 'Your trip has ended';

      print("Firebase  ---- Your trip has ended");
        break;

      case "5":
        print("Firebase  ---- Cancelled");
        break;
    }
  }



}
