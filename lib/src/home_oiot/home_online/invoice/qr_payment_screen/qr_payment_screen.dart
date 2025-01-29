import '../../../../../imports.dart';

class MyCodeTabForPayment extends StatelessWidget {
  const MyCodeTabForPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.qRCodeForPayment),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: QrImageView(
                data: 'OIOT rider payment qr code',
                version: QrVersions.auto,
                size: 250,
                gapless: false,
              ),
            ),
            const Spacer(),
            CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CashPaymentMethod(),
                    ),
                  );
                },
                title: AppLocalizations.of(context)!.next,
                border: true),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
