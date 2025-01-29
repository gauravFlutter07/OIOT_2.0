import '../imports.dart';

class AppCustomPopup {
  void showMessage({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String subTitle,
    VoidCallback? onTap,
    String? buttonTitle,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: contentBox(
              context, imagePath, title, subTitle, onTap, buttonTitle),
        );
      },
    );
  }

  Widget contentBox(
    BuildContext context,
    String imagePath,
    String title,
    String subTitle,
    VoidCallback? onTap,
    String? buttonTitle,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        height20,
        Image.asset(
          imagePath,
          width: 300,
          height: 300,
        ),
        height20,
        Text(
          title,
          style: tsLargeBold,
        ),
        height20,
        Text(
          subTitle,
          style: tsRegularBold,
          textAlign: TextAlign.center,
        ),
        height20,
        onTap != null
            ? CustomButton(
                onTap: onTap,
                title: buttonTitle ?? '',
                border: true,
              )
            : const SizedBox(),
      ],
    );
  }
}
