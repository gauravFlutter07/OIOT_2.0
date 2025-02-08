import 'package:firebase_database/firebase_database.dart';
import 'package:oiot/src/home_oiot/home_online/driver_searching_page/model/ride_request_success_modal.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../imports.dart';

class DriverReachedScreen extends StatelessWidget {
  final RideRequestSuccessModal tripData;

  const DriverReachedScreen({super.key, required  this.tripData});

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

              return Consumer<PickupProvider>(
                builder: (BuildContext context, provider, Widget? child) {

                  var data = provider.estimatedModal;
                  var driverData = provider.selectedDriver;
                  print('Estimation Data: ${data?.toJson().toString()} ');

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
                                          backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/149/149071.png'),
                                        ),
                                        title: Text(
                                          driverData?.firstName.toString()??'NA',
                                          style: tsRegularBold,
                                        ),
                                        subtitle: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            Text(driverData?.ratings?.nos.toString()??''
                                            ),
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
                                              data?.distanceDetails?.distanceLabel??'NA',
                                              style: tsSmallBold,
                                            ),
                                            Text(
                                              data?.distanceDetails?.timeValue.toString()??'NA',

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
                                            "${ApiEndUrl.imageBaseUrl} ${data?.vehicleDetailsAndFare?.vehicleDetails?.image??''}",),
                                        ),
                                        title: Text(
                                          driverData?.vehicleType??'NA',
                                          style: tsRegularBold,
                                        ),
                                        subtitle: Text(
                                          driverData?.vehicleNumber??'NA',),
                                      ),
                                    ),
                                    Padding(
                                      padding: rightPadding5,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              data?.vehicleDetailsAndFare?.fareDetails?.totalFare??'NA',
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
                                          data?.distanceDetails?.from??'NA',
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
                                          data?.distanceDetails?.to??'NA',
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
                                          // provider.shareFunction();
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
                                                tripData.otp??'NA',
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
                                          onTap: () async {
                                            var mobileNo = driverData?.phone;

                                            if(mobileNo!=null){
                                              final String call = 'tel:$mobileNo';

                                              if (await canLaunch(call)) {
                                                await launch(call);
                                              }
                                            }else{
                                              Fluttertoast.showToast(msg: 'No mobile no found');
                                            }

                                            /*Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TripID(),
                                                  ),
                                                );*/
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
