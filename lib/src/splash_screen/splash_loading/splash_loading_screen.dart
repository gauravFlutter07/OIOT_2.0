import '../../../imports.dart';

class SplashLoadingScreen extends StatelessWidget {
  const SplashLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashLoadingProvider = context.watch<SplashLoadingProvider>();
    splashLoadingProvider.startProgressAnimation(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              alignment: centreAlignment,
              child: Image.asset(
                oiotlogo,
              ),
            ),
          ),
          height20,
          ClipRRect(
            borderRadius: circularBorderRadius5,
            child: SizedBox(
              width: 338.0,
              height: 12.0,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: darkBlack,
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 5),
                    color: blueMain,
                    width: MediaQuery.of(context).size.width *
                        splashLoadingProvider.progressValue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
