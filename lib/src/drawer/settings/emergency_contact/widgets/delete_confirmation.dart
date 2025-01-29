import '../../../../../imports.dart';

class MaterialAlertDialog extends StatelessWidget {
  const MaterialAlertDialog({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmergencyProvider>(
      builder: (context, emergencyContactProvider, child) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.confirmation),
        content: Text(AppLocalizations.of(context)!.areYouSureYouWantToDelete),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              AppLocalizations.of(context)!.no,
              style: tsSmallGrey,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              AppLocalizations.of(context)!.yes,
              style: tsSmall,
            ),
          ),
        ],
      ),
    );
  }
}
