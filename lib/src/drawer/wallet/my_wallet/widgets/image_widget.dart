import 'package:oiot/widgets/app_text_widget.dart';
import '../../../../../imports.dart';

Widget imageWidget(image, text, onTap) {
  return Column(
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: whiteColor,
          padding: imageContainerPadding,
          side: BorderSide(
            color: borderGrey,
          ),
        ),
        onPressed: () {
          onTap();
        },
        child: image,
      ),
      height10,
      textWidget(
        text,
        pureBlack,
        fontWeight500,
        14.0,
        false,
        null,
        0.0,
        0.0,
        0.0,
        0.0,
      ),
    ],
  );
}
