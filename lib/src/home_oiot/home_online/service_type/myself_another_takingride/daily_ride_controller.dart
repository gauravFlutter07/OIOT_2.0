// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oiot/main.dart';
import '../../../../../imports.dart';
import '../../../../../models/basic_fare_modal.dart';

class DailyRideController extends ChangeNotifier {
  int _selectedOption = 1;
  Contact? _selectedContact;
  bool _isMyself = true;
  String _userId = '';

  int get selectedOption => _selectedOption;
  Contact? get selectedContact => _selectedContact;
  bool get isMyself => _isMyself;
  String get userId => _userId;


  bool _isTravelInsuranceEnabled = false;
  bool get isTravelInsuranceEnabled => _isTravelInsuranceEnabled;

  void toggleSwitch() {
    _isTravelInsuranceEnabled = !_isTravelInsuranceEnabled;
    notifyListeners();
  }

  void updateSelectedOption(int option) {
    _selectedOption = option;
    notifyListeners();
  }

  void updateSelectedContact(Contact? contact) {
    _selectedContact = contact;
    notifyListeners();
  }

  void updateIsMyself(bool value) {
    _isMyself = value;
    notifyListeners();
  }

  void updateUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  Future<void> postDailyRide(BuildContext context, PickUpModel pickupModal, BasicFareModal basicFareModal) async {
    DailyRideService dailyRideService = DailyRideService();

    String contactName =
        _selectedContact != null ? _selectedContact!.displayName : '';
    String contactNumber =
        _selectedContact != null ? _selectedContact!.phones.first.number : '';

    log('Data sent to backend: {isMyself: $_isMyself, selectedContactName: $contactName, selectedContactNumber: $contactNumber, userId: $_userId}');

    final result = await dailyRideService.postDailyrideData(
      isMyself: _isMyself,
      selectedContact: _selectedContact,
      userId: _userId,
    );

    if (result != null && result['status'] == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseARide(pickupModal: pickupModal,basicFareModal: basicFareModal,),
        ),
      );
      Fluttertoast.showToast(msg: '${result['message']}');
    }
  }

  // map

  DateTime? currentBackPressTime;

  bool onBackPressed() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press again to exit',
        backgroundColor: blackColor,
        textColor: whiteColor,
      );
      return false;
    }
    return true;
  }

  LatLng? _latestLocation;
  LatLng? get latestLocation => _latestLocation;

  Timer? _timer;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('riders_data');


  void startLocationUpdates() {
    _timer = Timer.periodic(
        const Duration(seconds: 10), (Timer t) => updateLocation());
  }

  void stopLocationUpdates() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  Future<void> updateLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final latitude = position.latitude.toString();
    final longitude = position.longitude.toString();

    // Update the location in Firebase Realtime Database
   /* await _databaseReference.child(Utils().getDecodedToken()["id"]).set({
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': DateTime.now().toIso8601String(),
    });*/

    notifyListeners();
  }

  @override
  void dispose() {
    _databaseReference.onChildAdded.drain();
    super.dispose();
  }
}
