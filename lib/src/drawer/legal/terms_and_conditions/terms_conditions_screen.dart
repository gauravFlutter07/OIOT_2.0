import '../../../../imports.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.termsAndConditions),
      ),
      body: Consumer<TermsAndServicesProvider>(
        builder: (context, provider, _) {
          if (provider.termsAndConditionsModel != null) {
            return Padding(
              padding: padding15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.ourTermsOfConditions,
                    style: tsLargeBold,
                  ),
                  height20,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        provider.termsAndConditionsModel!.content,
                        style: tsRegular,
                      ),
                    ),
                  ),
                  height20,
                  Text(
                    '${AppLocalizations.of(context)!.acceptedOn}: ${provider.termsAndConditionsModel!.acceptedDateTime}',
                    style: tsRegularBold,
                  ),
                  height10,
                  Text(
                    '${AppLocalizations.of(context)!.location}: ${provider.termsAndConditionsModel!.acceptedLocation}',
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
