import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/custom_rental_package_dropdown.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/pick_up/widgets/datettime_picker.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/custom_rental_ride_dropdown.dart';
import '../../../../../imports.dart';

class PickUpScreen extends StatelessWidget {
  final int flag;
  const PickUpScreen({required this.flag, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PickupProvider>(context, listen: false);
    provider.checkPermissionsAndGetLocation();
    /*provider.clearSearchPickUp();
    provider.clearSearchDestination();*/

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomHeader(title: _getHeaderTitle(context)),
                  const SizedBox(height: 24),
                  _buildLocationInputs(context),
                  const SizedBox(height: 24),
                  _buildDistanceAndDuration(context),

                  if (flag != 3) const SizedBox(height: 24),
                  if (flag == 1) _buildDailyRideOptions(context),
                  if (flag == 2) _buildOutstationOptions(context),
                  if (flag == 3) _buildRentalOptions(context),
                  const SizedBox(height: 24),

                  if(flag !=3)
                  CustomButton(
                    onTap: () => _handleProceed(context, flag),
                    title: AppLocalizations.of(context)!.proceed,
                    border: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getHeaderTitle(BuildContext context) {
    switch (flag) {
      case 1:
        return AppLocalizations.of(context)!.dailyRide;
      case 2:
        return AppLocalizations.of(context)!.outstation;
      case 3:
        return AppLocalizations.of(context)!.rental;
      default:
        return '';
    }
  }

  Widget _buildLocationInputs(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildLocationTextField(
              context,
              Provider.of<PickupProvider>(context, listen: false)
                  .currentLocationController,
              AppLocalizations.of(context)!.currentLocation,
              Icons.location_on,
              () => Provider.of<PickupProvider>(context, listen: false)
                  .clearSearchPickUp(),
              isCurrentLocation: true,
            ),
            _buildLocationSuggestions(context, isCurrentLocation: true),

            if(flag!=3)...[
              const SizedBox(height: 16),
              _buildLocationTextField(
                context,
                Provider.of<PickupProvider>(context, listen: false)
                    .destinationController,
                AppLocalizations.of(context)!.enterDestination,
                Icons.location_on,
                    () => Provider.of<PickupProvider>(context, listen: false)
                    .clearSearchDestination(),
                isCurrentLocation: false,
              ),
              _buildLocationSuggestions(context, isCurrentLocation: false),
            ]

          ],
        ),
      ),
    );
  }

  Widget _buildLocationTextField(
      BuildContext context,
      TextEditingController controller,
      String hintText,
      IconData prefixIcon,
      VoidCallback onClear,
      {required bool isCurrentLocation}) {
    return Consumer<PickupProvider>(
      builder: (context, provider, _) => TextFormField(
        controller: controller,
        style: tsRegularGrey,
        onChanged: (query) {
          provider.updateCurrentLocationField(isCurrentLocation);
          provider.getSuggestions(query);
        },
        validator: (value) => isCurrentLocation
            ? provider.currentLocationValidation(value, context)
            : provider.destinationValidation(value, context),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: blueMain, size: 24),
          hintText: hintText,
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close, color: textDarkGrey),
                  onPressed: onClear)
              : isCurrentLocation
                  ? IconButton(
                      onPressed: () {
                        provider.fetchCurrentLocation();
                      },
                      icon: const Icon(Icons.my_location),
                    )
                  : null,
          filled: true,
          fillColor: whiteColor,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: textDarkGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: textDarkGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: blueMain, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildDistanceAndDuration(BuildContext context) {
    return Consumer<PickupProvider>(
      builder: (context, provider, _) {
        if (provider.distanceText != null && provider.durationText != null) {
          return Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${AppLocalizations.of(context)!.totalDistance}: ${provider.distanceText}  -  ${AppLocalizations.of(context)!.duration}: ${provider.durationText}',
                style: tsRegularBold,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLocationSuggestions(BuildContext context,
      {required bool isCurrentLocation}) {
    return Consumer<PickupProvider>(
      builder: (context, provider, _) {
        final suggestions = isCurrentLocation
            ? provider.currentLocationSuggestions
            : provider.destinationSuggestions;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return ListTile(
              title: Text(suggestion['description']),
              onTap: () {
                provider.searchLocation(
                  suggestion['place_id'],
                  suggestion['description'],
                  // currentOption: isCurrentLocation,
                );
              },
              trailing: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  provider.showAddToFavouritesBottomSheet(
                    context,
                    suggestion['description'],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDailyRideOptions(BuildContext context) {
    return Consumer<PickupProvider>(
      builder: (context, provider, _) {
        if (provider.currentPosition != null) {
          return Column(
            children: [
              SizedBox(
                height:
                    300, // Fixed height to avoid being scrollable inside the scroll view
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      provider.currentPosition!.latitude,
                      provider.currentPosition!.longitude,
                    ),
                    zoom: 14.0,
                  ),
                  onMapCreated: (controller) {
                    provider.initMapController(controller);
                    provider.moveCameraToPosition(provider.currentPosition!);
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: provider.markers,
                  polylines: provider.polylines,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  if (provider.currentPosition != null) {
                    provider.moveCameraToPosition(provider.currentPosition!);
                  }
                },
                icon: Icon(Icons.location_on, color: darkBlack),
                label: Text(
                  AppLocalizations.of(context)!.locateOnMap,
                  style: TextStyle(
                      fontSize: 16,
                      color: darkBlack,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: darkBlack,
                  side: BorderSide(color: textDarkGrey, width: 1.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildOutstationOptions(BuildContext context) {
    return Consumer<PickupProvider>(
      builder: (context, provider, _) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRadioPair(
                  firstOptionFunction: provider.toggleRoundTrip,
                  secondOptionFunction: provider.toggleRoundTrip,
                  firstText: AppLocalizations.of(context)!.oneWay,
                  secondText: AppLocalizations.of(context)!.roundTrip,
                  value: provider.isRoundTrip ? 1 : 0,
                ),
                const SizedBox(height: 16),
                Text(AppLocalizations.of(context)!.selectDateTime,
                    style: tsRegular),
                const SizedBox(height: 8),
                DateTimePickerRow(
                  labelText: AppLocalizations.of(context)!.startDate,
                  initialDate: provider.selectedStartDate,
                  initialTime: provider.selectedStartTime,
                  onSelectDate: provider.updateStartDate,
                  onSelectTime: provider.updateStartTime,
                ),
                if (provider.isRoundTrip) ...[
                  const SizedBox(height: 16),
                  DateTimePickerRow(
                    labelText: AppLocalizations.of(context)!.endDate,
                    initialDate: provider.selectedEndDate,
                    initialTime: provider.selectedEndTime,
                    onSelectDate: provider.updateEndDate,
                    onSelectTime: provider.updateEndTime,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRentalOptions(BuildContext context) {
    return Consumer<PickupProvider>(
      builder: (context, provider, _) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                if (provider.currentPosition != null && provider.currentLocationController.text.isNotEmpty)...[
                  SizedBox(
                    height: 200,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          provider.currentPosition!.latitude,
                          provider.currentPosition!.longitude,
                        ),
                        zoom: 14.0,
                      ),
                      onMapCreated: (controller) {
                        provider.initMapController(controller);
                        provider
                            .moveCameraToPosition(provider.currentPosition!);
                      },
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      markers: provider.markers,
                      polylines: provider.polylines,
                    ),
                  ),
                  height15,
                  CustomButton(
                    onTap: () => provider.findRentalRide(context),
                    title: "Find Ride",
                    border: true,
                  ),
                ],

                if(provider.packageModal?.packageDetail?.isNotEmpty??false)...[
                  const SizedBox(height: 16),
                  CustomRentalPackageDropdown(
                    items: provider.packageModal!.packageDetail!,
                    selectedItem: provider.selectedPackage,
                    onChanged: provider.setSelectedPackage,
                    hint: AppLocalizations.of(context)!.pleaseSelectPackage,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!
                            .pleaseSelectPackage;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                ],

                if (provider.rentalFareListModal?.data?.isNotEmpty ??
                    false)
                  CustomRentalRideDropdown(
                    items: provider.rentalFareListModal!.data!,
                    selectedItem: provider.selectedRentalVehicleModal,
                    onChanged: provider.setSelectedVehicleType,
                    hint: AppLocalizations.of(context)!.vehicleType,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!
                            .pleaseSelectVehicleType;
                      }
                      return null;
                    },
                  ),

                /*else
                  const Center(child: CircularProgressIndicator()),*/



                if(provider.selectedRentalVehicleModal!=null)...[
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.applyCoupon,
                      suffixIcon: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: blueMain,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                        ),
                        child: Text(AppLocalizations.of(context)!.applyCaps,
                            style: tsRegularWhite),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    controller: provider.couponController,
                    style: tsRegular,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    onTap: () => _handleProceed(context, flag),
                    title: AppLocalizations.of(context)!.bookNow,
                    border: true,
                  ),
                ],

              ],
            ),
          ),
        );
      },
    );
  }

  void _handleProceed(BuildContext context, int flag) {
    final provider = Provider.of<PickupProvider>(context, listen: false);
    if (provider.formKey.currentState!.validate()) {
      provider.proceedFunction(context, flag);
      Provider.of<DailyRideController>(context, listen: false)
          .startLocationUpdates();
    }
  }
}
