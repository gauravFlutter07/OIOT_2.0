import '../../../../../imports.dart';

class MyCodeTab extends StatelessWidget {
  const MyCodeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final qrProvider = Provider.of<QrProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height40,
        QrDriverContainer(
          callBack: () {},
          leadWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          avtarDp,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: circleBoxShape,
                      color: transperentColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          isBorder: false,
          subWidget: const Text(
            'AP 28 DC 3366',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          title: 'Hey, Swaminathan',
        ),
        height70,
        Center(
          child: QrImageView(
            data: 'OIOT rider qr code',
            version: QrVersions.auto,
            size: 250,
            gapless: false,
          ),
        )
      ],
    );
  }
}
