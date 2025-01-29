import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:oiot/models/basic_fare_modal.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/pick_up/model/outstation_taxi_list_modal.dart';

import '../../../../../../imports.dart';

// ignore: must_be_immutable
class SedanEstimatePrice extends StatelessWidget {
  final VehicleList data;
  SedanEstimatePrice({super.key, required this.data, });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ChooseARideProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            ChooseARideInvoiceModel? chooseARideData =
                provider.vehicleTypeInvoiceData;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(mapBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: horizontalPadding10,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            height15,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: padding8,
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .estimatedPricing,
                                    style: tsLargeBold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: redColor,
                                    size: 40,
                                  ),
                                )
                              ],
                            ),
                            height15,
                            Text(
                              AppLocalizations.of(context)!
                                  .pleaseNoteYourFinalInvoice,
                              textAlign: centreAlign,
                              style: tsRegularBoldGrey,
                            ),
                            height15,
                            Text(
                              AppLocalizations.of(context)!.estimatedAmount,
                              style: tsRegularBold,
                            ),
                            height10,
                            Text(
                              '₹${data.fareDetails?.totalFare?.toString() ?? ''}',
                              style: tsBigGreen,
                            ),
                            height10,
                            Text(
                              '${AppLocalizations.of(context)!.bookingId}: ',
                              style: TextStyle(color: textBlack, fontSize: 20),
                            ),
                            height15,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.serviceType,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  GetUtils.capitalizeFirst(data.tripTypeCode!)??'',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height15,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.bookingType,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  "App Booking",
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height15,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.vehicleType,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.type??'',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.totalDistance,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.fareDetails?.distance.toString() ??'',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),

                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.totalRidingTime,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.fareDetails?.travelTime.toString() ??'',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),

                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.basePrice,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  "₹${data.fareDetails!.baseFareLabel}" ??'',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.extraTime,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  "₹${data.fareDetails?.additionalTimeFareNew}" ??'',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.extraKm,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.fareDetails?.additionalDistanceFare??'',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.pickupLocation,
                                  style: tsRegularBold,
                                ),
                                Text(data.scity??'-',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.dropLocation,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  '-',
                                  overflow: TextOverflow.ellipsis,
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lead Charge",
                                  style: tsRegularBold,
                                ),
                                Text(
                                  '0',
                                  overflow: TextOverflow.ellipsis,
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),

                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Night Fare",
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.fareDetails?.nightFare??'',
                                  overflow: TextOverflow.ellipsis,
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),

                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pickup Charge",
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.fareDetails?.pickupCharge.toString()??'',
                                  overflow: TextOverflow.ellipsis,
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),

                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Google Charge",
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.fareDetails?.googleCharge.toString()??'',
                                  overflow: TextOverflow.ellipsis,
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),

                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "GST",
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.fareDetails?.tax??'',
                                  overflow: TextOverflow.ellipsis,
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),

                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cancellation Fee",
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.fareDetails?.cancelationFeesRider.toString()??'',
                                  overflow: TextOverflow.ellipsis,
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),

                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.package,
                                  style: tsRegularBold,
                                ),
                                Text(
                                  data.packageName??'-',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),




                            height20,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
