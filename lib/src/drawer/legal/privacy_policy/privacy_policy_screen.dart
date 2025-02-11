import '../../../../imports.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PrivacyPolicyProvider>(
        builder: (context, provider, _) {
          if (provider.privacyPolicy.length > 6) {
            var privacyPolicyData = provider.privacyPolicy[3].desc; //added
            return Padding(
              padding: padding15,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHeader(
                        title: AppLocalizations.of(context)!.privacyPolicy),
                    height15,
                    Text(
                      '${AppLocalizations.of(context)!.updateOn}: ${provider.privacyPolicyModel!.lastUpdate}',
                      style: tsRegularBold,
                    ),
                    height05,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          provider
                              .extractTextFromHtml(privacyPolicyData!)
                              .trim(),
                          style: tsRegularBoldGrey,
                        ),
                      ),
                    ),
                    height20,
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
