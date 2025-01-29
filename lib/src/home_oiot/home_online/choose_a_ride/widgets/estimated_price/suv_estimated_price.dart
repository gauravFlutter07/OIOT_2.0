import '../../../../../../imports.dart';
import '../../../../../../models/basic_fare_modal.dart';

// ignore: must_be_immutable
class SuvEstimatePrice extends StatelessWidget {
  SuvEstimatePrice({super.key});

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
                  Padding(
                    padding: padding12,
                    child: RideHeader(
                      scaffoldKey: _scaffoldKey,
                    ),
                  ),
                  const Spacer(),
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
                              '₹${chooseARideData?.suv.estimatedAmount ?? ''}',
                              style: tsBigGreen,
                            ),
                            height10,
                            Text(
                              '${AppLocalizations.of(context)!.bookingId}: ${chooseARideData?.suv.bookingId ?? ''}',
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
                                  chooseARideData?.suv.bookingType ?? '',
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
                                  chooseARideData?.suv.pickUpLocation ?? '',
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
                                  chooseARideData?.suv.destinationLocation ??
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
                                Text(chooseARideData?.suv.serviceType ?? '',
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
                                  chooseARideData?.suv.package ?? '',
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
                                  '₹${chooseARideData?.suv.basePrice ?? ''}',
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
                                  chooseARideData?.suv.extraKm ?? '',
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
                                  '₹${chooseARideData?.suv.extraTime ?? ''}',
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
                                  chooseARideData?.suv.totalDistance ?? '',
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
                                  chooseARideData?.suv.totalRidingTime ?? '',
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
