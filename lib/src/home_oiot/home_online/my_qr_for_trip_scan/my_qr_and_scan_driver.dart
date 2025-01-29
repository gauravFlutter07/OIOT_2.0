import 'package:oiot/imports.dart';
import 'package:oiot/src/home_oiot/home_online/my_qr_for_trip_scan/qr_for_trip_scan_controller.dart';
import 'package:oiot/src/home_oiot/home_online/my_qr_for_trip_scan/widgets/my_qr_tab.dart';
import 'package:oiot/src/home_oiot/home_online/my_qr_for_trip_scan/widgets/my_scan_tab.dart';

class MyQrCodeForTrip extends StatelessWidget {
  const MyQrCodeForTrip({super.key});

  @override
  Widget build(BuildContext context) {
    final qrProvider = Provider.of<QrForTripAndScanProvider>(context);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Consumer<QrForTripAndScanProvider>(
              builder: (context, provider, _) {
                return Text(
                  provider.isMyCodeTabSelected
                      ? 'My QR code for trip'
                      : 'Scan Driver Profile QR Code',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                );
              },
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TabBar(
                  onTap: (index) {
                    if (index == 0) {
                      qrProvider.selectMyCodeTab();
                    } else {
                      qrProvider.selectScanTab();
                    }
                  },
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: blueMain,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.myCode,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.scan,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              MyQrCodeTab(),
              MyScanTab(),
            ],
          ),
        ),
      ),
    );
  }
}
