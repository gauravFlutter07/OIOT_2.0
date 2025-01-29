// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:location/location.dart';

import '../../../../imports.dart';

class NewMapProvider with ChangeNotifier {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  LocationData? _currentLocation;
  final Location _location = Location();
  String _selectedVehicleType = 'all';

  late BitmapDescriptor _hatchbackIcon;
  late BitmapDescriptor _sedanIcon;
  late BitmapDescriptor _suvIcon;

  NewMapProvider() {
    _setCustomMarkers();
    _initializeLocation();
  }

  Set<Marker> get markers => _markers;
  LocationData? get currentLocation => _currentLocation;
  String get selectedVehicleType => _selectedVehicleType;

  Future<void> _setCustomMarkers() async {
    _hatchbackIcon = await _getMarkerIcon('assetst/hatchback.png');
    _sedanIcon = await _getMarkerIcon('assetst/sedan.png');
    _suvIcon = await _getMarkerIcon('assetst/suv.png');
    _loadVehicleMarkers();
  }

  Future<BitmapDescriptor> _getMarkerIcon(String assetPath) async {
    const ImageConfiguration imageConfiguration =
        ImageConfiguration(size: Size(350, 200));
    final Uint8List imageData =
        await getBytesFromAsset(assetPath, imageConfiguration);
    return BitmapDescriptor.fromBytes(imageData);
  }

  Future<Uint8List> getBytesFromAsset(
      String path, ImageConfiguration config) async {
    final ByteData data = await rootBundle.load(path);
    final ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetHeight: 280,
        targetWidth: 210);
    final ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> _initializeLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if the location service is enabled
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check for location permissions
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get the current location
    _currentLocation = await _location.getLocation();

    // Log current location
    if (_currentLocation != null) {
      log('Initial Location: ${_currentLocation!.latitude}, ${_currentLocation!.longitude}');
    } else {
      log('Initial Location: null');
    }

    // Update the camera position to the current location
    if (_currentLocation != null && _controller != null) {
      _controller!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target:
              LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
          zoom: 15.0,
        ),
      ));
    }

    // Listen for location changes
    _location.onLocationChanged.listen((LocationData currentLocation) {
      _currentLocation = currentLocation;
      notifyListeners();

      // Log location changes
      log('Location Changed: ${currentLocation.latitude}, ${currentLocation.longitude}');

      // Update the camera position on location change
      if (_controller != null) {
        _controller!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(currentLocation.latitude!, currentLocation.longitude!),
            zoom: 15.0,
          ),
        ));
      }
    });
  }

  StreamSubscription<DatabaseEvent>? _vehiclesSubscription;

  Future<void> _loadVehicleMarkers([String vehicleType = 'all']) async {
    final DatabaseReference databaseRef =
        FirebaseDatabase.instance.reference().child('vehicles');

    // Cancel previous subscription if exists
    _vehiclesSubscription?.cancel();

    // Subscribe to vehicles changes
    _vehiclesSubscription = databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;

      Map<String, dynamic> vehiclesData =
          Map<String, dynamic>.from(snapshot.value as Map);
      Map<String, dynamic> filteredVehicles = {};

      if (vehicleType == 'all') {
        filteredVehicles = vehiclesData;
      } else {
        filteredVehicles[vehicleType] = vehiclesData[vehicleType];
      }

      _markers.clear();
      filteredVehicles.forEach((type, vehicles) {
        vehicles.forEach((id, vehicle) {
          final latitude = vehicle['latitude'] as double;
          final longitude = vehicle['longitude'] as double;

          BitmapDescriptor icon;
          switch (type) {
            case 'hatchback':
              icon = _hatchbackIcon;
              break;
            case 'sedan':
              icon = _sedanIcon;
              break;
            case 'suv':
              icon = _suvIcon;
              break;
            default:
              icon = BitmapDescriptor.defaultMarker;
          }

          final marker = Marker(
            markerId: MarkerId(id),
            position: LatLng(latitude, longitude),
            icon: icon,
            infoWindow: InfoWindow(title: id),
          );

          _markers.add(marker);
        });
      });
      notifyListeners();
    });
  }

  void setController(GoogleMapController controller) {
    _controller = controller;
    if (_currentLocation != null) {
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
                _currentLocation!.latitude!, _currentLocation!.longitude!),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  void onVehicleTypeSelected(String vehicleType) {
    _selectedVehicleType = vehicleType;
    _loadVehicleMarkers(vehicleType);

    // Log selected vehicle type
    log('Selected Vehicle Type: $vehicleType');

    notifyListeners();
  }
}
