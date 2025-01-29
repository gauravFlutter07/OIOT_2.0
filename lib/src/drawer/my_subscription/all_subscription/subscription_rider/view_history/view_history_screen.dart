import 'dart:developer';
import '../../../../../../imports.dart';

class ViewHistoryPlanWidget extends StatelessWidget {
  const ViewHistoryPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewHistoryProvider>(
      builder: (context, provider, child) {
        final ViewHistoryModel? viewHistory = provider.viewHistoryData;

        if (viewHistory == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            height15,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  AppLocalizations.of(context)!.yourSubscriptionHistory,
                  style: tsRegularBold,
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: padding15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '80% off - ${viewHistory.annualPlanDays}',
                          style: tsRegularBold,
                        ),
                        Text(
                          viewHistory.standardPlan,
                          style: tsMediumRed,
                        ),
                      ],
                    ),
                    height10,
                    Chip(
                      backgroundColor: viewHistory.remainingDays == '0 days'
                          ? redColor
                          : greenColor,
                      label: Text(
                        viewHistory.remainingDays == '0 days'
                            ? AppLocalizations.of(context)!.expired
                            : AppLocalizations.of(context)!.active,
                        style: tsExtraSmallWhite,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${viewHistory.remainingDays} - left of ${viewHistory.validity}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: viewHistory.remainingDays == '0 days'
                                ? redColor
                                : blackColor,
                          ),
                        ),
                      ],
                    ),
                    height10,
                    LinearProgressIndicator(
                      minHeight: 10.0,
                      value: provider.calculatePercentage(
                        int.parse(viewHistory.remainingDays.split(' ')[0]),
                        int.parse(viewHistory.annualPlanDays.split(' ')[0]),
                      ),
                      backgroundColor: blackColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        greenColor,
                      ),
                    ),
                    height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.validity,
                          style: tsSmallBold,
                        ),
                        Text(
                          viewHistory.validity,
                          style: tsSmallBold,
                        ),
                      ],
                    ),
                    height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.startDate,
                          style: tsSmallBold,
                        ),
                        Text(
                          viewHistory.startDate,
                          style: tsSmallBold,
                        ),
                      ],
                    ),
                    height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.endDate,
                          style: tsSmallBold,
                        ),
                        Text(
                          viewHistory.endDate,
                          style: tsSmallBold,
                        ),
                      ],
                    ),
                    height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              log('message');
                              bottomSheetInvoice(context: context);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: redShade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: circularBorderRadius5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_download_outlined,
                                  color: blackColor,
                                ),
                                width5,
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
                              context,
                              RouteClass.payingsubscriptionscreen,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: redColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: circularBorderRadius5,
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.subscribe,
                            style: tsRegularWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
