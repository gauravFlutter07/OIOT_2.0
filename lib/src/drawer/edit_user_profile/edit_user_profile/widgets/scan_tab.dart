import '../../../../../imports.dart';

class ScanTab extends StatelessWidget {
  const ScanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          scanQRCode();
        },
        child: Text(
          AppLocalizations.of(context)!.clickHereToScanQrCode,
          style: tsRegularBlue,
        ),
      ),
    );
  }
}
