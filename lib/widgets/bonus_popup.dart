import '../imports.dart';

class BonusPopup extends StatelessWidget {
  final int rupee;
  const BonusPopup({
    super.key,
    required this.rupee,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: 0.5,
      widthFactor: 1.1,
      child: AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(verificationBack),
                  Center(
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: blueMain,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₹${rupee.toString()}',
                              style: tsBigWhite,
                            ),
                            Text(
                              AppLocalizations.of(context)!.bonus,
                              style: tsLargeBold,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              height20,
              Text(
                AppLocalizations.of(context)!.congratulations,
                style: tsExtraLargeBold,
              ),
              height20,
              Text(
                'Your referral bonus of ₹${rupee.toString()} has been\n added to your wallet',
                style: tsMediumGrey,
                textAlign: TextAlign.center,
              ),
              height20,
            ],
          ),
        ),
      ),
    );
  }
}
