import '../../../../../../imports.dart';
import '../../../../../home_oiot/home_online/driver_searching_page/model/ride_request_success_modal.dart';
import '../../past/model/my_rides_modal.dart';

class ScheduledTabPage extends StatelessWidget {
  const ScheduledTabPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8,
      child: Consumer<ScheduledRideProvider>(
        builder: (BuildContext context, provider, Widget? child) {

          return ListView.separated(
            shrinkWrap: true,
            itemCount: provider.trips?.length??0,
            padding: vertPadding20,
            itemBuilder: (context, index) {
              var modal = provider.trips![index];
              return rideWidget(context, modal);
            }, separatorBuilder: (BuildContext context, int index) {
              return height20;
          },
          );
        },
      ),
    );
  }

  rideWidget(BuildContext context, MyRIdesModal trips) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(
              color: lightGreyColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.routeDetails,
                    style: tsRegularBold,),
                  buildText(AppLocalizations.of(context)!.bookingId, trips.tripno.toString()),

                ],
              ),

              buildText(AppLocalizations.of(context)!.scheduledTrips, trips.date.toString()),
              buildText(AppLocalizations.of(context)!.bookingType, trips.triptype.toString()),
              buildText(AppLocalizations.of(context)!.vehicleType, trips.vehicle.toString()),
              buildText(AppLocalizations.of(context)!.extraKm, "₹${trips.csp!.extraKm.toString()}"),
              buildText(AppLocalizations.of(context)!.extraTime, "₹${trips.csp!.extraTime.toString()}"),
              buildText(AppLocalizations.of(context)!.baseFare, "${trips.csp!.baseKm.toString()} KM | ${trips.csp!.baseTime.toString()} min - ₹${trips.csp!.base.toString()}"),

              Text(AppLocalizations.of(context)!.estimatedPricing,
                  style: tsRegularBold),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${trips.dsp!.distanceKm.toString()} KM",
                      style: tsRegularBoldGrey),
                  Text(trips.dsp!.estTime.toString(),
                      style: tsRegularBoldGrey),
                  Text("₹${trips.fare!.toString()}",
                      style: tsRegularBoldGrey),
                ],
              )
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.not_listed_location),
                  width5,
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.pickupLocation,
                        style: tsRegularBold),
                  ),
                ],
              ),
              height05,
              Text(trips.dsp?.start??'-',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: tsRegular),
            ],
          ),
        ),


        CustomButton(onTap: (){}, title: "Cancel",
            border: false)
      ],
    );

    /*return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height05,
        Padding(
          padding: leftPadding05,
          child: Chip(
            backgroundColor: blueGreyshade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: customTextWidget(
              text:
              '${scheduledTrip?.serviceType ?? ''} - ${scheduledTrip?.vehicleType ?? ''}',
              size: 14.0,
              color: blackColor,
              weight: FontWeight.normal,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customTextWidget(
              text:
              "${AppLocalizations.of(context)!.idNumber} - ${scheduledTrip?.tripId ?? ''}",
              size: 15.0,
              color: blackColor,
              weight: FontWeight.w500,
            ),
            customTextWidget(
              text:
              "${scheduledTrip?.tripDate ?? ''}  | ${scheduledTrip?.tripTime ?? ''}",
              size: 14.0,
              color: blackColor,
              weight: FontWeight.normal,
            ),
          ],
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: whiteColor,
            radius: 26,
            backgroundImage:
            NetworkImage(scheduledTrip?.driverPhoto ?? ''),
          ),
          title: customTextWidget(
            text: scheduledTrip?.driverName ?? '',
            size: 14.0,
            color: blackColor,
            weight: FontWeight.bold,
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.star,
                color: starColor,
              ),
              customTextWidget(
                text: scheduledTrip?.driverRating ?? '',
                size: 14.0,
                color: blackColor,
                weight: FontWeight.normal,
              ),
            ],
          ),
          trailing: CircleAvatar(
            backgroundColor: starColor,
            child: Image(
              image: AssetImage(
                call,
              ),
            ),
          ),
        ),
        height05,
        Card(
          color: blueGreyshade50,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 12.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customTextWidget(
                      text: scheduledTrip?.tripKmAway ?? '',
                      size: 14.0,
                      color: blackColor,
                      weight: FontWeight.normal,
                    ),
                    customTextWidget(
                      text: scheduledTrip?.driverReachTime ?? '',
                      size: 14.0,
                      color: blackColor,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
                TimelineTile(),
                height05,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: blackColor,
                        ),
                        customTextWidget(
                          text: scheduledTrip?.tripDistance ?? '',
                          size: 14.0,
                          color: blackColor,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.lock_clock,
                          color: blackColor,
                        ),
                        width2,
                        customTextWidget(
                          text: scheduledTrip?.tripDuration ?? '',
                          size: 14.0,
                          color: blackColor,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                    customTextWidget(
                      text: scheduledTrip?.tripAmount ?? '',
                      size: 18.0,
                      color: greenshade900,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
                height10,
                customTextWidget(
                  text:
                  "${AppLocalizations.of(context)!.extraKm} - ${scheduledTrip?.extraKm ?? ''}   |  ${AppLocalizations.of(context)!.extraMinutes} - ${scheduledTrip?.extraTime ?? ''}",
                  size: 15.0,
                  color: textGrey,
                  weight: FontWeight.normal,
                ),
                height05,
                customTextWidget(
                  text:
                  "${AppLocalizations.of(context)!.baseFare} - ${scheduledTrip?.baseFare ?? ''}   | ${scheduledTrip?.baseTime ?? ''}",
                  size: 15.0,
                  color: textGrey,
                  weight: FontWeight.normal,
                ),
                height05,
              ],
            ),
          ),
        ),
        height10,
        ListTile(
          isThreeLine: false,
          leading: CircleAvatar(
            radius: 5.0,
            backgroundColor: blackColor,
          ),
          title: customTextWidget(
            text: AppLocalizations.of(context)!.pickupLocation,
            size: 14.0,
            color: textGrey,
            weight: FontWeight.normal,
          ),
          subtitle: customTextWidget(
            text: scheduledTrip?.pickUpLocation ?? '',
            size: 16.0,
            color: blackColor,
            weight: FontWeight.bold,
          ),
          trailing: SizedBox(
            height: 40,
            width: 40,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyQrCodeForTrip(),
                  ),
                );
              },
              child: Image(
                image: AssetImage(qr1),
              ),
            ),
          ),
        ),
        ListTile(
          isThreeLine: false,
          leading: CircleAvatar(
            radius: 5.0,
            backgroundColor: redColor,
          ),
          title: customTextWidget(
            text: AppLocalizations.of(context)!.dropLocation,
            size: 14.0,
            color: textGrey,
            weight: FontWeight.normal,
          ),
          subtitle: customTextWidget(
            text: scheduledTrip?.dropLocation ?? '',
            size: 16.0,
            color: blackColor,
            weight: FontWeight.bold,
          ),
        ),
        height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: CustomButtonOnlyBorder(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReasonsForCancel(tripData: RideRequestSuccessModal(),),
                    ),
                  );
                },
                title: AppLocalizations.of(context)!.cancelRide,
                border: true,
                optionalTextColor: blackColor,
              ),
            ),
            width20,
            Expanded(
              child: CustomTextButton(
                text: AppLocalizations.of(context)!.reSchedule,
                color: blueMain,
                callBack: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const ScheduledHomeScreen(),
                    ),
                  );
                },
                textColor: whiteColor,
                border: 0.0,
                fontSize: 18.0,
                borderColor: transperentColor,
              ),
            ),
          ],
        ),
        height20,
        const Divider(
          thickness: 2,
        ),
        height35,
      ],
    );*/

  }


  buildText(String title, String value){
    return Text(
      "$title - $value",
      style: tsRegularBoldGrey);

  }
}
