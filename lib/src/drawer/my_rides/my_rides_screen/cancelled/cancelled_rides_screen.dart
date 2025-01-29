import 'package:oiot/src/drawer/my_rides/my_rides_screen/past/model/my_rides_modal.dart';

import '../../../../../imports.dart';

class CancelledRides extends StatelessWidget {
  const CancelledRides({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PastRideProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        List<MyRIdesModal>? pastTripData = provider.trips;

        List<MyRIdesModal?> cancelledTrips = pastTripData!
            .where((trip) => trip.status == "Cancelled")
            .toList();
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cancelledTrips.length,
          itemBuilder: (context, index) {
            PastTripModel? pastTrip = cancelledTrips[index] as PastTripModel;
            return Container(
              margin: horizontalPadding10,
              child: Column(
                children: [
                  height05,
                  ListTile(
                    title: Text(
                      "${AppLocalizations.of(context)!.idNumber}: ${pastTrip?.tripId ?? ''}",
                      style: tsRegularBold,
                    ),
                    trailing: Chip(
                      backgroundColor: pastTrip?.tripStatus == "Cash Received"
                          ? blueMain
                          : redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: circularBorderRadius5,
                      ),
                      label: Text(
                        "${pastTrip?.serviceType ?? ''} - ${pastTrip?.vehicleType ?? ''}",
                        style: tsRegularWhite,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 26,
                      backgroundImage:
                          NetworkImage(pastTrip?.driverPhoto ?? ''),
                    ),
                    title: Text(
                      pastTrip?.driverName ?? '',
                      style: tsRegularBold,
                    ),
                    subtitle: Text(
                      "${pastTrip?.vehicleNumber ?? ''}  |  ${pastTrip?.vehicleModel ?? ''}",
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
                            pastTrip?.tripAmount ?? '',
                            style: tsRegularWhite,
                          ),
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
                            "${pastTrip?.tripDate ?? ''}  |  ${pastTrip?.tripTime ?? ''}",
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
                                      pastTrip?.tripStatus == "Cash Received"
                                          ? backgroundGreen
                                          : redColor,
                                  child: Icon(
                                    pastTrip?.tripStatus == "Cash Received"
                                        ? Icons.done
                                        : Icons.cancel,
                                    size: 20.0,
                                    color: whiteColor,
                                  ),
                                ),
                                Text(
                                  pastTrip?.tripStatus ?? '',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color:
                                        pastTrip?.tripStatus == "Cash Received"
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
                      if (pastTrip?.tripCancelledReason.isNotEmpty ??
                          false) ...[
                        height20,
                        Center(
                          child: Text(
                            "${AppLocalizations.of(context)!.reason}: ${pastTrip?.tripCancelledReason ?? ''}",
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
                                    pastTrip?.pickUpLocation ?? '',
                                    style: tsRegularBold,
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
                                  pastTrip?.dropLocation ?? '',
                                  style: tsRegularBold,
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
                  const Divider(),
                  height20,
                ],
              ),
            );
          },
        );
      },
    );
  }
}
