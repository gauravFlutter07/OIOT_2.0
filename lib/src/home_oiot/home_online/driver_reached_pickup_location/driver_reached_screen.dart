import '../../../../imports.dart';

class DriverReachedScreen extends StatelessWidget {
  const DriverReachedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mapBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: DraggableScrollableSheet(
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollController) {
              return Consumer<DriverOnTheWayProvider>(
                builder: (BuildContext context, provider, Widget? child) {
                  DriverOnTheWayDataModel? driverOnTheWayData =
                      provider.driverOntheawayDetails;
                  return Container(
                    color: whiteColor,
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: whiteColor,
                          ),
                          child: Padding(
                            padding: horizontalPadding10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                height20,
                                Text(
                                  AppLocalizations.of(context)!
                                      .driverReachedYourPickupLocation,
                                  style: tsLargeBold,
                                ),
                                height10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: whiteColor,
                                          radius: 26,
                                          backgroundImage: NetworkImage(
                                              driverOnTheWayData?.driverPhoto ??
                                                  ''),
                                        ),
                                        title: Text(
                                          driverOnTheWayData?.driverName ?? '',
                                          style: tsRegularBold,
                                        ),
                                        subtitle: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            Text(driverOnTheWayData
                                                    ?.driverRating ??
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
                                              driverOnTheWayData
                                                      ?.tripDistance ??
                                                  '',
                                              style: tsSmallBold,
                                            ),
                                            Text(
                                              driverOnTheWayData?.tripTime ??
                                                  '',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: whiteColor,
                                          radius: 26,
                                          backgroundImage: NetworkImage(
                                              driverOnTheWayData
                                                      ?.vehiclePhoto ??
                                                  ''),
                                        ),
                                        title: Text(
                                          driverOnTheWayData?.vehicleModel ??
                                              '',
                                          style: tsRegularBold,
                                        ),
                                        subtitle: Text(
                                            driverOnTheWayData?.vehicleNumber ??
                                                ''),
                                      ),
                                    ),
                                    Padding(
                                      padding: rightPadding5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              driverOnTheWayData?.tripAmount ??
                                                  '',
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
                                height15,
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
                                          driverOnTheWayData?.pickUpLocation ??
                                              '',
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
                                          AppLocalizations.of(context)!
                                              .dropLocation,
                                          style: tsRegular,
                                        ),
                                        subtitle: Text(
                                          driverOnTheWayData?.dropLocation ??
                                              '',
                                          style: tsRegularBold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: leftPadding10,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            blueMain.withOpacity(0.2),
                                        child: Icon(
                                          Icons.email,
                                          color: blueMain,
                                        ),
                                      ),
                                      width20,
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SosPage(),
                                              ));
                                        },
                                        child: Image.asset(
                                          sos,
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                      width20,
                                      InkWell(
                                        onTap: () {
                                          provider.shareFunction();
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              blueMain.withOpacity(0.2),
                                          child: Icon(
                                            Icons.share_outlined,
                                            color: blueMain,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: darkWhiteBackground,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: padding8,
                                          child: Column(
                                            children: [
                                              Text(
                                                driverOnTheWayData?.tripOtp ??
                                                    '',
                                                style: TextStyle(
                                                  color: darkBlack,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .otp,
                                                style: tsSmallGrey,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                height30,
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: textDarkGrey,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.5, horizontal: 25),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const TripID(),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                call,
                                                height: 32,
                                                width: 33,
                                              ),
                                              width5,
                                              Text(
                                                  AppLocalizations.of(context)!
                                                      .callDriver,
                                                  style: tsRegularBold),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25),
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
                                          title: AppLocalizations.of(context)!
                                              .support,
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
                        ),
                        height05,
                      ],
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
