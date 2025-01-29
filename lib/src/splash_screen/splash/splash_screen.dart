import '../../../imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, provider, _) {
        provider.checkFirstTimeAndAuthToken(context);
        return Scaffold(
          body: Center(
            child: Container(
              height: 300,
              width: 300,
              alignment: Alignment.center,
              child: Image.asset(
                oiotlogo,
              ),
            ),
          ),
        );
      },
    );
  }
}
