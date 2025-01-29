import '../../../../../imports.dart';

class MyScanTab extends StatelessWidget {
  const MyScanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          scanQRCode();
        },
        child: Text(
          AppLocalizations.of(context)!.clickHereToScanQrCode,
          style: TextStyle(fontSize: 16, color: blueMain),
        ),
      ),
    );
  }
}
