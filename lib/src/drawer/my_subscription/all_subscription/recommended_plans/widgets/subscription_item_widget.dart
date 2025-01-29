import '../../../../../../imports.dart';

class SubscriptionItemWidget extends StatelessWidget {
  const SubscriptionItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          height10,
          Container(
            margin: recommendedPlanPadding,
            height: 160,
            width: double.infinity,
            color: backgroundWhite,
            child: Padding(
              padding: recommendContainerPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.oneYearPack,
                          style: tsMediumBold,
                        ),
                        Text(
                          "₹40",
                          style: tsMediumBoldGreen700,
                        ),
                      ],
                    ),
                    height15,
                    Text(
                      AppLocalizations.of(context)!.itsaTrailPackForAnnum,
                      style: tsRegular,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<dynamic>(
                              backgroundColor: transperentColor,
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return const BottomSlidingDriverPopup();
                              },
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.viewDetails,
                            style: tsSmallUnderline,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: blueMain, elevation: 0),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteClass.payingsubscriptionscreen);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.buyNow,
                            style: tsRegularWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          height15,
          Container(
            margin: recommendedPlanPadding,
            height: 160,
            width: double.infinity,
            color: backgroundWhite,
            child: Padding(
              padding: recommendContainerPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.sixMonthPack,
                          style: tsMediumBold,
                        ),
                        Text(
                          "₹20",
                          style: tsMediumBoldGreen700,
                        ),
                      ],
                    ),
                    height15,
                    Text(
                      AppLocalizations.of(context)!.itsaTrailPackForHalfYear,
                      style: tsRegular,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<dynamic>(
                              backgroundColor: transperentColor,
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return const BottomSlidingDriverPopup();
                              },
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.viewDetails,
                            style: tsSmallUnderline,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: blueMain, elevation: 0),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteClass.payingsubscriptionscreen);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.buyNow,
                            style: tsRegularWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          height15,
          Container(
            margin: recommendedPlanPadding,
            height: 160,
            width: double.infinity,
            color: backgroundWhite,
            child: Padding(
              padding: recommendContainerPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.threeMonthPack,
                          style: tsMediumBold,
                        ),
                        Text(
                          "₹10",
                          style: tsMediumBoldGreen700,
                        ),
                      ],
                    ),
                    height15,
                    Text(
                      AppLocalizations.of(context)!.itsaTrailPackForQuarter,
                      style: tsRegular,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<dynamic>(
                              backgroundColor: transperentColor,
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return const BottomSlidingDriverPopup();
                              },
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.viewDetails,
                            style: tsSmallUnderline,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: blueMain, elevation: 0),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteClass.payingsubscriptionscreen);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.buyNow,
                            style: tsRegularWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
