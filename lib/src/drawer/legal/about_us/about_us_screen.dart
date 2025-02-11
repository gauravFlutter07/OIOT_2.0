import '../../../../imports.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.aboutUs),
              height20,
              Expanded(
                child: SingleChildScrollView(
                  child: Consumer<AboutUsProvider>(
                    builder: (context, provider, _) {
                      if (provider.aboutUs.length > 6) {
                        var aboutUsField = provider.aboutUs[1].desc; //added
                        height05;
                        return Text(
                          provider.extractTextFromHtml(aboutUsField!).trim(),
                          style: tsRegular,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
              height20,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutUsContent(
      AboutUsDataModel aboutUsDataModel, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboutUsDataModel.title,
          style: tsRegularBold,
        ),
        height10,
        Text(
          aboutUsDataModel.description,
          style: tsRegularBoldGrey,
        ),
        height20,
        Text('${AppLocalizations.of(context)!.vision}:', style: tsRegularBold),
        height10,
        Text(
          aboutUsDataModel.vision,
          style: tsRegularBoldGrey,
        ),
        height20,
        Text('${AppLocalizations.of(context)!.values}:', style: tsRegularBold),
        height10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: aboutUsDataModel.values
              .map((value) => Text(
                    '- $value',
                    style: tsRegularGrey,
                  ))
              .toList(),
        ),
        height20,
        Text('${AppLocalizations.of(context)!.contact}:', style: tsRegularBold),
        height10,
        Text(
          '${AppLocalizations.of(context)!.email}: ${aboutUsDataModel.contact.email}\n'
          '${AppLocalizations.of(context)!.mobileNumber}: ${aboutUsDataModel.contact.phone}\n'
          '${AppLocalizations.of(context)!.address}: ${aboutUsDataModel.contact.address}',
          style: tsRegularBoldGrey,
        ),
      ],
    );
  }
}
