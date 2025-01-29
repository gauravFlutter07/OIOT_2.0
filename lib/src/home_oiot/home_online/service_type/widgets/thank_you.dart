import 'package:oiot/src/home_oiot/home_online/feedback_driver/feedback_driver.dart';

import '../../../../../imports.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding15,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                successTick,
                height: 150,
                width: 150,
              ),
              height50,
              Text(
                AppLocalizations.of(context)!.thankYou,
                style: tsExtraLargeBold,
              ),
              height80,
              CustomButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DriverFeedback(),
                    ),
                  );
                },
                title: AppLocalizations.of(context)!.rateTheDriver,
                border: true,
              ),
              height30,
              CustomButtonOnlyBorder(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserOnlineHome(),
                      ),
                    );
                  },
                  title: AppLocalizations.of(context)!.willDoLater,
                  border: true),
            ],
          ),
        ),
      ),
    );
  }
}
