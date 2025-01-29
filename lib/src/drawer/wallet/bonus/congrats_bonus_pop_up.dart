import '../../../../imports.dart';

class CongratsBonusPopup extends StatelessWidget {
  final int rupee;

  const CongratsBonusPopup({
    super.key,
    required this.rupee,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: 0.57,
      widthFactor: 1.1,
      child: AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    varificationBehind,
                  ),
                  height05,
                  Center(
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: blackColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₹$rupee',
                              style: tsBigGreen,
                            ),
                            Text(
                              AppLocalizations.of(context)!.bonus,
                              style: tsExtraLargeBoldGreen,
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
              height05,
              Text(
                '${AppLocalizations.of(context)!.yourBonusOf} ₹$rupee ${AppLocalizations.of(context)!.hasBeenAddedToWallet}',
                style: tsMediumGrey300Height,
                textAlign: TextAlign.center,
              ),
              height05,
            ],
          ),
        ),
      ),
    );
  }
}
