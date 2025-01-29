import '../../../../imports.dart';

class AddContactPopUpSuccessMessage {
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
          AppLocalizations.of(context)!.yourNewContactHasBeenSavedSuccessfully,
          style: tsRegularBold,
          textAlign: centreAlign,
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
