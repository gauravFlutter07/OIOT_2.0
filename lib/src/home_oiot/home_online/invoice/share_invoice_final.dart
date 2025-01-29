import 'package:flutter/material.dart';
import 'package:oiot/elements/images.dart';
import 'package:oiot/src/home_oiot/home_online/invoice/share_invoice.dart';
import 'package:oiot/widgets/app_header.dart';

class ShareInvoiceFinal extends StatelessWidget {
  const ShareInvoiceFinal({super.key});

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
                  'Import your contacts so you can start sharing and collaborating with your customers from now!',
                  style: TextStyle(
                    color: Color(0xFF676767),
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      googleLogo,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Google',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      facebookLogo,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Facebook',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      whatsappLogo,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShareInvoice(),
                          ),
                        );
                      },
                      child: const Text(
                        'Whatsapp',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      linkedinLogo,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Linkedin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      telegramCommunity,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Telegram',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
