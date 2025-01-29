import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oiot/src/home_oiot/home_online/driver_searching_page/model/ride_request_success_modal.dart';

import '../../../../imports.dart';

class DriverOnWay extends StatelessWidget {
  final RideRequestSuccessModal tripData;
  const DriverOnWay( {super.key, required this.tripData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer<PickupProvider>(
            builder: (context, provider, child) {
              if (provider.currentPosition != null) {
                return SizedBox(
                  height: double.infinity,
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
                );
              } else {
                return const SizedBox(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
          DraggableScrollableSheet(
            minChildSize: 0.35,
            snapAnimationDuration: const Duration(seconds: 1),
            snap: true,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Consumer<DriverOnTheWayProvider>(
                builder: (context, provider, child) {
                  DriverOnTheWayDataModel? driverOnTheWayData =
                      provider.driverOntheawayDetails;
                  return Container(
                    color: whiteColor,
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: whiteColor,
                          ),
                          child: Padding(
                            padding: horizontalPadding10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                height15,
                                Padding(
                                  padding: padding5,
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .driverOnTheWay,
                                    style: tsLargeBold,
                                  ),
                                ),
                                height10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: whiteColor,
                                          radius: 26,
                                          backgroundImage: NetworkImage(
                                              driverOnTheWayData?.driverPhoto ??
                                                  ''),
                                        ),
                                        title: Text(
                                          driverOnTheWayData?.driverName ?? '',
                                          style: tsRegularBold,
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: starColor,
                                            ),
                                            Text(driverOnTheWayData
                                                    ?.driverRating ??
                                                ''),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: darkWhiteBackground,
                                        borderRadius: circularBorderRadius5,
                                      ),
                                      child: Padding(
                                        padding: padding8,
                                        child: Column(
                                          children: [
                                            Text(
                                              driverOnTheWayData?.driverTime ??
                                                  '',
                                              style: tsRegularBold,
                                            ),
                                            Text(
                                              'mins',
                                              style: tsExtraSmallGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                height10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: whiteColor,
                                          radius: 26,
                                          backgroundImage: NetworkImage(
                                              driverOnTheWayData
                                                      ?.vehiclePhoto ??
                                                  ''),
                                        ),
                                        title: Text(
                                          driverOnTheWayData?.vehicleModel ??
                                              '',
                                          style: tsRegularBold,
                                        ),
                                        subtitle: Text(
                                            driverOnTheWayData?.vehicleNumber ??
                                                ''),
                                      ),
                                    ),
                                    Padding(
                                      padding: rightPadding5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              driverOnTheWayData?.tripAmount ??
                                                  '',
                                              style: tsRegularBold),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .conditionsApply,
                                            style: tsExtraSmallGrey,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                height15,
                                Divider(
                                  thickness: 2,
                                  color: backgroundGrey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    height15,
                                    Expanded(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: darkWhiteBackground,
                                          child: Icon(
                                            Icons.location_on,
                                            color: blueMain,
                                          ),
                                        ),
                                        title: Text(
                                          AppLocalizations.of(context)!
                                              .pickupLocation,
                                          style: tsRegular,
                                        ),
                                        subtitle: Text(
                                          driverOnTheWayData?.pickUpLocation ??
                                              '',
                                          style: tsRegularBold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                height10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    height15,
                                    Expanded(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: darkWhiteBackground,
                                          child: Icon(
                                            Icons.location_on,
                                            color: redColor,
                                          ),
                                        ),
                                        title: Text(
                                          AppLocalizations.of(context)!
                                              .dropLocation,
                                          style: tsRegular,
                                        ),
                                        subtitle: Text(
                                          driverOnTheWayData?.dropLocation ??
                                              '',
                                          style: tsRegularBold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                height10,
                                Padding(
                                  padding: padding8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: darkWhiteBackground,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: padding10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                clockOutlineLogo,
                                                height: 25,
                                                width: 25,
                                              ),
                                              height05,
                                              Text(
                                                driverOnTheWayData?.tripTime ??
                                                    '',
                                                style: tsRegularBold,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Image.asset(
                                                rupeeLogo,
                                                height: 25,
                                                width: 25,
                                              ),
                                              height05,
                                              Text(
                                                driverOnTheWayData
                                                        ?.tripAmount ??
                                                    '',
                                                style: tsRegularBold,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Image.asset(
                                                steeringWheel,
                                                height: 25,
                                                width: 25,
                                              ),
                                              height05,
                                              Text(
                                                driverOnTheWayData
                                                        ?.tripDistance ??
                                                    '',
                                                style: tsRegularBold,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                height15,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          blueMain.withOpacity(0.2),
                                      child: Icon(
                                        Icons.email,
                                        color: blueMain,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SosPage(),
                                            ));
                                      },
                                      child: Image.asset(
                                        sos,
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        provider.shareFunction();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            blueMain.withOpacity(0.2),
                                        child: Icon(
                                          Icons.share_outlined,
                                          color: blueMain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                height25,
                                Padding(
                                  padding: padding5,
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: lightGreyColor,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7.5, horizontal: 25),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DriverReachedScreen(),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(
                                                  call,
                                                  height: 32,
                                                  width: 33,
                                                ),
                                                width5,
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .callDriver,
                                                  style: tsRegularBold,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: CustomButton(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RaiseNewTicket(),
                                                ),
                                              );
                                            },
                                            title: AppLocalizations.of(context)!
                                                .support,
                                            border: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                height10,
                                Padding(
                                  padding: padding5,
                                  child: CustomButtonOnlyBorder(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                               ReasonsForCancel(tripData:tripData),
                                        ),
                                      );
                                    },
                                    title: AppLocalizations.of(context)!
                                        .cancelRide,
                                    border: true,
                                  ),
                                ),
                                height30,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
