import '../../../../imports.dart';

class MyQrCode extends StatelessWidget {
  const MyQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    final qrProvider = Provider.of<QrProvider>(context);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.qrCode,
              style: tsRegularBold,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                margin: horizontalPadding10,
                decoration: BoxDecoration(
                  borderRadius: circularBorderRadius7,
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: circularBorderRadius7,
                    color: qrProvider.isclicked ? blackColor : blueMain,
                  ),
                  labelColor: whiteColor,
                  unselectedLabelColor: blackColor,
                  tabs: [
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: circularBorderRadius7,
                      ),
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.myCode,
                            style: tsRegular,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: circularBorderRadius7,
                      ),
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.scan,
                            style: tsRegular,
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
              MyCodeTab(),
              ScanTab(),
            ],
          ),
        ),
      ),
    );
  }
}

/*void scanQRCode() async {
  try {
    // ignore: unused_local_variable
    final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);

    // if (!mounted) return;

    // setState(() {
    //   getResultQr = qrCode;
    // });
  } on PlatformException {
    // getResultQr = 'Failed to scan QR Code.';
  }
}*/
