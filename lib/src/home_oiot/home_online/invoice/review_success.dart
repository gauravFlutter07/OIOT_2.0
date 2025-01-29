import 'package:oiot/imports.dart';

class ReviewSuccess extends StatelessWidget {
  const ReviewSuccess({super.key});

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
              Image.asset(successImage),
              height30,
              Text(
                AppLocalizations.of(context)!.thanksForYourValuableFeedback,
                style: tsLargeBold,
                textAlign: TextAlign.center,
              ),
              height30,
            ],
          ),
        ),
      ),
    );
  }
}
