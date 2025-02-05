// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:oiot/api/rider_repo.dart';
import 'package:oiot/models/basic_fare_modal.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/pick_up/add_to_favourites/add_to_favourite_screen.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/pick_up/model/rental_fare_list_modal.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/pick_up/model/rental_package_list_modal.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/rental_estimated_price/rental_estimated_price.dart';
import 'dart:developer';

import '../../../../../api/map_api.dart';
import '../../../../../imports.dart';
import '../../estimated_price/outstation_estimation_screen.dart';
import 'model/outstation_taxi_list_modal.dart';

class PickupProvider extends ChangeNotifier {
  PickupProvider() {
    getCurrentLocation();
  }

  bool _isLoadingCurrentLocation = false; // Initial state
  bool get isLoadingCurrentLocation => _isLoadingCurrentLocation;

  //

  String? _selectedFavorite;
  bool _isFavoriteOptionSelected = false;

  String? get selectedFavorite => _selectedFavorite;
  bool get isFavoriteOptionSelected => _isFavoriteOptionSelected;

  int? _flag;
  int? get flag => _flag;

  PickUpModel? _pickUpModel;
  PickUpModel? get pickUpModel => _pickUpModel;

  late DateTime _selectedStartDate = DateTime.now();
  late TimeOfDay _selectedStartTime = TimeOfDay.now();
  late DateTime _selectedEndDate = DateTime.now();
  late TimeOfDay _selectedEndTime = TimeOfDay.now();

  bool _isRoundTrip = true;
  bool get isRoundTrip => _isRoundTrip;

  RentalPackListModal? _packageModal;
  RentalPackListModal? get packageModal => _packageModal;

  RentalFareListModal? _rentalFareListModal;
  RentalFareListModal? get rentalFareListModal => _rentalFareListModal;

  DateTime get selectedStartDate => _selectedStartDate;
  TimeOfDay get selectedStartTime => _selectedStartTime;
  DateTime get selectedEndDate => _selectedEndDate;
  TimeOfDay get selectedEndTime => _selectedEndTime;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  bool _isclicked = false;

  bool get isclicked => _isclicked;

  String placeId = '';
  String description = '';

  Color isClickedFunction() {
    _isclicked = !_isclicked;
    if (_isclicked == true) {
      return textBlack;
    } else {
      return blueMain;
    }
  }

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void updateStartDate(DateTime date) {
    _selectedStartDate = date;
    notifyListeners();
  }

  void updateStartTime(TimeOfDay time) {
    _selectedStartTime = time;
    notifyListeners();
  }

  void updateEndDate(DateTime date) {
    _selectedEndDate = date;
    notifyListeners();
  }

  void updateEndTime(TimeOfDay time) {
    _selectedEndTime = time;
    notifyListeners();
  }

  void toggleRoundTrip() {
    _isRoundTrip = !_isRoundTrip;
    resetEndDateAndTime();
    notifyListeners();
  }

  void resetEndDateAndTime() {
    if (!_isRoundTrip) {
      _selectedEndDate = _selectedStartDate;
      _selectedEndTime = _selectedStartTime;
    }
    notifyListeners();
  }

  //

  //

  void fetchCurrentLocation() async {
    _isLoadingCurrentLocation = true; // Set loading state
    notifyListeners();

    try {
      await checkPermissionsAndGetLocation();

      if (_currentPosition != null) {
        // Get address from latitude and longitude
        String address = await getAddressFromLatLng(_currentPosition!);
        _currentLocationController.text = address;

        _pickupLatLng =
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude);

        addPickupMarker(_pickupLatLng!);
        moveCameraToPosition(_currentPosition!);

        // Notify listeners to update UI
        notifyListeners();
      }
    } catch (e) {
      log('Error fetching current location: $e');
    } finally {
      _isLoadingCurrentLocation = false; // Reset loading state
      notifyListeners();
    }
  }

  // add to fav bottomsheet

  bool isBottomSheetEnabled = false;
  String selectedLocationDescription = '';

  void enableBottomSheet(String locationDescription) {
    selectedLocationDescription = locationDescription;
    isBottomSheetEnabled = true;
    notifyListeners();
  }

  void disableBottomSheet() {
    isBottomSheetEnabled = false;
    selectedLocationDescription = '';
    notifyListeners();
  }

  void selectFavorite(String option) {
    _selectedFavorite = option;
    _isFavoriteOptionSelected = true;
    notifyListeners();
  }

  void showAddToFavouritesBottomSheet(
      BuildContext context, String locationDescription) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheetContentScreen(
          locationDescription: locationDescription,
          selectFavorite: selectFavorite,
        );
      },
    );
  }

  //
  // FOR FILLING THE CURRENT LOCATION IN TEXTFORMFIELD

  Future<String> getAddressFromLatLng(Position position) async {
    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/geocode/json',
      queryParameters: {
        'latlng': '${position.latitude},${position.longitude}',
        'key': apiKey,
      },
    );

    if (response.statusCode == 200 && response.data['results'].isNotEmpty) {
      return response.data['results'][0]['formatted_address'];
    } else {
      throw 'Failed to get address';
    }
  }

  //

  final TextEditingController _couponController = TextEditingController();
  TextEditingController get couponController => _couponController;
  final List<String> _vehicleTypes = [
    'Hatchback - 4+1',
    'Sedan - 4+1',
    'SUV - 6+1',
    'Luxury - 4+1'
  ];

  final List<String> _packages = [
    '2 hrs-20 KM',
    '4 hrs-40 KM',
    '6 hrs-60 KM',
    '8 hrs-80 KM',
    '12 hrs-100 KM',
  ];
  List<String> get vehicleTypes => _vehicleTypes;
  List<String> get packages => _packages;

  String? _selectedVehicleType;
  PackageDetail? _selectedPackage;
  RentalVehicleModal? _selectedRentalVehicleModal;


  String? get selectedVehicleType => _selectedVehicleType;
  PackageDetail? get selectedPackage => _selectedPackage;
  RentalVehicleModal? get selectedRentalVehicleModal => _selectedRentalVehicleModal;

  void setSelectedVehicleType(RentalVehicleModal? value) {
    _selectedRentalVehicleModal = value;
    notifyListeners();
  }

  void setSelectedPackage(PackageDetail? value) {
    _selectedPackage = value;
    if(value!=null){
      findRentalVehicle();
    }
    notifyListeners();
  }

  //
  final TextEditingController _currentLocationController =
      TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  Position? _currentPosition;
  final Dio _dio = Dio();
  List<dynamic> _currentLocationSuggestions = [];
  List<dynamic> _destinationSuggestions = [];
  bool _isCurrentLocationField = true;
  LatLng? _pickupLatLng;
  LatLng? _destinationLatLng;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  String? _distanceText;
  String? _durationText;
  GoogleMapController? _mapController;
  GoogleMapController? _otherMapController;

  TextEditingController get currentLocationController =>
      _currentLocationController;
  TextEditingController get destinationController => _destinationController;
  Position? get currentPosition => _currentPosition;
  List<dynamic> get currentLocationSuggestions => _currentLocationSuggestions;
  List<dynamic> get destinationSuggestions => _destinationSuggestions;
  bool get isCurrentLocationField => _isCurrentLocationField;
  LatLng? get pickupLatLng => _pickupLatLng;
  LatLng? get destinationLatLng => _destinationLatLng;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polylines => _polylines;
  String? get distanceText => _distanceText;
  String? get durationText => _durationText;
  GoogleMapController? get mapController => _mapController;
  GoogleMapController? get otherMapController => _otherMapController;

  BitmapDescriptor? _pickupIcon;

  final formKey = GlobalKey<FormState>();

  void initMapController(GoogleMapController controller) {
    _mapController = controller;
    if (_currentPosition != null) {
      moveCameraToPosition(_currentPosition!);
    }
  }

  void initOtherMapController(GoogleMapController controller) {
    _otherMapController = controller;
    if (_currentPosition != null) {
      moveCameraToPosition(_currentPosition!);
    }
  }

  Future<void> checkPermissionsAndGetLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied';
    }

    await getCurrentLocation();
  }

  void updateCurrentLocationField(bool newValue) {
    _isCurrentLocationField = newValue;

    clearRentalData();
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _currentPosition = position;
    await moveCameraToPosition(position);
  }

  Future<void> moveCameraToPosition(Position position) async {
    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 18.0,
          ),
        ),
      );
    }
  }

  Future<void> moveOtherCameraToPosition(Position position) async {
    if (_otherMapController != null) {
      _otherMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 18.0,
          ),
        ),
      );
    }
  }

  Future<void> getSuggestions(String query) async {
    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      queryParameters: {
        'input': query,
        'key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      if (_isCurrentLocationField) {
        _currentLocationSuggestions = response.data['predictions'];
      } else {
        _destinationSuggestions = response.data['predictions'];
      }
      notifyListeners();
    } else {
      log('Failed to load suggestions');
    }
  }

  Future<void> searchLocation(String placeId, String description) async {
    placeId  = placeId;
    description = description;

    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/place/details/json',
      queryParameters: {
        'place_id': placeId,
        'key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final location = response.data['result']['geometry']['location'];
      final LatLng latLng = LatLng(location['lat'], location['lng']);

      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 14.0),
        ),
      );

      if(_otherMapController!=null){
        _otherMapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: latLng, zoom: 14.0),
          ),
        );
      }


      if (_isCurrentLocationField) {
        _currentLocationController.text = description;
        _pickupLatLng = latLng;
        _currentLocationSuggestions = [];
        addPickupMarker(latLng);
      } else {
        _destinationController.text = description;
        _destinationLatLng = latLng;
        _destinationSuggestions = [];
        addDestinationMarker(latLng);
        getRoute();
      }
      notifyListeners();
    } else {
      log('4');
    }
  }

  void addPickupMarker(LatLng latLng) {
    _markers.add(
      Marker(
        markerId: const MarkerId('pickup'),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
  }

  void addDestinationMarker(LatLng latLng) {
    _markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  Future<void> getRoute() async {
    if (_pickupLatLng == null || _destinationLatLng == null) {
      return;
    }

    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/directions/json',
      queryParameters: {
        'origin': '${_pickupLatLng!.latitude},${_pickupLatLng!.longitude}',
        'destination':
            '${_destinationLatLng!.latitude},${_destinationLatLng!.longitude}',
        'key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final route = response.data['routes'][0];
      final polylinePoints = route['overview_polyline']['points'];
      final distance = route['legs'][0]['distance']['text'];
      final duration = route['legs'][0]['duration']['text'];
      final polylineCoordinates = _decodePolyline(polylinePoints);

      _distanceText = distance;
      _durationText = duration;
      _polylines.add(
        Polyline(
          polylineId: const PolylineId('route'),
          points: polylineCoordinates,
          color: blueMain,
          width: 5,
        ),
      );
      notifyListeners();
    } else {
      log('Failed to load route');
    }
  }

  List<LatLng> _decodePolyline(String polyline) {
    List<LatLng> points = [];
    int index = 0, len = polyline.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  String? currentLocationValidation(
      String? currentLocationValue, BuildContext context) {
    log('Pickup Location ----$currentLocationValue');
    if (currentLocationValue == null || currentLocationValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterCurrentLocation;
    }
    return null;
  }

  String? destinationValidation(
      String? destinationValue, BuildContext context) {
    log('Drop Location $destinationValue');
    if (destinationValue == null || destinationValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterDestinationLocation;
    }
    return null;
  }

  void clearSearchPickUp() {
   /* _currentLocationController.clear();
    _pickupLatLng = null;
    _currentLocationSuggestions = [];
    _destinationSuggestions = [];
    _markers = {};
    _polylines = {};
    _distanceText = null;
    _durationText = null;
    notifyListeners();*/
  }

  void clearSearchDestination() {
    _destinationController.clear();
    _destinationLatLng = null;
    _currentLocationSuggestions = [];
    _destinationSuggestions = [];
    _markers = {};
    _polylines = {};
    _distanceText = null;
    _durationText = null;
    notifyListeners();
  }

  void clearRentalData() {

    _selectedRentalVehicleModal = null;
    _rentalFareListModal = null;

    _packageModal = null;
    _selectedPackage = null;
    notifyListeners();
  }

  Future<bool> postDailyRideData(BuildContext context,) async {
    // PickupService pickupService = PickupService();
    PickUpModel pickUpModel = PickUpModel(
      pickUpLocation: _currentLocationController.text,
      pickUpLatLng: LocationLatLng(
        latitude: _pickupLatLng!.latitude.toString(),
        longitude: _pickupLatLng!.longitude.toString(),
      ),
      dropLocation: _destinationController.text,
      dropLatLng: LocationLatLng(
        latitude: _destinationLatLng!.latitude.toString(),
        longitude: _destinationLatLng!.longitude.toString(),
      ),
      userId: 'userId',
      serviceType: 'Daily',
    );


    var map = {
      "pickupLat":_pickupLatLng!.latitude,
      "pickupLng":_pickupLatLng!.longitude,
      "dropLat":_destinationLatLng!.latitude,
      "dropLng":_destinationLatLng!.longitude,
      "tripType": "daily"
    };


    try {
      final result = await RiderRepo.serviceBasicFare(map);

      if (result is Exception) {
        Fluttertoast.showToast(msg: "Something went wrong");
        return false;
      } else {
        if (result != null) {
          BasicFareModal data = basicFareModalFromMap(jsonEncode(result));
          _pickUpModel = pickUpModel;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DailyRide(
                pickupModal: pickUpModel,
                basicFareModal: data,
              ),
            ),
          );
          // clearTextControllers();
          log('pickup msg: ${data.message}');
          Fluttertoast.showToast(msg: result['message']);
          return true;
        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');
          return false;
        }
      }
    } on Exception catch (e) {
      e.printError();
      return false;
    }
  }

  Future<bool> postOutStationRideData(BuildContext context) async {

    if(isRoundTrip && (selectedEndDate==null || selectedEndTime== null)){
      Fluttertoast.showToast(msg: 'Please enter Round trip data');
      return false;
    }

   if(!isRoundTrip && (selectedStartDate==null || selectedStartTime== null)){
      Fluttertoast.showToast(msg: 'Please enter Oneway trip data');
      return false;
    }

    // PickupService pickupService = PickupService();
    PickUpModel pickUpModel = PickUpModel(
      pickUpLocation: _currentLocationController.text,
      pickUpLatLng: LocationLatLng(
        latitude: _pickupLatLng!.latitude.toString(),
        longitude: _pickupLatLng!.longitude.toString(),
      ),
      dropLocation: _destinationController.text,
      dropLatLng: LocationLatLng(
        latitude: _destinationLatLng!.latitude.toString(),
        longitude: _destinationLatLng!.longitude.toString(),
      ),
      userId: 'userId',
      serviceType: 'OutStation',
    );


    var map = {
      "pickupLat":_pickupLatLng!.latitude,
      "pickupLng":_pickupLatLng!.longitude,
      "dropLat":_destinationLatLng!.latitude,
      "dropLng":_destinationLatLng!.longitude,
      "outstationType": _isRoundTrip == true ? "round" : "oneway",
      "tripTypeCode": "outstation",
      "startDay": "${DateFormat('dd MMM yyyy').format(selectedStartDate)} ${selectedStartTime.format(context)}",
      "returnDay": _isRoundTrip == true
          ? "${DateFormat('dd MMM yyyy').format(selectedEndDate)} ${selectedEndTime.format(context)}"
          : "",
    };

    try {
      final result = await RiderRepo.getOutstationTaxi(map);

      if (result is Exception) {
        Fluttertoast.showToast(msg: result.toString());
        return false;
      } else {
        if (result != null) {
          var data = outstationTaxiModalFromMap(jsonEncode(result));
          if (data.success == true) {

            _pickUpModel = pickUpModel;


            showDialog<VehicleList?>(
                context: context,
                builder: (BuildContext context) {
                  VehicleList? selectedRadio;
                  return AlertDialog(
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Choose Ride", style: tsRegularBold,),
                            ...List.generate(data.vehicleList?.length??0, (int index) {
                              var modal = data.vehicleList![index];
                              return RadioListTile<VehicleList>(value: modal,
                                  title: Text(modal.vehicle??'-'),
                                  subtitle: Text(modal.fareDetails?.remainingFareLabel??'-'),
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  secondary:Utils.showImg(modal.file??'', 40, 40),
                                  groupValue: selectedRadio, onChanged: (VehicleList? selectedValue){
                                    selectedRadio = selectedValue;
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OutstationEstimationScreen(data :selectedValue!

                                        ),
                                      ),
                                    );
                                  }
                                  );
                            })
                          ],
                        );
                      },
                    ),
                  );
                },);



            // clearTextControllers();
          } else {
            Fluttertoast.showToast(msg: data.message ?? '-');
          }


          return true;
        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');
          return false;
        }
      }
    } on Exception catch (e) {
      e.printError();
      return false;
    }
  }

  // void clearTextControllers() {
  //   _currentLocationController.clear();
  //   _destinationController.clear();
  // }

  void proceedFunction(BuildContext context, int flag) {
    if (_pickupLatLng != null) {

      if(flag != 3){
        log('Pickup Location latitude: ${_pickupLatLng!.latitude}, Pickup Location longitude: ${_pickupLatLng!.longitude}');
        log('Drop Location latitude: ${_destinationLatLng!.latitude},Drop Location longitude: ${_destinationLatLng!.longitude}');
        log('Estimated Distance: $_distanceText');
        log('Estimated Duration: $_durationText');
      }


      _flag = flag;

      switch (flag) {
        case 1:
          postDailyRideData(context, );
        case 2:
           postOutStationRideData(context );
        case 3:
          postRideRideData(context);
        default:
          throw UnimplementedError("Please add for this flag $flag");
      }

    }
  }

  Future<void> findRentalRide(BuildContext context, ) async {

    var map = {
      "pickupLat":_pickupLatLng!.latitude,
      "pickupLng":_pickupLatLng!.longitude,
    };


    // _packageModal = rentalPackListModalFromMap(jsonEncode(json));
    // notifyListeners();

    try {
      final result = await RiderRepo.packageList(map);

      if (result is Exception) {
        Fluttertoast.showToast(msg: result.toString());

      } else {
        if (result != null) {
          _packageModal = rentalPackListModalFromMap(jsonEncode(result));

          if (_packageModal?.success == true) {

            notifyListeners();

            // clearTextControllers();
          } else {
            Fluttertoast.showToast(msg: _packageModal?.message ?? '-');
          }

        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');
        }
      }
    } on Exception catch (e) {
      e.printError();

    }

  }

  Future<void> findRentalVehicle() async {
    var map = {
      "tripTypeCode": "rental",
      "packageId": selectedPackage?.id,
      "serviceId": packageModal?.serviceDetail!.join(",")
    };

    try {
      final result = await RiderRepo.rentalVehicle(map);

      if (result is Exception) {
        Fluttertoast.showToast(msg: result.toString());

      } else {
        if (result != null) {

          var data = rentalFareListModalFromMap(jsonEncode(result));

          if(data.success==true){
            _rentalFareListModal = data;
            notifyListeners();
          }else{
            Fluttertoast.showToast(msg: data.message??'');
          }



        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');
        }
      }
    } on Exception catch (e) {
      e.printError();

    }

  }


  Future<void> postRideRideData(BuildContext context) async {



    if(selectedPackage == null){

      return;
    }

    if(selectedRentalVehicleModal == null){
      return;
    }

    var map = {
      "pickupLat": _pickupLatLng!.latitude,
      "pickupLng": _pickupLatLng!.longitude,
      "tripTypeCode": selectedRentalVehicleModal?.tripTypeCode??'',
      "serviceType": selectedRentalVehicleModal?.type,
      "vehicleTypeId": selectedRentalVehicleModal?.id,
      "paymentMode": "",
      "utc": "GMT+05:30",
      "vehicleDetailsAndFare": "",
      "packageId": selectedRentalVehicleModal?.packageId,
      "dropAddress": "",
      "distanceDetails": "",
      "promo": couponController.text,
      "dropLng": "",
      "tripType": "rental",
      "pickupCity": "",
      "pickupAddress": _currentLocationController.text,
      "tripDate": "",
      "bookingType": "rideNow",
      "dropLat": "",
      "serviceTypeId": 1,
      "vehicleTypeCode": "Rental",
      "serviceId": packageModal?.serviceDetail!.join(","),
      "timeFare": "",
      "requestFrom": "app",
      "tripTime": ""
    };

    try {
      final result = await RiderRepo.requestRentalTaxi(map);
      if (result is Exception) {
        Fluttertoast.showToast(msg: result.toString());
      } else {
        if (result != null) {
          if(result["success"]){
            Fluttertoast.showToast(msg: result["message"]);
            clearSearchDestination();
            clearRentalData();
            clearSearchPickUp();
            Navigator.pop(context);
          }else{
            Fluttertoast.showToast(msg: result["message"]);
          }
        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');
        }
      }
    } on Exception catch (e) {
      e.printError();

    }
  }


}
