import '../../../../../imports.dart';

class ScheduledTab extends StatelessWidget {
  const ScheduledTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: padding12,
          child: Consumer<ScheduledRideProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              List<ScheduledRideModel?> scheduledTripData =
                  provider.scheduledTrip;
              return ChangeNotifierProvider(
                create: (_) => ScheduledRideTabProvider(),
                child: Column(
                  children: scheduledTripData.map((scheduledTrip) {
                    return Column(
                      children: [
                        Container(
                          margin: horizontalPadding10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              height05,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Chip(
                                    backgroundColor: blueGreyshade50,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    label: customTextWidget(
                                      text:
                                          "${scheduledTrip?.serviceType ?? ''} - ${scheduledTrip?.vehicleType ?? ''}",
                                      size: 15.0,
                                      color: blackColor,
                                      weight: FontWeight.normal,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final provider = Provider.of<
                                                  ScheduledRideTabProvider>(
                                              context,
                                              listen: false);
                                          final pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate:
                                                provider.selectedDate ??
                                                    DateTime.now(),
                                            firstDate: DateTime(2022),
                                            lastDate: DateTime(2026),
                                          );

                                          if (pickedDate != null &&
                                              scheduledTrip != null) {
                                            provider.updateTripDate(
                                                scheduledTrip, pickedDate);
                                          }
                                        },
                                        child: Card(
                                          color: blueGreyshade50,
                                          child: Padding(
                                            padding: padding8,
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .changeDate,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final provider = Provider.of<
                                                  ScheduledRideTabProvider>(
                                              context,
                                              listen: false);
                                          final pickedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime:
                                                provider.selectedTime ??
                                                    TimeOfDay.now(),
                                          );

                                          if (pickedTime != null &&
                                              scheduledTrip != null) {
                                            // ignore: use_build_context_synchronously
                                            provider.updateTripTime(
                                                scheduledTrip,
                                                pickedTime,
                                                context);
                                          }
                                        },
                                        child: Card(
                                          color: greenShade50,
                                          child: Padding(
                                            padding: padding8,
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .changeTime,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              ListTile(
                                visualDensity: const VisualDensity(
                                    horizontal: 0, vertical: -4),
                                isThreeLine: true,
                                title: customTextWidget(
                                  text:
                                      "${AppLocalizations.of(context)!.idNumber} - ${scheduledTrip?.tripId ?? ''}",
                                  size: 15.0,
                                  color: blackColor,
                                  weight: FontWeight.w500,
                                ),
                                subtitle: customTextWidget(
                                  text: "",
                                  size: 14.0,
                                  color: blackColor,
                                  weight: FontWeight.normal,
                                ),
                                trailing: Column(
                                  children: [
                                    customTextWidget(
                                      text: scheduledTrip?.tripDate ?? '',
                                      size: 14.0,
                                      color: blackColor,
                                      weight: FontWeight.w400,
                                    ),
                                    customTextWidget(
                                      text: scheduledTrip?.tripTime ?? '',
                                      size: 14.0,
                                      color: blackColor,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: whiteColor,
                                  radius: 26,
                                  backgroundImage: NetworkImage(
                                      scheduledTrip?.driverPhoto ?? ''),
                                ),
                                title: customTextWidget(
                                  text: scheduledTrip?.driverName ?? '',
                                  size: 16.0,
                                  color: blackColor,
                                  weight: bold,
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
                              ),
                              height05,
                              Container(
                                decoration: BoxDecoration(
                                  color: blueGreyshade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: padding15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        customTextWidget(
                                          text: scheduledTrip?.tripKmAway ?? '',
                                          size: 14.0,
                                          color: blackColor,
                                          weight: FontWeight.normal,
                                        ),
                                        customTextWidget(
                                          text:
                                              scheduledTrip?.driverReachTime ??
                                                  '',
                                          size: 14.0,
                                          color: blackColor,
                                          weight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                    height05,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.timer,
                                              color: blackColor,
                                            ),
                                            customTextWidget(
                                              text:
                                                  scheduledTrip?.tripDistance ??
                                                      '',
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
                                            customTextWidget(
                                              text:
                                                  scheduledTrip?.tripDuration ??
                                                      '',
                                              size: 14.0,
                                              color: blackColor,
                                              weight: FontWeight.normal,
                                            ),
                                          ],
                                        ),
                                        customTextWidget(
                                          text: scheduledTrip?.tripAmount ?? '',
                                          size: 15.0,
                                          color: Colors.green.shade900,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                    height05,
                                    customTextWidget(
                                      text:
                                          "${AppLocalizations.of(context)!.extraKm} - ${scheduledTrip?.extraKm ?? ''}   |  ${AppLocalizations.of(context)!.extraMinutes} - ${scheduledTrip?.extraTime ?? ''}",
                                      size: 14.0,
                                      color: blackColor,
                                      weight: FontWeight.normal,
                                    ),
                                    height05,
                                    customTextWidget(
                                      text:
                                          "${AppLocalizations.of(context)!.baseFare} - ${scheduledTrip?.baseFare ?? ''}   | ${scheduledTrip?.baseTime ?? ''}",
                                      size: 14.0,
                                      color: blackColor,
                                      weight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ),
                              height10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    color: blueGreyshade50,
                                    child: Padding(
                                      padding: padding8,
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .changePickupLocation,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: greenShade50,
                                    child: Padding(
                                      padding: padding8,
                                      child: Text(AppLocalizations.of(context)!
                                          .changeDropLocation),
                                    ),
                                  ),
                                ],
                              ),
                              height05,
                              Stepper(
                                controlsBuilder: (context, controller) =>
                                    const Row(children: []),
                                physics: const NeverScrollableScrollPhysics(),
                                steps: [
                                  Step(
                                    isActive: true,
                                    state: StepState.indexed,
                                    title: ListTile(
                                      title: customTextWidget(
                                        text: AppLocalizations.of(context)!
                                            .pickupLocation,
                                        size: 15.0,
                                        color: textGrey,
                                        weight: FontWeight.normal,
                                      ),
                                      subtitle: customTextWidget(
                                        text:
                                            scheduledTrip?.pickUpLocation ?? '',
                                        size: 16.0,
                                        color: blackColor,
                                        weight: bold,
                                      ),
                                      trailing: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyQrCodeForTrip(),
                                              ),
                                            );
                                          },
                                          child: Image(
                                            image: AssetImage(qr1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    content: const SizedBox(),
                                  ),
                                  Step(
                                    isActive: false,
                                    state: StepState.indexed,
                                    title: ListTile(
                                      title: customTextWidget(
                                        text: AppLocalizations.of(context)!
                                            .dropLocation,
                                        size: 15.0,
                                        color: textGrey,
                                        weight: FontWeight.normal,
                                      ),
                                      subtitle: customTextWidget(
                                        text: scheduledTrip?.dropLocation ?? '',
                                        size: 16.0,
                                        color: blackColor,
                                        weight: bold,
                                      ),
                                    ),
                                    content: const SizedBox(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        height15,
                        const Divider(thickness: 2),
                        height15,
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
