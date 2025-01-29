import 'package:oiot/src/home_oiot/home_online/cancel_trip_page/cancel_trip_controller.dart';
import 'package:oiot/src/home_oiot/home_online/driver_searching_page/model/ride_request_success_modal.dart';
import '../../../../imports.dart';

class ReasonsForCancel extends StatelessWidget {
  final RideRequestSuccessModal tripData;
  const ReasonsForCancel({super.key, required this.tripData,});

  /// * normal comment
  /// ! alerts
  /// ? blue color comment
  /// todo: eg-need to call api

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomHeader(
                    title: AppLocalizations.of(context)!.somethingWentWrong),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    ReasonItem(
                      reason:
                          AppLocalizations.of(context)!.acceptedTripByAccident,
                    ),
                    ReasonItem(
                      reason:
                          AppLocalizations.of(context)!.problemWithPickupRoute,
                    ),
                    ReasonItem(
                      reason: AppLocalizations.of(context)!.notSafeToPickUp,
                    ),
                    ReasonItem(
                      reason: AppLocalizations.of(context)!.heavyRainCantGoOut,
                    ),
                    ReasonItem(
                      reason: AppLocalizations.of(context)!
                          .taxiArrivalDelayedSignificantly,
                    ),
                    ReasonItem(
                      reason: AppLocalizations.of(context)!
                          .forgotAnEssentialItemAndNeedToReturnHome,
                    ),
                    ReasonItem(
                      reason: AppLocalizations.of(context)!
                          .feelingUnwellAndPreferToStayHome,
                    ),
                    height10,
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText:
                            AppLocalizations.of(context)!.otherIssuesIfAny,
                      ),
                      onChanged: (value) {
                        Provider.of<SelectedReasonProvider>(context,
                                listen: false)
                            .setSelectedReason(value);
                      },
                    ),
                    height125,
                    CustomButton(
                      onTap: () {
                        final provider =
                            Provider.of<SelectedReasonProvider>(context,
                                    listen: false);
                              var selectedReason =   provider.selectedReason;

                        if (selectedReason != null &&
                            selectedReason.isNotEmpty) {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  constraints: BoxConstraints(
                                    minHeight:
                                        MediaQuery.of(context).size.height *
                                            0.3,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .finalConfirmation,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade900,
                                        ),
                                      ),
                                      height10,
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${AppLocalizations.of(context)!.tripReasonConfirmation} -  ",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: fontWeight400,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            TextSpan(
                                              text: selectedReason,
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: fontWeight500,
                                                color: blackColor,
                                              ),
                                            ),
                                            const TextSpan(
                                              text: "?",
                                            ),
                                          ],
                                        ),
                                      ),
                                      height30,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              // ignore: deprecated_member_use
                                              backgroundColor:
                                                  Colors.grey.shade200,
                                            ),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .cancel,
                                              style: TextStyle(
                                                color: blackColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          width30,
                                          ElevatedButton(
                                            onPressed: () {
                                              provider.cancelTrip(context, tripData!);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              // ignore: deprecated_member_use
                                              backgroundColor:
                                                  Colors.grey.shade900,
                                            ),
                                            child: Text(
                                              AppLocalizations.of(context)!.ok,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: whiteColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(AppLocalizations.of(context)!
                                  .pleaseSelectOrEnteraReason),
                            ),
                          );
                        }
                      },
                      title: AppLocalizations.of(context)!.ok,
                      border: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReasonItem extends StatelessWidget {
  final String reason;

  const ReasonItem({
    super.key,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedReasonProvider>(
        builder: (BuildContext context, provider, Widget? child) {
      return ListTile(
        title: Text(
          reason,
          style: TextStyle(
            color: provider.selectedReason == reason ? blackColor : textGrey,
            fontWeight: provider.selectedReason == reason
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        onTap: () {
          Provider.of<SelectedReasonProvider>(context, listen: false)
              .setSelectedReason(reason);
        },
      );
    });
  }
}
