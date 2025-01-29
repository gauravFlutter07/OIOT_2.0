import '../imports.dart';

class MaterialAlertDialog extends StatelessWidget {
  const MaterialAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginProvider loginController = LoginProvider();
    return AlertDialog(
      title: const Text("Confirmation"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, RouteClass.loginScreen);
                loginController.logout(context);
                loginController.mobileController.clear();
              },
              child: Text(
                "Yes",
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
