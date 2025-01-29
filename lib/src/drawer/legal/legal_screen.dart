// ignore_for_file: use_key_in_widget_constructors

import 'package:oiot/src/drawer/legal/about_us/about_us_screen.dart';
import 'package:oiot/src/drawer/legal/privacy_policy/privacy_policy_screen.dart';
import '../../../imports.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.legal),
              height30,
              Expanded(
                child: ListView(
                  children: [
                    _buildLegalItem(
                      icon: Icons.description,
                      title: AppLocalizations.of(context)!.serviceAgreement,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TermsAndConditions(),
                          ),
                        );
                      },
                    ),
                    height25,
                    _buildLegalItem(
                      icon: Icons.assignment,
                      title: AppLocalizations.of(context)!.termsAndConditions,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TermsAndConditions(),
                          ),
                        );
                      },
                    ),
                    height25,
                    _buildLegalItem(
                      icon: Icons.lock,
                      title: AppLocalizations.of(context)!.privacyPolicy,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen(),
                          ),
                        );
                      },
                    ),
                    height25,
                    _buildLegalItem(
                      icon: Icons.info,
                      title: AppLocalizations.of(context)!.aboutUs,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutUs(),
                          ),
                        );
                      },
                    ),
                    height25,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegalItem({
    required IconData icon,
    required String title,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding15,
        decoration: BoxDecoration(
          color: greyShade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: textGrey,
              size: 30,
            ),
            width15,
            Text(
              title,
              style: tsRegularBoldGrey,
            ),
          ],
        ),
      ),
    );
  }
}
