import 'package:firebase_database/firebase_database.dart';
import 'package:oiot/imports.dart';
import '../../../../main.dart';
import '../feedback_driver/feedback_driver.dart';
import '../final_invoice/booking_invoice_screen.dart';

class CashPaymentMethod extends StatelessWidget {
  final Map data;
  const CashPaymentMethod({super.key, required this.data});

  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Thank you for sharing oiot',
      chooserTitle: 'Share via',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: SingleChildScrollView(
            child: Consumer<BookingProvider>(
              builder: (BuildContext context, provider, Widget? child) {
                BookingInvoiceModel? bookingInvoiceData =
                    provider.bookingInvoiceModel;
                final databaseRef = FirebaseDatabase.instance.ref().child('trips_data').child(localStorageService.tripId.toString());

                return StreamBuilder(
                    stream: databaseRef.onValue,
                    builder: (context, snapshot) {

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
                        return const Center(child: Text('No data available'));
                      }

                      Map data = snapshot.data!.snapshot.value! as Map;
                      // final databaseRef1 = FirebaseDatabase.instance.ref().child('drivers_data').child('675bc17adc204501cd6fb2e3');

                      return Column(
                        children: [
                          CustomHeader(
                              title:
                              '${AppLocalizations.of(context)!.bookingId} - ${bookingInvoiceData?.bookingId ?? ''}'),
                          height20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.startDateTime,
                                style: tsMediumBold,
                              ),
                              Text(
                                ' NA',
                                style: tsRegularBoldGrey,
                              ),
                            ],
                          ),
                          height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.endDateTime,
                                style: tsMediumBold,
                              ),
                              Text(
                                'NA',
                                style: tsRegularBoldGrey,
                              ),
                            ],
                          ),
                          height20,
                          /*Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: horizontalPadding10,
                                  child: Consumer<BookingProvider>(
                                    builder: (context, provider, child) {
                                      return CustomButton(
                                        onTap: () => provider.toggleBillingDetail(),
                                        title: AppLocalizations.of(context)!
                                            .billingDetails,
                                        optionalColor: provider.isBillingDetail
                                            ? null
                                            : blackColor,
                                        optionalTextColor: provider.isBillingDetail
                                            ? null
                                            : whiteColor,
                                        border: true,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: horizontalPadding10,
                                  child: CustomButton(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RouteDetails(),
                                        ),
                                      );
                                    },
                                    title:
                                        AppLocalizations.of(context)!.routeDetails,
                                    optionalColor: blackColor,
                                    optionalTextColor: whiteColor,
                                    border: true,
                                  ),
                                ),
                              )
                            ],
                          ),*/
                          // height20,
                          Container(
                            color: greyShade200,
                            child: Padding(
                              padding: padding10,
                              child: Column(
                                children: [
                                  const SizedBox(width: double.infinity),
                                  Text(
                                    AppLocalizations.of(context)!.amountToBePaid,
                                    style: tsMediumBold,
                                  ),
                                  height05,
                                  Text("₹${data['total_fare']?? 'NA'}",
                                    style: tsExtraLargeBold,
                                  ),
                                  height05,
                                  Text(
                                    '${AppLocalizations.of(context)!.bookingId} - NA}',
                                    style: tsSmallGrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          height20,
                          Consumer<BookingProvider>(
                            builder: (context, provider, child) {
                              return Column(
                                children: [
                                  BusinessContainer(
                                      expanded: provider.isContainer1Expanded, data),
                                  height15,
                                  TripContainer(
                                      expanded: provider.isContainer3Expanded, data),
                                  height15,
                                  RiderContainer(
                                      expanded: provider.isContainer2Expanded, data),
                                ],
                              );
                            },
                          ),
                          height20,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: whiteColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.totalCharges,
                                        style: tsMediumBold,
                                      ),
                                      Text("₹${data['basefare']?? 'NA'}",
                                        style: tsRegularBoldGrey,
                                      ),
                                    ],
                                  ),
                                  height20,
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'GST(6%)',
                                        style: tsRegularBold,
                                      ),
                                      Text("₹${data['taxcgst']?? 'NA'}",
                                        style: tsSmallBoldGrey,
                                      ),
                                    ],
                                  ),
                                  height10,
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'SGST(6%)',
                                        style: tsRegularBold,
                                      ),

                                      Text("₹${data['taxsgst']?? 'NA'}",
                                        style: tsSmallBoldGrey,
                                      ),
                                    ],
                                  ),
                                  height10,
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .driverDiscount,
                                        style: tsRegularBold,
                                      ),
                                      Text("₹${data['taxsgst']?? 'NA'}",
                                        style: tsSmallBoldGrey,
                                      ),
                                    ],
                                  ),
                                  height10,
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.convCharges,
                                        style: tsRegularBold,
                                      ),
                                      Text("₹${data['convance_fare']?? 'NA'}",
                                        style: tsSmallBoldGrey,
                                      ),
                                    ],
                                  ),
                                  height20,
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.payableAmount,
                                        style: tsRegularBold,
                                      ),
                                      Text("₹${data['total_fare']?? 'NA'}",
                                        style: tsMediumBoldGreen700,
                                      ),
                                    ],
                                  ),
                                  height10,
                                ],
                              ),
                            ),
                          ),
                          height15,


                        height15,
                        Text(
                          '${AppLocalizations.of(context)!.promotionalDiscountForNextRide} ${bookingInvoiceData?.promotionalDiscound ?? ''}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        height20,
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const UserOnlineHome(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: blueMain,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 12),
                                    child: Text(
                                      AppLocalizations.of(context)!.confirmAndClose,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  shareFunction();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: blueMain,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 12),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.share_outlined,
                                          color: whiteColor,
                                        ),
                                        width5,
                                        Text(
                                          AppLocalizations.of(context)!
                                              .shareInvoice,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DriverFeedback()),
                            );
                          },
                          title: AppLocalizations.of(context)!.userFeedback,
                          optionalColor: const Color(0xFFffd328),
                          optionalTextColor: Colors.black,
                          border: true,
                        ),
                        const SizedBox(height: 25),
                      ],
                    );
                  }
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
