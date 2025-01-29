import '../../../../../imports.dart';
import 'model/my_rides_modal.dart';

class PastRides extends StatelessWidget {
  const PastRides({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PastRideProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        // List<PastTripModel?> pastTripData = provider.pastTrip;
        List<MyRIdesModal>? trips = provider.trips;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: trips?.length??0,
          itemBuilder: (context, index) {

            MyRIdesModal? trip = trips![index];

            return Container(
              margin: horizontalPadding10,
              child: Column(
                children: [
                  height05,
                  ListTile(
                    title: Text(
                      "${AppLocalizations.of(context)!.idNumber}: ${trip.tripCode ?? ''}",
                      style: tsRegularBold,
                    ),
                    trailing: Chip(
                      backgroundColor: trip.status == "Finished"
                          ? blueMain
                          : redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      label: Text(
                        "${trip.triptype ?? ''} - ${trip.vehicle ?? ''}",
                        style: tsRegularWhite,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 26,
                      backgroundImage: const NetworkImage("https://cdn-icons-png.flaticon.com/128/149/149071.png"),
                    ),
                    title: Text(
                      trip.tripinvoicedriverdetails?.drivername ?? '',
                      style: tsRegularBold,
                    ),
                    subtitle: Text(
                      "${trip.tripinvoicedriverdetails?.drivervehicleNumber ?? ''}  |  ${trip.tripinvoicedriverdetails?.drivervehicletype ?? ''}",
                      style: tsExtraSmall,
                    ),
                  ),
                  height15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.totalAmount,
                        style: tsRegularBold,
                      ),
                      height50,
                      Row(
                        children: [
                          Text(
                            trip.fare ?? '',
                            style: tsRegularBlue,
                          ),
                          width2,
                          Icon(
                            Icons.info,
                            size: 20.0,
                            color: blueMain,
                          ),
                        ],
                      ),
                    ],
                  ),
                  height10,
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            trip.date ?? '',
                            style: tsExtraSmallGrey,
                          ),
                          width30,
                          SizedBox(
                            width: 120.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 10.0,
                                  backgroundColor:
                                      trip.paymentSts == "Paid"
                                          ? backgroundGreen
                                          : redColor,
                                  child: Icon(
                                    trip.paymentSts == "Paid"
                                        ? Icons.done
                                        : Icons.cancel,
                                    size: 20.0,
                                    color: whiteColor,
                                  ),
                                ),
                                Text(
                                  trip?.paymentSts ?? '',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color:
                                    trip.paymentSts == "Paid"
                                            ? backgroundGreen
                                            : redColor,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (trip.status == "Cancelled") ...[
                        height20,
                        Center(
                          child: Text(
                            "${AppLocalizations.of(context)!.reason}: ${trip.review ?? ''}",
                            style: tsSmallBold,
                          ),
                        ),
                      ],
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 70.0,
                              child: TimelineTile(
                                isFirst: true,
                                isLast: false,
                                endChild: Container(
                                  margin: leftPadding10,
                                  child: Text(
                                    trip.adsp?.from ?? '',
                                    style: tsExtraSmall,
                                  ),
                                ),
                                beforeLineStyle: LineStyle(color: lightGrey),
                                indicatorStyle: IndicatorStyle(color: black87),
                              ),
                            ),
                            TimelineTile(
                              isFirst: false,
                              isLast: true,
                              beforeLineStyle: LineStyle(color: lightGrey),
                              endChild: Container(
                                margin: leftPadding10,
                                child: Text(

                                  trip.adsp?.to ?? '',
                                  style: tsExtraSmall,
                                ),
                              ),
                              indicatorStyle: IndicatorStyle(color: redColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  height20,
                  Container(
                    margin: horizontalPadding20,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        padding: vertPadding15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: whiteColor,
                        side: BorderSide(
                          color: textGrey,
                          width: 1.0,
                        ),
                      ),
                      onPressed: () {
                        inviceSheet(context, trip);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_download_outlined,
                            color: textGrey,
                          ),
                          width10,
                          Text(
                            AppLocalizations.of(context)!.downloadInvoice,
                            style: tsRegularBoldGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  height10,
                ],
              ),
            );
          },
        );
      },
    );
  }

  void inviceSheet(BuildContext context, MyRIdesModal trip,) {
     showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: transperentColor,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.all(
                Radius.circular(10.0)),
          ),
          margin: horizontalPadding20,
          padding: const EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                height30,
                Text(
                  AppLocalizations.of(context)!.invoice,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                height10,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .totalAmount,
                  trailtext: trip.fare ?? '',
                  lc: textGrey,
                  tc: greenColor,
                  ls: 16.0,
                  ts: 16.0,
                ),
                height10,
                Divider(color: textGrey, thickness: 1.0),
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .totalCharges,
                  trailtext: trip.fare ?? '',
                  lc: black87,
                  tc: black87,
                  ls: 16.0,
                  ts: 16.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .pickupLocation,
                  trailtext: "-",
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .dropLocation,
                  trailtext: "-",
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext:
                      AppLocalizations.of(context)!.driver,
                  trailtext: trip.dvr ?? '',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .serviceType,
                  trailtext: trip.triptype ?? '',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .vehicleModel,
                  trailtext: trip.vehicle ?? '',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .vehiclenumber,
                  trailtext: trip?.vehicle ?? '',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .tripDate,
                  trailtext: trip.date ?? '',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .tripTime,
                  trailtext: trip?.acsp?.time??'',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .discount,
                  trailtext: trip.acsp?.discountName ?? '',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .convCharges,
                  trailtext:
                      trip?.acsp?.conveyance.toString() ?? '',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: "GST(6%)",
                  trailtext: trip?.csp?.taxcgst?.toString() ?? '',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: "SGST(6%)",
                  trailtext: trip.csp?.taxsgst.toString() ?? '',
                  lc: textGrey,
                  tc: black87,
                  ls: 12.0,
                  ts: 12.0,
                ),
                height20,
                popupRow(
                  leadtext: AppLocalizations.of(context)!
                      .payableAmount,
                  trailtext: trip.fare ?? '',
                  lc: greenColor,
                  tc: greenColor,
                  ls: 16.0,
                  ts: 16.0,
                ),
                height20,
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      side: BorderSide(
                          color: black87, width: 1.0),
                      backgroundColor: whiteColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.close,
                      style: TextStyle(
                        color: black87,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
                height20,
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      side: BorderSide(
                          color: black87, width: 1.0),
                      backgroundColor: whiteColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!
                          .downloadInvoice,
                      style: TextStyle(
                        color: black87,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
