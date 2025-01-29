import '../../../../imports.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

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
                Image.asset(
                  onboardingPage3Image,
                  scale: 5,
                ),
                height20,
                Text(
                  AppLocalizations.of(context)!.goOnboard,
                  style: tsExtraLargeW900Blue,
                ),
                Text(
                  AppLocalizations.of(context)!.findOnlineOfflineCab,
                  style: tsExtraLargew900Black,
                ),
                height40,
                Text(
                  AppLocalizations.of(context)!.onBoardDescriptionThree,
                  textAlign: TextAlign.justify,
                  style: tsRegular,
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
                              color: blueMain,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteClass.welcomeScreen,
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
                          AppLocalizations.of(context)!.getStarted,
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
