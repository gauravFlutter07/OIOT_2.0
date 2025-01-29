import '../../../../imports.dart';
import '../../../../models/basic_fare_modal.dart';
import 'model/searched_driver_list_modal.dart';

class DriverSearchingPage extends StatelessWidget {
  final List<Driver> drivers;
  final VehicleCategory vehicleCategoryModal;
  const DriverSearchingPage({super.key, required this.drivers, required this.vehicleCategoryModal});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DriverSearchingProvider(),
      child: _DriverSearchingPage(drivers, vehicleCategoryModal),
    );
  }
}

class _DriverSearchingPage extends StatelessWidget {
  final List<Driver> drivers;
  final VehicleCategory vehicleCategoryModal;
  const _DriverSearchingPage(this.drivers, this.vehicleCategoryModal);

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<DriverSearchingProvider>(context);

    return Scaffold(
      body: Consumer<DriverSearchingProvider>(
        builder: (context, provider, child) {
          List<Driver>? driverList = drivers;
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: padding10,
                  child: CustomHeader(
                    title: AppLocalizations.of(context)!.driverSearching,
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: Center(
                    child: Text(
                      '${AppLocalizations.of(context)!.remainingTime}: ${timerProvider.remainingSeconds} ${AppLocalizations.of(context)!.seconds}',
                      style: tsRegularBoldGrey,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      Driver drivers = driverList[index];
                      return Card(
                        color: whiteColor,
                        child: Container(
                          padding: padding10,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: whiteColor,
                                    radius: 40,
                                    backgroundImage:
                                        const NetworkImage("https://cdn-icons-png.flaticon.com/128/149/149071.png"),
                                  ),
                                  width10,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${drivers.firstName??''} ${drivers.lastName??''}",
                                          style: tsRegularBold,
                                        ),
                                        height05,
                                        Row(
                                          children: [
                                            Text(
                                                '${AppLocalizations.of(context)!.rating} -'),
                                            const Icon(Icons.star,
                                                color: Colors.amber, size: 17),
                                            Text(
                                              drivers.ratings?.rating.toString()??"-",
                                              style: tsRegularBold,
                                            ),
                                          ],
                                        ),
                                        height02,
                                        Text(
                                          '${AppLocalizations.of(context)!.model} - ${drivers.vehicleType}',
                                          style: tsSmall,
                                        ),
                                        Text(
                                          '${AppLocalizations.of(context)!.vehiclenumber} - ${drivers.vehicleNumber}',
                                          style: tsSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '${drivers.driverWillCome} ${AppLocalizations.of(context)!.away}'),
                                      Card(
                                        color: Colors.amber.shade400,
                                        child: Padding(
                                          padding: padding5,
                                          child: Text(
                                            /*'${drivers.discount} ${AppLocalizations.of(context)!.discount}'*/"-",
                                            style: tsSmall,
                                          ),
                                        ),
                                      ),
                                      height05,
                                      Text(AppLocalizations.of(context)!
                                          .dicountPrice),
                                      Row(
                                        children: [
                                          Text(
                                            "-",
                                            style: tsRegularBoldRedlinethrough,
                                          ),
                                          width5,
                                          Text(
                                            /*'₹${int.parse(drivers.gender.replaceAll('₹', '')) * (100 - int.parse(drivers.discount.replaceAll('%', ''))) ~/ 100}'*/"-",
                                            style: tsRegularBoldGreen,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              height05,
                              if (timerProvider.showProgress)
                                LinearProgressIndicator(
                                  color: black54,
                                  value:
                                      1 - (timerProvider.remainingSeconds / 30),
                                  minHeight: 10,
                                ),
                              height15,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: greyShade200,
                                        foregroundColor: blackColor),
                                    onPressed: () {
                                      // reject
                                    },
                                    child: Text(
                                        AppLocalizations.of(context)!.reject),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: blueMain,
                                      foregroundColor: whiteColor,
                                    ),
                                    onPressed: () {
                                      provider.postSelectedDriver(context, drivers,vehicleCategoryModal);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.select,
                                    ),
                                  ),
                                ],
                              ),
                              height15,
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: driverList.length??0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
