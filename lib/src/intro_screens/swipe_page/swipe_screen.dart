import '../../../imports.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final swipeProvider = Provider.of<SwipeProvider>(context, listen: false);
    return Scaffold(
      body: PageView(
        controller: swipeProvider.pageController,
        physics: const ClampingScrollPhysics(),
        children: const [
          OnBoarding1(),
          OnBoarding2(),
          OnBoarding3(),
        ],
      ),
    );
  }
}
