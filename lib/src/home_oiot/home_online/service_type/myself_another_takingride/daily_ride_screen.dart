import 'dart:developer';

import 'package:oiot/models/basic_fare_modal.dart';

import '../../../../../imports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DailyRide extends StatelessWidget {
  final PickUpModel pickupModal;
  final BasicFareModal basicFareModal;
  const DailyRide({super.key, required this.pickupModal, required this.basicFareModal});

  @override
  Widget build(BuildContext context) {
    return Consumer<DailyRideController>(
      builder: (context, dailyRideController, _) {
        return Scaffold(
          key: GlobalKey<ScaffoldState>(),
          drawer: const DrawerScreen(),
          body: SafeArea(
            child: Stack(
              children: [
                Consumer<PickupProvider>(
                  builder: (context, provider, child) {

                    if (provider.currentPosition != null) {
                      return SizedBox(
                        height: double.infinity,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              provider.pickupLatLng!.latitude,
                              provider.pickupLatLng!.longitude,
                            ),
                            zoom: 14.0,
                          ),
                          onMapCreated: (controller) {
                            // provider.initOtherMapController(controller);
                            // provider.moveOtherCameraToPosition(provider.currentPosition!);
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // const Spacer(),
                    // RippleAnimation(
                    //   color: blueMain,
                    //   minRadius: 25,
                    //   repeat: true,
                    //   ripplesCount: 4,
                    //   duration: const Duration(milliseconds: 1000),
                    //   child: Image.asset(
                    //     liveUser,
                    //     height: 40,
                    //     width: 40,
                    //   ),
                    // ),
                    height150,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height25,
                            Text(
                              AppLocalizations.of(context)!
                                  .someoneElseTakingThisRide,
                              style: tsMediumBold,
                            ),
                            height10,
                            Text(
                              AppLocalizations.of(context)!
                                  .chooseAContactSoThatTheyAlsoGetDriverNumberVehicleDetailAndRideOtpViaSMS,
                              style: tsSmallGrey,
                            ),
                            height05,
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  activeColor: darkBlack,
                                  groupValue:
                                      dailyRideController.selectedOption,
                                  onChanged: (value) {
                                    dailyRideController
                                        .updateSelectedOption(value as int);
                                    dailyRideController
                                        .updateSelectedContact(null);
                                  },
                                ),
                                Text(
                                  AppLocalizations.of(context)!.mySelf,
                                  style: tsSmallBold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  activeColor: darkBlack,
                                  groupValue:
                                      dailyRideController.selectedOption,
                                  onChanged: (value) async {
                                    dailyRideController
                                        .updateSelectedOption(value as int);
                                    if (value == 2) {
                                      try {
                                        final contact = await FlutterContacts
                                            .openExternalPick();
                                        if (contact != null) {
                                          dailyRideController
                                              .updateSelectedContact(contact);
                                        }
                                      } catch (e) {
                                        log('Error picking contact: $e');
                                        Fluttertoast.showToast(
                                            msg: 'Failed to pick contact');
                                      }
                                    }
                                  },
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .chooseAnotherContact,
                                  style: tsSmallBold,
                                ),
                              ],
                            ),
                            if (dailyRideController.selectedContact !=
                                null) ...[
                              Padding(
                                padding: padding8,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: blueGreyshade50,
                                      borderRadius: circularBorderRadius10,
                                    ),
                                    height: 90,
                                    width: 350,
                                    child: Padding(
                                      padding: padding10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .contactName,
                                                style: tsRegular,
                                              ),
                                              Text(
                                                dailyRideController
                                                    .selectedContact!
                                                    .displayName
                                                    .trim(),
                                                style: tsRegularBold,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .mobileNumberr,
                                                style: tsRegular,
                                              ),
                                              Text(
                                                dailyRideController
                                                    .selectedContact!
                                                    .phones
                                                    .first
                                                    .number,
                                                style: tsRegularBold,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .doYouWantToTakeTravelInsurance,
                                    ),
                                    Text(
                                      '(Rs-₹0.49 ${AppLocalizations.of(context)!.willBeChargedForEachPerson})',
                                      style: TextStyle(
                                          fontSize: 12, color: textGrey),
                                    ),
                                  ],
                                ),
                                Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    value: dailyRideController
                                        .isTravelInsuranceEnabled,
                                    onChanged: (newValue) {
                                      dailyRideController.toggleSwitch();
                                    },
                                    activeColor: blueMain,
                                  ),
                                ),
                              ],
                            ),
                            height20,
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: CustomButton(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const UserOnlineHome(),
                                          ),
                                        );
                                      },
                                      title: AppLocalizations.of(context)!.skip,
                                      optionalColor: textDarkGrey,
                                      border: true,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: CustomButton(
                                      onTap: () {
                                        dailyRideController
                                            .postDailyRide(context,pickupModal, basicFareModal);
                                      },
                                      title: AppLocalizations.of(context)!
                                          .continueLanguage,
                                      border: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            height35,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
