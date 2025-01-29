import 'package:oiot/src/qr_code/qr_code_rider.dart';
import '../../imports.dart';

class QRCodeDriver extends StatelessWidget {
  const QRCodeDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const CustomHeader(title: 'Scan Driver Profile QR Code'),
              height15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: padding8,
                      child: CustomButton(
                        onTap: () {},
                        title: AppLocalizations.of(context)!.myCode,
                        border: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: padding8,
                      child: CustomButton(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QRCodeRider(),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.scan,
                        optionalTextColor: whiteColor,
                        optionalColor: textBlack,
                        border: true,
                      ),
                    ),
                  ),
                ],
              ),
              height20,
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: darkWhiteBackground,
                    borderRadius: circularBorderRadius10,
                  ),
                  child: ListTile(
                    leading: Image.asset(avtarDp),
                    title: const Text(
                      'Hey, Sruthi Agrawal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('4.5 ⭐ Since 2019'),
                    trailing: CircleAvatar(
                      radius: 30,
                      backgroundColor: whiteColor,
                      child: Image.asset(
                        tiltedCar,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ),
              ),
              height50,
              Image.asset(
                qr1,
                height: 300,
                width: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
