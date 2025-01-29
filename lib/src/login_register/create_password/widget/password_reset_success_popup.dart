import '../../../../imports.dart';

class PopupMessagePasswordResetSuccess {
  void showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: contentBox(context),
        );
      },
    );
  }

  Widget contentBox(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        height20,
        Image.asset(
          successImage,
          width: 300,
          height: 300,
        ),
        height20,
        Text(
          AppLocalizations.of(context)!.yourpasswordResetSuccessfully,
          style: tsRegularBold,
          textAlign: centreAlign,
        ),
        height20,
        CustomButton(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteClass.loginScreen, (route) => false);
          },
          title: AppLocalizations.of(context)!.loginNow,
          border: true,
        ),
      ],
    );
  }
}
