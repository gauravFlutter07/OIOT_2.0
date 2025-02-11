import '../../../../imports.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.termsAndConditions ??
            'Terms and Conditions'),
      ),
      body: Consumer<TermsAndServicesProvider>(
        builder: (context, provider, _) {
          if (provider.tcData != null &&
              provider.tcData.length > 7 &&
              provider.tcData[7].desc != null) {
            var terms = provider.tcData[7].desc ?? '';
            return Padding(
              padding: padding15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)?.ourTermsOfConditions ??
                        'Our Terms of Conditions',
                    style: tsLargeBold,
                  ),
                  height10,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        provider.extractTextFromHtml(terms).trim() ?? '',
                        style: tsRegular,
                      ),
                    ),
                  ),
                  height20,
                  Text(
                    '${AppLocalizations.of(context)?.acceptedOn ?? 'Accepted On'}: ${provider.termsAndConditionsModel?.acceptedDateTime ?? 'N/A'}',
                    style: tsRegularBold,
                  ),
                  height10,
                  Text(
                    '${AppLocalizations.of(context)?.location ?? 'Location'}: ${provider.termsAndConditionsModel?.acceptedLocation ?? 'N/A'}',
                    style: tsRegularBold,
                  ),
                ],
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
