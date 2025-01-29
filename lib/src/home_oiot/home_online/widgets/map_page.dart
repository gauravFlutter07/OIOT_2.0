import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location _locationController = Location();

  final Completer<gmaps.GoogleMapController> _mapController =
      Completer<gmaps.GoogleMapController>();

  LatLng? _currentP;
  StreamSubscription<LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentP == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : gmaps.GoogleMap(
              onMapCreated: ((gmaps.GoogleMapController controller) =>
                  _mapController.complete(controller)),
              initialCameraPosition:
                  gmaps.CameraPosition(target: _currentP!, zoom: 5),
              markers: {
                if (_currentP != null)
                  gmaps.Marker(
                    markerId: const gmaps.MarkerId("_currentLocation"),
                    icon: gmaps.BitmapDescriptor.defaultMarker,
                    position: _currentP!,
                  ),
              },
            ),
    );
  }

  Future<void> cameraToPosition(LatLng pos) async {
    final gmaps.GoogleMapController controller = await _mapController.future;
    gmaps.CameraPosition newCameraPosition =
        gmaps.CameraPosition(target: pos, zoom: 15);
    await controller
        .animateCamera(gmaps.CameraUpdate.newCameraPosition(newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationSubscription = _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        if (mounted) {
          // Check if the widget is still mounted
          setState(() {
            _currentP =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
            cameraToPosition(_currentP!);
          });
        }
      }
    });
  }
}
