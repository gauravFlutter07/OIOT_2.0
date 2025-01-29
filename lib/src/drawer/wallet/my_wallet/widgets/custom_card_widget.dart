import 'package:oiot/widgets/app_text_widget.dart';

import '../../../../../imports.dart';

Widget customCard(number, price, status, date, purpose, description) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: circularBorderRadius5,
      color: lightGrey,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: arrowPadding,
                  child: Icon(Icons.arrow_upward),
                ),
                textWidget(number, pureBlack, bold, 14.0, false, null, 10.0,
                    20.0, 0.0, 0.0),
              ],
            ),
            textWidget(price, pureBlack, bold, 14.0, false, null, 10.0, 10.0,
                10.0, 0.0),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(status, status == 'Failed' ? bloodRed : greenColor, bold,
                14.0, false, null, 10.0, 10.0, 0.0, 30.0),
            textWidget(date, blackColor, fontWeight400, 14.0, false, null, 10.0,
                0.0, 10.0, 30.0),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textWidget(purpose, blackColor, fontWeight400, 14.0, false, null,
                10.0, 0.0, 10.0, 30.0),
            textWidget(description, blackColor, fontWeight400, 14.0, false,
                null, 10.0, 0.0, 10.0, 30.0),
          ],
        ),
      ],
    ),
  );
}
