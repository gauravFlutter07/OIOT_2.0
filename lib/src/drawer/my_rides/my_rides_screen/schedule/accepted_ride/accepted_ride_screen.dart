import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../../../imports.dart';

class AcceptedRide extends StatelessWidget {
  const AcceptedRide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding8,
        child: Card(
          elevation: 1,
          color: whiteColor,
          child: Padding(
            padding: padding10,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Consumer<AcceptedRidePovider>(
                builder: (BuildContext context, provider, Widget? child) {
                  AcceptedRideModel? acceptedRide =
                      provider.acceptedRideDetails;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: whiteColor,
                                radius: 26,
                                backgroundImage: NetworkImage(
                                    acceptedRide?.driverPhoto ?? ''),
                              ),
                              title: Text(
                                acceptedRide?.driverName ?? '',
                                style: tsRegular,
                              ),
                              subtitle: Text('⭐ ${acceptedRide?.driverRating}'),
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
                                    acceptedRide?.tripTime ?? '',
                                    style: tsRegular,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.minutes,
                                    style: tsExtraSmallGrey,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: whiteColor,
                                radius: 26,
                                backgroundImage: NetworkImage(
                                    acceptedRide?.vehiclePhoto ?? ''),
                              ),
                              title: Text(
                                acceptedRide?.vehicleModel ?? '',
                                style: tsSmallBold,
                              ),
                              subtitle: Text(acceptedRide?.vehicleNumber ?? ''),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                acceptedRide?.tripAmount ?? '',
                                style: tsSmall,
                              ),
                              Text(
                                AppLocalizations.of(context)!.conditionApply,
                                style: tsExtraSmallGrey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: backgroundGrey,
                      ),
                      Row(
                        children: [
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
                                AppLocalizations.of(context)!.pickupLocation,
                                style: tsSmallGrey,
                              ),
                              subtitle: Text(
                                acceptedRide?.pickUpLocation ?? '',
                                style: tsRegularBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
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
                                style: tsSmallGrey,
                              ),
                              subtitle: Text(
                                acceptedRide?.dropLocation ?? '',
                                style: tsRegularBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: darkWhiteBackground,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    acceptedRide?.tripTime ?? '',
                                    style: tsSmall,
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
                                    acceptedRide?.tripAmount ?? '',
                                    style: tsSmall,
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
                                    acceptedRide?.tripDistance ?? '',
                                    style: tsSmall,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      height05,
                      Padding(
                        padding: padding8,
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
                                provider.shareFunction();
                              },
                              child: CircleAvatar(
                                backgroundColor: blueMain.withOpacity(0.2),
                                child: Icon(
                                  Icons.share_outlined,
                                  color: blueMain,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SosPage(),
                                    ));
                              },
                              child: Image.asset(
                                sos,
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      height10,
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TripID(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: const Color(0xFFa8a8a8),
                                  width: 1.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 25),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      call,
                                      height: 32,
                                      width: 33,
                                    ),
                                    width7,
                                    Text(
                                      AppLocalizations.of(context)!.callDriver,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: CustomButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RaiseNewTicket(),
                                    ),
                                  );
                                },
                                title: AppLocalizations.of(context)!.support,
                                border: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      height15,
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
