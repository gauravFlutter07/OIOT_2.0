import '../imports.dart';

class CustomHeaderWallet extends StatelessWidget {
  final String title;

  const CustomHeaderWallet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserOfflineHome(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: textGrey,
            ),
          ),
        ),
        Text(
          title,
          style: tsMediumBold,
        ),
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: transperentColor,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: transperentColor,
            ),
          ),
        ),
      ],
    );
  }
}
