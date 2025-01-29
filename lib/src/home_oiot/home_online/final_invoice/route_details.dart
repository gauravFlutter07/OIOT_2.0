import '../../../../imports.dart';

class RouteDetails extends StatelessWidget {
  const RouteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DriverOnTheWayProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        DriverOnTheWayDataModel? driverOnTheWayData =
            provider.driverOntheawayDetails;
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: horizontalPadding10,
                child: Column(
                  children: [
                    CustomHeader(
                        title: AppLocalizations.of(context)!.routeDetails),
                    height20,
                    Image.asset(
                      mapBackground,
                      height: 400,
                      width: 200,
                    ),
                    height40,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: darkWhiteBackground,
                              child: Icon(
                                Icons.location_on,
                                color: blueMain,
                              ),
                            ),
                            Container(
                              height: 100,
                              color: const Color(0xFFa8a8a8),
                              width: 2,
                            ),
                            CircleAvatar(
                              backgroundColor: darkWhiteBackground,
                              child: Icon(
                                Icons.location_on,
                                color: blueMain,
                              ),
                            ),
                          ],
                        ),
                        width10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.pickupLocation,
                              style: const TextStyle(
                                color: Color(0xFFa8a8a8),
                                fontSize: 18,
                              ),
                            ),
                            height10,
                            Text(
                              driverOnTheWayData?.pickUpLocation ?? '',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            height20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Start date & time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                width5,
                                Text(
                                  '${driverOnTheWayData?.tripStartDate ?? ''} | ${driverOnTheWayData?.tripStartTime ?? ''}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFa8a8a8),
                                  ),
                                ),
                              ],
                            ),
                            height10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'End date & time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                width5,
                                Text(
                                  '${driverOnTheWayData?.tripEndDate ?? ''} | ${driverOnTheWayData?.tripEndTime ?? ''}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFa8a8a8),
                                  ),
                                ),
                              ],
                            ),
                            height30,
                            Text(
                              AppLocalizations.of(context)!.dropLocation,
                              style: const TextStyle(
                                color: Color(0xFFa8a8a8),
                                fontSize: 18,
                              ),
                            ),
                            height10,
                            Text(
                              driverOnTheWayData?.dropLocation ?? '',
                              style: tsRegularBold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    height15,
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF242a38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.fiber_manual_record_outlined,
                                      size: 28,
                                      color: whiteColor,
                                    ),
                                    width5,
                                    Text(
                                      driverOnTheWayData?.tripDistance ?? '',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: whiteColor,
                                    ),
                                    width5,
                                    Text(
                                      driverOnTheWayData?.tripTime ?? '',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      driverOnTheWayData?.tripAmount ?? '',
                                      style: TextStyle(
                                        color: mainGreen,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    height10,
                    Text(
                      'Booking ID ${driverOnTheWayData?.tripId ?? ''}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    height10,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
