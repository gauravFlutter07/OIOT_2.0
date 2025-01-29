// Colors

import '../imports.dart';

Color veryLightGrey = const Color(0xffF9FAFB);
// Color lightGrey = const Color(0xffF1F2F6);
// ignore: use_full_hex_values_for_flutter_colors
Color mediumGrey = const Color(0xff00000029);
Color deepMediumGrey = const Color(0xffB3B5BB);
Color darkMediumGrey = const Color(0xffA8A8A8);
Color deepGrey = const Color(0xff676767);
Color darkBlack = const Color(0xff020202);
Color pureBlack = const Color(0xff000000);
Color bloodRed = const Color(0xffF83030);
Color linkBlue = const Color(0xff22B4CB);
Color occurYellow = const Color(0xffFFB900);
Color sevenupGreen = const Color(0xff14CCA1);
Color orange = const Color(0xffFF5C33);
Color deepBlue = const Color(0xff1F336B);
Color violet = const Color(0xff5F259F);
Color lightSapGreen = const Color(0xffA6C307);
Color deepOrange = const Color(0xffE9661C);
Color deepLinkBlue = const Color(0xff0066D9);
Color lightYellow = const Color(0xffFFD328);
// Colors

Widget textWidget(
  text,
  color,
  weight,
  size,
  clickable,
  ontap,
  pl,
  pt,
  pr,
  pb,
) {
  return clickable == true
      ? Padding(
          padding: EdgeInsets.only(top: pt, bottom: pb, left: pl, right: pr),
          child: InkWell(
            onTap: () => ontap(),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: size,
                fontWeight: weight,
              ),
            ),
          ),
        )
      : Padding(
          padding: EdgeInsets.only(top: pt, bottom: pb, left: pl, right: pr),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: weight,
            ),
          ),
        );
}
