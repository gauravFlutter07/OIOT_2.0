import 'package:firebase_database/firebase_database.dart';
import 'package:oiot/main.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/widgets/trip_completed.dart';
import 'package:oiot/src/home_oiot/home_online/trip_id/trip_controller.dart';
import '../../../../imports.dart';

class TripID extends StatelessWidget {
  const TripID({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mapBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: DraggableScrollableSheet(
            minChildSize: 0.40,
            maxChildSize: 1.00,
            builder: (BuildContext context, ScrollController scrollController) {


              return Consumer<PickupProvider>(
                builder: (context, provider, child){

                var data = provider.estimatedModal;
                var driverData = provider.selectedDriver;
                print('Estimation Data: ${data?.toJson().toString()} ');


                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: whiteColor,
                  ),
                  child: Padding(
                    padding: horizontalPadding10,
                    child: ListView(
                      controller: scrollController,
                      children: [
                        height15,
                        Text(
                            '${AppLocalizations.of(context)!.tripId} - NA}',
                            style: tsLargeBold),
                        height10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: whiteColor,
                                  radius: 26,
                                  backgroundImage: const NetworkImage(
                  "https://cdn-icons-png.flaticon.com/128/149/149071.png"),
                                ),
                                title: Text(
                                  driverData?.firstName??'NA',
                                  style: tsRegularBold,
                                ),
                                subtitle: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(driverData?.ratings?.nos?.toString() ??
                                        ''),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: darkWhiteBackground,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: padding8,
                                child: Column(
                                  children: [
                                    Text(
                                      data?.distanceDetails?.distanceLabel??"NA",
                                      style: tsSmallBold,
                                    ),
                                    Text(
                                      data?.distanceDetails?.timeLable??"NA",
                                      style: tsExtraSmallGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        height10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: whiteColor,
                                  radius: 26,
                                  backgroundImage:  NetworkImage(
                                    "${ApiEndUrl.imageBaseUrl} ${data?.vehicleDetailsAndFare?.vehicleDetails?.image??''}",
                                  ),
                                ),
                                title: Text(
                                  driverData?.vehicleType ?? '',
                                  style: tsRegularBold,
                                ),
                                subtitle: Text(
                                    driverData?.vehicleNumber ?? ''),
                              ),
                            ),
                            Padding(
                              padding: rightPadding5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                        data?.vehicleDetailsAndFare?.fareDetails
                                                ?.totalFare ??
                                            'NA',
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
                        height05,
                        const Divider(),
                        height05,
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
                                  data?.distanceDetails?.from ?? '',
                                  style: tsRegularBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height05,
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
                                  AppLocalizations.of(context)!.dropLocation,
                                  style: tsRegular,
                                ),
                                subtitle: Text(
                                  data?.distanceDetails?.to ?? '',
                                  style: tsRegularBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height15,
                        Padding(
                          padding: leftPadding10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: blueMain.withOpacity(0.2),
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
                                      builder: (context) => const SosPage(),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  sos,
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // provider.shareFunction();
                                },
                                child: CircleAvatar(
                                  backgroundColor: blueMain.withOpacity(0.2),
                                  child: Icon(
                                    Icons.share_outlined,
                                    color: blueMain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        height25,
                        Consumer<TripProvider>(
                          builder: (BuildContext context, tripProvider,
                              Widget? child) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.kmLeft,
                                      style: tsRegularBoldGrey,
                                    ),
                                    Text(
                                      tripProvider.totalKm.toString(),
                                      style: tsRegularBoldGrey,
                                    ),
                                  ],
                                ),
                                height05,
                                Container(
                                  width: double.infinity,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: backgroundGrey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: LinearProgressIndicator(
                                      backgroundColor: backgroundGrey,
                                      valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                          blueMain),
                                      value: tripProvider.progressValue,
                                    ),
                                  ),
                                ),
                                height20,
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.timeLeft,
                                      style: tsRegularBoldGrey,
                                    ),
                                    Text(
                                      tripProvider.totalMinutes.toString(),
                                      style: tsRegularBoldGrey,
                                    ),
                                  ],
                                ),
                                height05,
                                Container(
                                  width: double.infinity,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: backgroundGrey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: LinearProgressIndicator(
                                      backgroundColor: backgroundGrey,
                                      valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                          blueMain),
                                      value: tripProvider.progressValue,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        height40,
                        Row(
                          children: [
                            Expanded(
                              child: CustomButtonOnlyBorder(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TripCompleted(),
                                    ),
                                  );
                                },
                                title:
                                AppLocalizations.of(context)!.destination,
                                border: true,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                                  title:
                                  AppLocalizations.of(context)!.support,
                                  optionalTextColor: darkWhiteBackground,
                                  border: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height20,
                      ],
                    ),
                  ),
                );
                },
              );

            },
          ),
        ),
      ),
    );
  }
}
