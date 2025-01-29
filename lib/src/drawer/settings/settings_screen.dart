// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import '../../../imports.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: _SettingsPage(),
    );
  }
}

class _SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final settingsProviderWatch = context.watch<SettingsProvider>();
    // final languageSelectProvider =
    //     Provider.of<LanguageSelectProvider>(context, listen: false);
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
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: horizontalPadding10,
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: padding8,
                  child: CustomHeader(
                      title: AppLocalizations.of(context)!.settings),
                ),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const EmergencyContactPage(),
                //       ),
                //     );
                //   },
                //   child: ListTile(
                //     contentPadding: const EdgeInsets.symmetric(
                //       vertical: 5.0,
                //       horizontal: 20.0,
                //     ),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: circularBorderRadius5,
                //     ),
                //     tileColor: lightBlue,
                //     leading: Image(
                //       image: AssetImage(sosIcon),
                //     ),
                //     title: Padding(
                //       padding: padding5,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Text(
                //             AppLocalizations.of(context)!.emergencyContact,
                //             style: tsRegularBold,
                //           ),
                //           const Icon(Icons.ads_click),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: leftPadding8,
                      child: Text(
                        AppLocalizations.of(context)!.changeLanguage,
                        style: tsRegularBold,
                      ),
                    ),
                  ],
                ),
                Card(
                  color: blueGreyshade50,
                  child: Column(
                    children: [
                      Consumer<LanguageSelectProvider>(
                        builder: (context, languageSelectProvider, _) {
                          return Padding(
                            padding: padding8,
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              isExpanded: true,
                              value: languageSelectProvider.currentLanguage,
                              onChanged: (String? selectedLanguage) {
                                if (selectedLanguage != null) {
                                  final int index =
                                      languages.indexOf(selectedLanguage);
                                  settingsController
                                      .updateLanguage(locales[index]);
                                  languageSelectProvider.setIsActive(
                                      selectedLanguage.toLowerCase());
                                  languageSelectProvider
                                      .setCurrentLanguage(selectedLanguage);
                                }
                              },
                              items: languages.map<DropdownMenuItem<String>>(
                                  (String language) {
                                return DropdownMenuItem<String>(
                                  value: language,
                                  child: Text(language),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                height10,
                Padding(
                  padding: leftPadding8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.yourSubscription,
                          style: tsRegularBold),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text(
                                AppLocalizations.of(context)!.auto,
                                style: tsRegularBold,
                              ),
                              value: false,
                              activeColor: blackColor,
                              groupValue: settingsProviderWatch.isClickedSub,
                              onChanged: (value) {
                                settingsProvider
                                    .selectedButtonSubscriptionFunction(value!);
                                settingsProvider.postSettingsData(context);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text(
                                AppLocalizations.of(context)!.manual,
                                style: tsRegularBold,
                              ),
                              value: true,
                              activeColor: blackColor,
                              groupValue: settingsProviderWatch.isClickedSub,
                              onChanged: (value) {
                                settingsProvider
                                    .selectedButtonSubscriptionFunction(value!);
                                settingsProvider.postSettingsData(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height10,
                Padding(
                  padding: leftPadding8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.travelInsurance,
                          style: tsRegularBold),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text(
                                AppLocalizations.of(context)!.auto,
                                style: tsRegularBold,
                              ),
                              value: false,
                              activeColor: blackColor,
                              groupValue:
                                  settingsProviderWatch.isClickedInsurance,
                              onChanged: (value) {
                                settingsProvider
                                    .selectedButtonInsuranceFunction(value!);
                                settingsProvider.postSettingsData(context);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text(
                                AppLocalizations.of(context)!.manual,
                                style: tsRegularBold,
                              ),
                              value: true,
                              activeColor: blackColor,
                              groupValue:
                                  settingsProviderWatch.isClickedInsurance,
                              onChanged: (value) {
                                settingsProvider
                                    .selectedButtonInsuranceFunction(value!);
                                settingsProvider.postSettingsData(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: leftPadding8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.advertisements,
                          style: tsRegularBold),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text(
                                AppLocalizations.of(context)!.auto,
                                style: tsRegularBold,
                              ),
                              value: false,
                              activeColor: blackColor,
                              groupValue: settingsProviderWatch.isClickedAds,
                              onChanged: (value) {
                                settingsProvider
                                    .selectedButtonAdsFunction(value!);
                                settingsProvider.postSettingsData(context);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text(
                                AppLocalizations.of(context)!.manual,
                                style: tsRegularBold,
                              ),
                              value: true,
                              activeColor: blackColor,
                              groupValue: settingsProviderWatch.isClickedAds,
                              onChanged: (value) {
                                settingsProvider
                                    .selectedButtonAdsFunction(value!);
                                settingsProvider.postSettingsData(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: leftPadding8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.tripSharing,
                          style: tsRegularBold),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text(
                                AppLocalizations.of(context)!.auto,
                                style: tsRegularBold,
                              ),
                              value: false,
                              activeColor: blackColor,
                              groupValue:
                                  settingsProviderWatch.isClickedTripShare,
                              onChanged: (value) {
                                settingsProvider
                                    .selectedButtonTripShareFunction(value!);
                                settingsProvider.postSettingsData(context);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text(
                                AppLocalizations.of(context)!.manual,
                                style: tsRegularBold,
                              ),
                              value: true,
                              activeColor: blackColor,
                              groupValue:
                                  settingsProviderWatch.isClickedTripShare,
                              onChanged: (value) {
                                settingsProvider
                                    .selectedButtonTripShareFunction(value!);
                                settingsProvider.postSettingsData(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: leftPadding8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height10,
                      SizedBox(
                        height: 230.0,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: settingsProvider.appliances.length,
                          itemBuilder: (context, index) {
                            return SwitchListTile(
                              inactiveThumbColor: redColor,
                              title: Text(
                                settingsProvider.appliances[index].name,
                                style: tsRegularBold,
                              ),
                              value: settingsProvider.appliances[index].isOn,
                              onChanged: (bool value) {
                                settingsProvider.toggleAppliance(index);
                              },
                            );
                          },
                        ),
                      ),
                      height10,
                      CustomButton(
                        onTap: () async {
                          await settingsProvider.fetchSettings();

                          bool success =
                              await settingsProvider.postSettingsData(context);
                          if (success) {
                            Fluttertoast.showToast(
                                msg: AppLocalizations.of(context)!
                                    .settingsSavedSuccessfully);
                            Navigator.pushNamed(
                                context, RouteClass.userOfflineHome);
                          } else {
                            Fluttertoast.showToast(
                                msg: AppLocalizations.of(context)!
                                    .failedToSaveSettings);
                          }
                        },
                        title: AppLocalizations.of(context)!.saveSettings,
                        border: false,
                      ),
                      height25,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget RadioButtonTile(
    String left,
    String right,
    String title,
    String currentOption,
    Function(String) onChanged,
  ) {
    return Container(
      color: whiteColor,
      child: ListTile(
        title: Text(
          title,
          style: tsSmallBold,
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: left,
                    groupValue: currentOption,
                    onChanged: (value) => onChanged(value.toString()),
                  ),
                  Text(
                    left,
                    style: tsRegularBold,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: right,
                    groupValue: currentOption,
                    onChanged: (value) => onChanged(value.toString()),
                  ),
                  Text(
                    right,
                    style: tsRegularBold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Appliance {
  String name;
  bool isOn;
  Appliance(this.name, {this.isOn = false});
}
