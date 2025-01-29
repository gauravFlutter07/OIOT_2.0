import 'package:oiot/src/home_oiot/home_online/service_type/rental_estimated_price/model/rental_estimated_model.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/rental_estimated_price/rental_estimate_controller.dart';

import '../../../../../imports.dart';
import '../../../../../models/basic_fare_modal.dart';

class RentalEstimatePrice extends StatelessWidget {
  const RentalEstimatePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<RentalEstimateprovider>(
          builder: (BuildContext context, provider, Widget? child) {
            RentalEstimatModel? rentalEstimatModel =
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
                  const Spacer(),
                  Container(
                    height: 700,
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
                              style: tsLargeBold,
                            ),
                            height10,
                            Text(
                              '₹${rentalEstimatModel?.hatchback.estimatedAmount ?? ''}',
                              style: tsBigGreen,
                            ),
                            height10,
                            Text(
                              '${AppLocalizations.of(context)!.bookingId}: ${rentalEstimatModel?.hatchback.bookingId ?? ''}',
                              style: TextStyle(color: textBlack, fontSize: 20),
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
                                  rentalEstimatModel?.hatchback.bookingType ??
                                      '',
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
                                Text(
                                  rentalEstimatModel
                                          ?.hatchback.pickUpLocation ??
                                      '',
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
                                  rentalEstimatModel
                                          ?.hatchback.destinationLocation ??
                                      '',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.serviceType,
                                  style: tsRegularBold,
                                ),
                                Text(
                                    rentalEstimatModel?.hatchback.serviceType ??
                                        '',
                                    style: tsRegularBoldGrey)
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
                                  rentalEstimatModel?.hatchback.package ?? '',
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
                                  '₹${rentalEstimatModel?.hatchback.basePrice ?? ''}',
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
                                  rentalEstimatModel?.hatchback.extraKm ?? '',
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
                                  '₹${rentalEstimatModel?.hatchback.extraTime ?? ''}',
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
                                  rentalEstimatModel?.hatchback.totalDistance ??
                                      '',
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
                                  rentalEstimatModel
                                          ?.hatchback.totalRidingTime ??
                                      '',
                                  style: tsRegularBoldGrey,
                                )
                              ],
                            ),
                            height20,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Row(
                                children: [
                                  // Expanded(
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(right: 20),
                                  //     child: CustomButtonOnlyBorder(
                                  //       onTap: () {
                                  //         Navigator.pushReplacement(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 const ScheduledHomeScreen(),
                                  //           ),
                                  //         );
                                  //       },
                                  //       title: AppLocalizations.of(context)!.schedule,
                                  //       border: true,
                                  //       optionalTextColor: textBlack,
                                  //     ),
                                  //   ),
                                  // ),

                                  Expanded(
                                    child: CustomButton(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DriverSearchingAnimation(vehicleModal: VehicleCategory(),),
                                          ),
                                        );
                                      },
                                      title:
                                          AppLocalizations.of(context)!.bookNow,
                                      border: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
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
