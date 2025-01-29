import '../../../../../imports.dart';
import '../../../../../widgets/app_text_widget.dart';

// ignore: non_constant_identifier_names
Widget PaymentOption(img, title, desc) {
  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Container(
      decoration: BoxDecoration(
        color: img == bankPng ? mainGreen : lightGrey,
        borderRadius: circularBorderRadius10,
      ),
      margin: topBottomPadding10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              alignment: Alignment.center,
              image: AssetImage(img),
            ),
            width20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(title, pureBlack, FontWeight.bold, 20.0, false, null,
                    0.0, 0.0, 0.0, 0.0),
                textWidget(desc, pureBlack, FontWeight.w200, 16.0, false, null,
                    0.0, 0.0, 0.0, 0.0)
              ],
            )
          ],
        ),
      ),
    ),
  );
}
