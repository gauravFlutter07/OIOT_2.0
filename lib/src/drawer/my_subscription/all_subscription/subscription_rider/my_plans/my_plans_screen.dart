import 'dart:developer';
import '../../../../../../imports.dart';

class MyPlanWidget extends StatelessWidget {
  const MyPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = context.read<MyPlansProvider>();
    int totalDays = 30;
    int remainingDays = 20;
    double percentage =
        subscriptionProvider.calculatePercentage(remainingDays, totalDays);
    return Consumer<MyPlansProvider>(
      builder: (context, provider, child) {
        MyPlansModel? myplansData = provider.myPlansData;

        return Column(
          children: [
            height15,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  AppLocalizations.of(context)!.currentSubscription,
                  style: tsRegularBold,
                ),
              ),
            ),
            Card(
              color: whiteColor,
              child: Padding(
                padding: padding15,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)!.standardPlan} - 365 days',
                              style: tsRegularBold,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              myplansData?.standardPlan ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    remainingDays < 1 ? blueMain : greenColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${myplansData?.remainingDays ?? ''} - ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: bold,
                            color: remainingDays < 1 ? redColor : greenColor,
                          ),
                        ),
                        Text(
                          'left of ${myplansData?.annualPlanDays ?? ''}',
                          style: tsSmallBoldGrey,
                        ),
                      ],
                    ),
                    height10,
                    ClipRRect(
                      borderRadius: circularBorderRadius5,
                      child: LinearProgressIndicator(
                        minHeight: 10.0,
                        value: percentage,
                        backgroundColor: blackColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          percentage < .20
                              ? orangeColor
                              : percentage < .50
                                  ? yellowColor
                                  : blueMain,
                        ),
                      ),
                    ),
                    height10,
                    Padding(
                      padding: topPadding10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.validity,
                            style: tsSmallBold,
                          ),
                          Text(
                            myplansData?.validity ?? '',
                            style: tsSmallBoldGrey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: topPadding10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.startDate,
                            style: tsSmallBold,
                          ),
                          Text(
                            "${myplansData?.startDate ?? ''} | ${myplansData?.startTime ?? ''}",
                            style: tsSmallBoldGrey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: topPadding10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.endDate,
                            style: tsSmallBold,
                          ),
                          Text(
                            '${myplansData?.endDate ?? ''} | ${myplansData?.endTime ?? ''}',
                            style: tsSmallBoldGrey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                log('message');
                                bottomSheetInvoice(context: context);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: blueShade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: circularBorderRadius7,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.file_download_outlined,
                                    color: textGrey,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.viewInvoice,
                                    style: tsRegularBold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          width20,
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteClass.recommendedplans);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  remainingDays < 1 ? redColor : blueMain,
                              shape: RoundedRectangleBorder(
                                borderRadius: circularBorderRadius7,
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.subscribe,
                              style: tsRegularWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: padding15,
                  child: Text(
                    AppLocalizations.of(context)!.recommendedForYou,
                    style: tsRegularBold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.annualDayPack,
                      style: tsMediumBold,
                    ),
                    Text(
                      AppLocalizations.of(context)!.itsaTrailPackForYear,
                      style: tsSmallGrey,
                    ),
                  ],
                ),
                Text(
                  '   ${myplansData?.days365Pack ?? ''}',
                  style: tsMediumBold,
                )
              ],
            ),
            height15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.sixMonthsPack,
                      style: tsMediumBold,
                    ),
                    Text(
                      AppLocalizations.of(context)!.itsaTrailPackforSixMonths,
                      style: tsSmall,
                    ),
                  ],
                ),
                Text(
                  myplansData?.days180Pack ?? '',
                  style: tsMediumBold,
                )
              ],
            ),
            height15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.threeMonthsPack,
                      style: tsMediumBold,
                    ),
                    Text(
                      AppLocalizations.of(context)!.itsaTrailPackforThreeMonths,
                      style: tsSmall,
                    ),
                  ],
                ),
                Text(
                  myplansData?.days90Pack ?? '',
                  style: tsMediumBold,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
