import '../../../../../../imports.dart';

class OiotContainerWidget extends StatelessWidget {
  const OiotContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final payingSubscriptionProvider =
        context.watch<PayingSubscriptionProvider>();
    return Container(
      color: lightBlue,
      height: 130,
      child: Row(
        children: [
          Padding(
            padding: padding8,
            child: Image.asset(
              oiotlogo,
              fit: BoxFit.fitHeight,
            ),
          ),
          height10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height15,
              Text(
                'OIOT',
                style: tsLargeBold,
              ),
              height05,
              Text(
                AppLocalizations.of(context)!.hybridTaxiSolution,
                style: tsRegularBold,
              ),
              height10,
              Text(
                  '₹${payingSubscriptionProvider.subscriptionAmount.toString()}',
                  style: tsLargeBold),
            ],
          ),
        ],
      ),
    );
  }
}
