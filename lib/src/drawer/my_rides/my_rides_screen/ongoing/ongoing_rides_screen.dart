import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../../imports.dart';

class OngoingRides extends StatelessWidget {
  const OngoingRides({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DriverOnTheWayProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        DriverOnTheWayDataModel? driverOnTheWayData =
            provider.driverOntheawayDetails;
        return Column(
          children: [
            height05,
            Image(
              image: AssetImage(mapLogo),
            ),
            height10,
            customTextWidget(
              text:
                  AppLocalizations.of(context)!.driverReachedYourPickupLocation,
              size: 18.0,
              color: blackColor,
              weight: fontWeight500,
            ),
            height15,
            ListTile(
              isThreeLine: true,
              leading: CircleAvatar(
                backgroundColor: whiteColor,
                radius: 26,
                backgroundImage:
                    NetworkImage(driverOnTheWayData?.driverPhoto ?? ''),
              ),
              title: customTextWidget(
                text: driverOnTheWayData?.driverName ?? '',
                size: 15.0,
                color: Colors.black,
                weight: bold,
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: starColor,
                    size: 20.0,
                  ),
                  width5,
                  customTextWidget(
                    text: driverOnTheWayData?.driverRating ?? '',
                    size: 12.0,
                    color: textGrey,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                color: lightGrey,
                child: Column(
                  children: [
                    customTextWidget(
                      text: driverOnTheWayData?.tripDistance ?? '',
                      size: 15.0,
                      color: blackColor,
                      weight: bold,
                    ),
                    customTextWidget(
                      text: driverOnTheWayData?.tripTime ?? '',
                      size: 12.0,
                      color: textGrey,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: CircleAvatar(
                backgroundColor: whiteColor,
                radius: 26,
                backgroundImage:
                    NetworkImage(driverOnTheWayData?.vehiclePhoto ?? ''),
              ),
              title: customTextWidget(
                text: driverOnTheWayData?.vehicleModel ?? '',
                size: 15.0,
                color: blackColor,
                weight: bold,
              ),
              subtitle: customTextWidget(
                text: driverOnTheWayData?.vehicleNumber ?? '',
                size: 12.0,
                color: textGrey,
                weight: FontWeight.w700,
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  customTextWidget(
                    text: driverOnTheWayData?.tripAmount ?? '',
                    size: 15.0,
                    color: blackColor,
                    weight: bold,
                  ),
                  customTextWidget(
                    text: AppLocalizations.of(context)!.conditionApply,
                    size: 12.0,
                    color: textGrey,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            Container(
              margin: horizontalPadding20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: lightBlue,
                    radius: 22.0,
                    child: Icon(
                      Icons.local_post_office,
                      color: blueMain,
                      size: 30,
                    ),
                  ),
                  Consumer<OngoingRiderProvider>(
                    builder: (BuildContext context, provider, Widget? child) {
                      return InkWell(
                        onTap: () {
                          provider.shareFunction();
                        },
                        child: CircleAvatar(
                          backgroundColor: lightBlue,
                          radius: 21.0,
                          child: Icon(
                            Icons.share,
                            color: blueMain,
                            size: 30,
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SosPage(),
                          ));
                    },
                    child: Image(
                      height: 43,
                      width: 43,
                      image: AssetImage(
                        sos,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            height25,
            Padding(
              padding: symmetricpadding8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 9.0, horizontal: 30.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      side: BorderSide(color: textGrey),
                      backgroundColor: whiteColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TripID(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          height: 30,
                          width: 30,
                          image: AssetImage(
                            call,
                          ),
                        ),
                        width10,
                        customTextWidget(
                          text: AppLocalizations.of(context)!.callDriver,
                          size: 18.0,
                          color: blackColor,
                          weight: bold,
                        ),
                      ],
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
            ),
            height30,
          ],
        );
      },
    );
  }
}
