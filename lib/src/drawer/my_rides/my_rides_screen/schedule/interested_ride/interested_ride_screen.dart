import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../../../imports.dart';

class InterestedRide extends StatelessWidget {
  const InterestedRide({super.key});

  @override
  Widget build(BuildContext context) {
    //   return Scaffold(
    //     body: Consumer<InterestedDriverProvider>(
    //         builder: (BuildContext context, provider, Widget? child) {
    //       List<InterestedDriverModel> interestedDriverList =
    //           provider.interestedDriverList;

    //       if (provider.interestedDriverList == null ||
    //           provider.interestedDriverList!.isEmpty) {
    //         return const Center(child: Text("No Interested Drivers Available"));
    //       } // no data found block
    //       return ListView.separated(
    //         separatorBuilder: (context, index) {
    //           return height10;
    //         },
    //         itemCount: interestedDriverList.length,
    //         itemBuilder: (context, index) {
    //           InterestedDriverModel drivers = interestedDriverList[index];
    //           return Card(
    //             color: whiteColor,
    //             elevation: 2,
    //             margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    //             child: ListTile(
    //               leading: CircleAvatar(
    //                 backgroundColor: whiteColor,
    //                 radius: 26,
    //                 backgroundImage: NetworkImage(drivers.drivePhoto),
    //               ),
    //               title: Text(drivers.driverName),
    //               subtitle: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                       '${AppLocalizations.of(context)!.mobileNumber}: ${drivers.mobileNumber}'),
    //                   Text(
    //                       '${AppLocalizations.of(context)!.model}: ${drivers.carModel}'),
    //                   Row(
    //                     children: [
    //                       Icon(
    //                         Icons.star,
    //                         color: starColor,
    //                       ),
    //                       Text(
    //                           '${AppLocalizations.of(context)!.rating}: ${drivers.rating}'),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               trailing: Text(
    //                 drivers.price,
    //                 style: tsRegularBoldGreen,
    //               ),
    //               onTap: () {},
    //             ),
    //           );
    //         },
    //       );
    //     }),
    //   );
    // }

    return Consumer<InterestedDriverProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: black87,
                          border: Border.all(color: lightGreyColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Trip Details",
                                style: TextStyle(fontSize: 20, color: whiteColor),
                              ),
                              Text("Booking No : 255",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: whiteColor,
                                  ))
                            ],
                          ),
                          height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sheduled On: 5-2-2025 5:21",
                                  style: TextStyle(color: whiteColor))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sheduled - daily - seden -OIOT",
                                  style: TextStyle(color: whiteColor))
                            ],
                          ),
                          height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Estimated Fare Details",
                                  style: TextStyle(fontSize: 20, color: whiteColor))
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.timer_sharp,
                                color: white54,
                                size: 18,
                              ),
                              Text("9.40",
                                  style: TextStyle(color: whiteColor)), //add km
                              width60,
                              Icon(
                                Icons.watch_later_outlined,
                                color: white54,
                                size: 18,
                              ),
                              Text(" 32min",
                                  style: TextStyle(color: whiteColor)), //add mins
                              width60,
                              Icon(
                                Icons.currency_rupee_rounded,
                                color: white54,
                                size: 18,
                              ),
                              Text("323.00", style: TextStyle(color: whiteColor))
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Extra Km- 0Km - 115",
                                  style: TextStyle(color: whiteColor))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Extra Min- 2Mins - 0",
                                  style: TextStyle(color: whiteColor))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Base Fare- 22KM | 10 Mins -100",
                                  style: TextStyle(color: whiteColor))
                            ],
                          ),
                        ],
                      )),
                  //main card container end
                  height20,
                  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.green,
                                    ),
                                    width5,
                                    Expanded(
                                      child: Text(
                                          AppLocalizations.of(context)!.pickupLocation,
                                          style: tsRegularGrey),
                                    ),
                                  ],
                                ),
                                height10,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                  child: Text(
                                      "Trip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip Data",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: tsRegular),
                                ),
                                height20,
                                //end pickup location
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.redAccent,
                                    ),
                                    width5,
                                    Expanded(
                                      child: Text(
                                          AppLocalizations.of(context)!.pickupLocation,
                                          style: tsRegularGrey),
                                    ),
                                  ],
                                ),
                                height10,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                  child: Text(
                                      "Trip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip DataTrip Data",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: tsRegular),
                                ),
                                //end drop location
                              ],
                            ),
                          ),
                        ],
                      )),
                  //main address container end

                  height10,
                  CustomButton(onTap: () {}, title: "CANCEL", border: false),
                  height10,
                  CustomButton(
                    onTap: () {},
                    title: "INTRESTED",
                    border: false,
                  ),
                  height10,
                  Container(
                    height: 400,
                    child: ListView.separated(
                      itemCount: 8,
                      separatorBuilder: (context, index) {
                        return height10;
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              border: Border.all(color: lightGreyColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    const CircleAvatar(
                                      radius: 26,
                                      backgroundImage: NetworkImage(
                                          "https://icons.veryicon.com/png/o/internet--web/webapp-1/user-login-2.png"),
                                    ),
                                    height05,
                                    Text("⭐ $index")
                                  ],
                                ), //leading column
                                const Spacer(
                                  flex: 1,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Vijay Kuman"),
                                    Text("KA50A9996"),
                                    Text("Sedan")
                                  ],
                                ), //title column
                                const Spacer(
                                  flex: 2,
                                ),
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: CustomButton(
                                          onTap: () {
                                            print("The Selected index Is $index");
                                          },
                                          title: "SELECT",
                                          border: false),
                                    ),
                                    height05,
                                    Text(
                                      "15 Min",
                                      style: tsRegular,
                                    )
                                  ],
                                ), //trailing
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            //main column end
          );
        });
  }
}
