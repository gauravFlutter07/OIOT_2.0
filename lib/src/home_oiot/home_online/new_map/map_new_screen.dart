import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_new_controller.dart';

class NewMapScreen extends StatelessWidget {
  const NewMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewMapProvider(),
      child: Scaffold(
        body: Consumer<NewMapProvider>(
          builder: (context, mapProvider, child) {
            return Stack(
              children: [
                mapProvider.currentLocation == null
                    ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        onMapCreated: (controller) {
                          mapProvider.setController(controller);
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            mapProvider.currentLocation!.latitude!,
                            mapProvider.currentLocation!.longitude!,
                          ),
                          zoom: 15.0,
                        ),
                        markers: mapProvider.markers,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                      ),
                Positioned(
                  bottom: 20,
                  left: 50,
                  right: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            mapProvider.onVehicleTypeSelected('hatchback');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  mapProvider.selectedVehicleType == 'hatchback'
                                      ? Colors.blue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              'Hatchback',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mapProvider.selectedVehicleType ==
                                        'hatchback'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            mapProvider.onVehicleTypeSelected('sedan');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: mapProvider.selectedVehicleType == 'sedan'
                                  ? Colors.blue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              'Sedan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:
                                    mapProvider.selectedVehicleType == 'sedan'
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            mapProvider.onVehicleTypeSelected('suv');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: mapProvider.selectedVehicleType == 'suv'
                                  ? Colors.blue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              'SUV',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mapProvider.selectedVehicleType == 'suv'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
