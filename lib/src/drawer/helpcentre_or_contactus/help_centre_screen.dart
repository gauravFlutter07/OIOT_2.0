// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

import '../../../imports.dart';

class ContactUsPage extends StatelessWidget {
  final String websiteUrl = 'https://oiot.app/#/';
  final String _phoneNumber = '+919364102992';
  final String _mobileNumber = '+918848583025';
  final Uri _whatsappNumber = Uri.parse('https://wa.me/+919447537981');

  ContactUsPage({super.key});

  List<LogoItem> _getLogoItems(BuildContext context) {
    return [
      LogoItem(
        boldText: AppLocalizations.of(context)!.email,
        imagePath: emailLogo,
      ),
      LogoItem(
        boldText: AppLocalizations.of(context)!.website,
        imagePath: websiteLogo,
      ),
      LogoItem(
        boldText: AppLocalizations.of(context)!.whatsapp,
        imagePath: whatsappLogo,
      ),
      LogoItem(
        boldText: AppLocalizations.of(context)!.callUs,
        imagePath: callUs,
      ),
      LogoItem(
        boldText: AppLocalizations.of(context)!.text,
        imagePath: chatUs,
      ),
      LogoItem(
        boldText: AppLocalizations.of(context)!.raiseAnIssue,
        imagePath: faqLogo,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<LogoItem> logoItems = _getLogoItems(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding10,
          child: Column(
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.helpCentre),
              Expanded(
                child: ListView.builder(
                  itemCount: logoItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: padding15,
                      child: LogoListItem(
                        logoItem: logoItems[index],
                        function: () {
                          if (index == 0) {
                            sendFeedbackEmail();
                          } else if (index == 1) {
                            launchWebsiteURL(websiteUrl);
                          } else if (index == 2) {
                            whatsappUrl();
                          } else if (index == 3) {
                            callFunction();
                          } else if (index == 4) {
                            textMessage();
                          } else if (index == 5) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TicketHistory(),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendFeedbackEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@oiot.app',
      queryParameters: {'subject': 'Feedback'},
    );

    try {
      await launch(emailLaunchUri.toString());
    } catch (e) {
      log('Error launching email: $e');
    }
  }

  void launchWebsiteURL(String url) async {
    if (await canLaunch(websiteUrl)) {
      await launch(websiteUrl);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> whatsappUrl() async {
    launchUrl(_whatsappNumber);
  }

  Future<void> textMessage() async {
    final String text = 'sms:$_phoneNumber';

    if (await canLaunch(text)) {
      await launch(text);
    }
  }

  Future<void> callFunction() async {
    final String call = 'tel:$_mobileNumber';

    if (await canLaunch(call)) {
      await launch(call);
    }
  }
}

class LogoItem {
  final String boldText;
  final String imagePath;

  LogoItem({
    required this.boldText,
    required this.imagePath,
  });
}

class LogoListItem extends StatelessWidget {
  final LogoItem logoItem;
  final VoidCallback? function;

  const LogoListItem({
    super.key,
    required this.logoItem,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function!();
      },
      child: Container(
        padding: padding10,
        child: Row(
          children: [
            Image.asset(
              logoItem.imagePath,
              width: 35.0,
              height: 35.0,
            ),
            width20,
            Text(
              logoItem.boldText,
              style: tsRegularBold,
            ),
          ],
        ),
      ),
    );
  }
}
