import '../../../../../imports.dart';

class SaveEmergencyPopUpSuccessMessage {
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
          successPng,
          width: 300,
          height: 300,
        ),
        height20,
        Text(
          AppLocalizations.of(context)!.yourEmergencyContactAddedSuccessfully,
          style: tsRegularBold,
          textAlign: TextAlign.center,
        ),
        height20,
        CustomButton(
          onTap: () {
            Navigator.pop(context);
          },
          title: AppLocalizations.of(context)!.next,
          border: true,
        ),
      ],
    );
  }
}
