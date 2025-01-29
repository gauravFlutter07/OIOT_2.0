import 'package:oiot/src/qr_code/qr_code_driver.dart';
import '../../imports.dart';

class QRCodeRider extends StatelessWidget {
  const QRCodeRider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const CustomHeader(title: 'My QR Code for Trip'),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QRCodeDriver(),
                            ),
                          );
                        },
                        title: 'My Code',
                        optionalTextColor: Colors.white,
                        optionalColor: textBlack,
                        border: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        onTap: () {},
                        title: 'Scan',
                        border: true,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                avtarDp,
                height: 150,
                width: 150,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Hey, Swaminathan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '⭐ 4.5 Since 2019',
                style: TextStyle(
                  fontSize: 18,
                  color: textGrey,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                qr2,
                height: 200,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
