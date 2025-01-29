import 'package:oiot/src/home_oiot/home_online/invoice/trip_share_success.dart';

import '../../../../imports.dart';

class ShareInvoice extends StatelessWidget {
  const ShareInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomHeader(title: 'Share Invoice'),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Thanks for choosing Prasanna Travels.',
                  style: TextStyle(
                    color: Color(0xFF676767),
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'Glad to service a coool customer like you.',
                  style: TextStyle(
                    color: Color(0xFF676767),
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'The invoice is attached here.',
                  style: TextStyle(
                    color: Color(0xFF676767),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Technology Partner',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  oiotlogo,
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Use OIOT app to book online taxi.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'https://play.google.com/store/apps/details?id=OIOT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF22b4cb),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                CustomButton(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TripShareSuccess(),
                      ),
                    );
                  },
                  title: 'Send',
                  border: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
