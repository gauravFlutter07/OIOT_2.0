
import '../../../../imports.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PrivacyPolicyProvider>(
        builder: (context, provider, _) {
          if (provider.privacyPolicyModel != null) {
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
                    height10,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          provider.privacyPolicyModel!.content,
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
