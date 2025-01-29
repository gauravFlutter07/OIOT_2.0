// ignore_for_file: use_build_context_synchronously

import '../../../../../imports.dart';

class PaymentLoadingProgress extends StatefulWidget {
  const PaymentLoadingProgress({super.key});

  @override
  State<PaymentLoadingProgress> createState() => _PaymentLoadingProgressState();
}

class _PaymentLoadingProgressState extends State<PaymentLoadingProgress> {
  @override
  void initState() {
    super.initState();
    _redirectAfterSuccess();
  }

  void _redirectAfterSuccess() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            AppLocalizations.of(context)!.subscriptionCompletedSuccessfully),
        duration: const Duration(seconds: 2),
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SubscriptionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60.0,
            ),
            const StepIndicator(),
            const SizedBox(
              height: 50.0,
            ),
            const customTextWidget(
              text: "Please wait",
              size: 30.0,
              color: Colors.black,
              weight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10.0,
            ),
            customTextWidget(
              text: "Please wait unless until you.",
              size: 20.0,
              color: textGrey,
              weight: FontWeight.w500,
            ),
            customTextWidget(
              text: "Get confirmation from us.",
              size: 20.0,
              color: textGrey,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
