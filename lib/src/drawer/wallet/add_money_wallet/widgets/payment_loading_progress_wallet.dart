// ignore_for_file: use_build_context_synchronously

import '../../../../../imports.dart';

class PaymentLoadingProgressWallet extends StatefulWidget {
  const PaymentLoadingProgressWallet({super.key});

  @override
  State<PaymentLoadingProgressWallet> createState() =>
      _PaymentLoadingProgressWalletState();
}

class _PaymentLoadingProgressWalletState
    extends State<PaymentLoadingProgressWallet> {
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
        content:
            Text(AppLocalizations.of(context)!.moneyAddedToWalletSuccessfully),
        duration: const Duration(seconds: 2),
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyWalletScreen(),
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
            height60,
            const StepIndicator(),
            height50,
            customTextWidget(
              text: AppLocalizations.of(context)!.pleaseWait,
              size: 30.0,
              color: blackColor,
              weight: bold,
            ),
            height10,
            customTextWidget(
              text: AppLocalizations.of(context)!.pleaseWaitUnlessUntilYou,
              size: 20.0,
              color: textGrey,
              weight: fontWeight500,
            ),
            customTextWidget(
              text: AppLocalizations.of(context)!.getConfirmationFromUs,
              size: 20.0,
              color: textGrey,
              weight: fontWeight500,
            ),
          ],
        ),
      ),
    );
  }
}
