import '../../../../imports.dart';

class SaveEmergencyContactPopUpSuccessMessage {
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
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/success.png',
          width: 300,
          height: 300,
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!
              .yourEmergencyContactHasBeenSavedSuccessfully,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
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
