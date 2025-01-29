import '../imports.dart';

class MaterialAlertDialog extends StatelessWidget {
  const MaterialAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginprovider, child) => AlertDialog(
        title: const Text("Confirmation"),
        content: const Text("Are you sure you want to delete?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No", style: TextStyle(color: Colors.grey.shade600)),
          ),
          TextButton(
            onPressed: () {
              loginprovider.mobileController.clear();
              Navigator.of(context).pop();
            },
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.grey.shade900),
            ),
          ),
        ],
      ),
    );
  }
}
