
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oiot/main.dart';
import 'package:oiot/src/home_oiot/home_online/driver_searching_page/model/ride_request_success_modal.dart';

import '../../../../api/rider_repo.dart';
import '../../../../imports.dart';
import '../../../../models/basic_fare_modal.dart';
import '../../../../models/selected_ride_modal.dart';
import '../service_type/widgets/trip_completed.dart';
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

  final PickupProvider pickupProvider = Provider.of<PickupProvider>(context, listen: false);


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

          if(_tripData?.tripId!=null){
            localStorageService.setTripId(_tripData?.tripId!);


            pickupProvider.selectedDriver = driverData;

            initializeTripFlow(context!);

            notifyListeners();
            } else {
              Fluttertoast.showToast(msg: 'Something went wrong');
            }
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
          pickupProvider.estimatedModal = selectedRIdeDetailsModalFromJson(jsonEncode(result));
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

Future<void> initializeTripFlow(context) async {
    try {


      DatabaseReference ref = FirebaseDatabase.instance.ref();

      // Create database reference



      var userId = Utils().getDecodedToken()["id"];
      print("Firebase  ----userId $userId");

      var tripFlowReference = ref.child('riders_data').child(userId);

      // Add value event listener
      tripFlowReference.onValue.listen((event) async {
        print("Firebase  ---- current trip id :-${event.snapshot.value} ");
        if (event.snapshot.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Trip ID reference is null')),
          );
          return;
        }


        var tripStatus = event.snapshot.child('tripstatus').value.toString();
        if(!GetUtils.isNullOrBlank(tripStatus)! && tripStatus!="0"){
          _handleTripFlowStatus(context, tripStatus, event.snapshot);
        }

        /*atabaseReference ref2 = FirebaseDatabase.instance.ref();

        var tripIdRef = ref2.child('trips_data').child(tripId);
        print("ID ref :- $tripIdRef");


        tripIdRef.onValue.listen((tripData){
          if (tripData.snapshot.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Trip ID reference is null')),
          );
          return;
        }


          try {
            final Map<dynamic, dynamic> data = tripData.snapshot.value as Map;

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

        });

  */

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

        print("Firebase  ---- _handleTripFlowStatus Processing");
        break;
      case "No Driver Found":
        print("Firebase  ---- _handleTripFlowStatus No Driver Found :-");
      // Handle in progress status  `
        break;
      case "Accepted":
        print("Firebase  ---- _handleTripFlowStatus Accepted:-");

        print("Trip id == ${_tripData!.tripId!.toString()}");
        var ref = FirebaseDatabase.instance.ref().child("trips_data").child(_tripData!.tripId!.toString());

        ref.onValue.listen((onData){
          final Map<dynamic, dynamic> data = onData.snapshot.value as Map;
          tripFlowSwitch(context, data['status'],);
        });

        print("Firebase  ---- _handleTripFlowStatus Your driver is on the way");
        break;

        break;
      case "canceled":
        print("Firebase  ---- _handleTripFlowStatus canceled");

        // Handle Cancelled status
        break;
      default:
        print("Firebase  ---- _handleTripFlowStatus default $status");
      // Handle unknown status
        break;
    }
  }

  void tripFlowSwitch(
    context,
    String status,
  ) {
    switch (status) {
      case "1":
        // tripTitle.text = 'Your driver is on the way';
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DriverOnWay(
                tripData: tripData!,
              ),
            ));
        print("Firebase  ---- Your driver is on the way");
        break;

      case "2":
        // tripTitle.text = 'Driver has arrived';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DriverReachedScreen(
              tripData: tripData!,
            ),
          ),
        );
        print("Firebase  ---- Driver has arrived");
        break;

      case "3":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TripID(),
          ),
        );
        // tripTitle.text = 'Welcome happy ride';
        print("Firebase  ---- Welcome happy ride");
        break;

      case "4":
        // tripTitle.text = 'Your trip has ended';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TripCompleted(),
          ),
        );
        print("Firebase  ---- Your trip has ended");
        break;

      case "5":
        print("Firebase  ---- Cancelled");
        break;
    }
  }
}
