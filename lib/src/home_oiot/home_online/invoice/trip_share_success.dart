import '../../../../imports.dart';

class TripShareSuccess extends StatefulWidget {
  const TripShareSuccess({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TripShareSuccessState createState() => _TripShareSuccessState();
}

class _TripShareSuccessState extends State<TripShareSuccess> {
  @override
  void initState() {
    super.initState();
    closeAfterDelay();
  }

  void closeAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const CustomHeader(title: 'Trip Share Successfully'),
              const SizedBox(height: 50),
              Image.asset(successImage),
              const SizedBox(height: 60),
              Text(
                'Invoice Shared\nSuccessfully',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: darkBlack,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
