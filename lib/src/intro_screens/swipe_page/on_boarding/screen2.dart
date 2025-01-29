import '../../../../imports.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: onBoardPagePadding,
        child: Container(
          alignment: centreAlignment,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height10,
                Align(
                  alignment: centreRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnBoarding3(),
                        ),
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.skipOnBoarding,
                      style: tsRegular,
                    ),
                  ),
                ),
                Image.asset(
                  onboardingPage2Image,
                  scale: 5,
                ),
                height20,
                Text(
                  AppLocalizations.of(context)!.setOnboard,
                  style: tsExtraLargeW900Blue,
                ),
                Text(
                  AppLocalizations.of(context)!.yourDestination,
                  style: tsExtraLargew900Black,
                ),
                height40,
                Text(
                  AppLocalizations.of(context)!.onBoardDescriptionTwo,
                  style: tsRegular,
                  textAlign: TextAlign.justify,
                ),
                height80,
                Padding(
                  padding: padding10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            margin: padding8,
                            decoration: BoxDecoration(
                              shape: circleBoxShape,
                              color: blueMain,
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            margin: padding8,
                            decoration: BoxDecoration(
                              shape: circleBoxShape,
                              color: blueMain,
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            margin: padding8,
                            decoration: BoxDecoration(
                              shape: circleBoxShape,
                              color: lightBackgroundBlue,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnBoarding3(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blueMain,
                          padding: onboardElevateButtonPadding,
                          shape: RoundedRectangleBorder(
                            borderRadius: circularBorderRadius10,
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.nextOnboarding,
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
      ),
    );
  }
}
