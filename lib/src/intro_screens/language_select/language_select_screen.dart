import '../../../imports.dart';

class LanguageSelectScreen extends StatelessWidget {
  const LanguageSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController =
        Provider.of<SettingsController>(context, listen: false);

    final List<String> languages = ['English', 'తెలుగు', 'ಕನ್ನಡ', 'मराठी'];
    final List<Locale> locales = [
      const Locale('en'),
      const Locale('te'),
      const Locale('kn'),
      const Locale('mr'),
    ];

    return Scaffold(
      body: Padding(
        padding: padding15,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height35,
              Text(
                AppLocalizations.of(context)!.chooseYour,
                style: tsExtraLargeBold,
              ),
              height10,
              Text(
                AppLocalizations.of(context)!.preferredLanguage,
                style: tsExtraLargeBold,
              ),
              height20,
              Consumer<LanguageSelectProvider>(
                builder: (context, languageSelectProvider, _) {
                  return Container(
                    width: double.infinity,
                    height: 55,
                    color: greyColor,
                    child: Padding(
                      padding: padding10,
                      child: DropdownButton<String>(
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: languageSelectProvider.currentLanguage,
                        onChanged: (String? selectedLanguage) {
                          if (selectedLanguage != null) {
                            final int index =
                                languages.indexOf(selectedLanguage);
                            settingsController.updateLanguage(locales[index]);
                            languageSelectProvider
                                .setIsActive(selectedLanguage.toLowerCase());
                            languageSelectProvider
                                .setCurrentLanguage(selectedLanguage);
                          }
                        },
                        items: languages
                            .map<DropdownMenuItem<String>>((String language) {
                          return DropdownMenuItem<String>(
                            value: language,
                            child: Text(
                              language,
                              style: tsRegular,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, RouteClass.swipeScreen);
                },
                title: AppLocalizations.of(context)!.continueLanguage,
                border: true,
              ),
              height50,
            ],
          ),
        ),
      ),
    );
  }
}
