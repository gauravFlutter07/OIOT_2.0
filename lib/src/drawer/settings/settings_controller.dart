import 'dart:developer';

import '../../../imports.dart';

class SettingsProvider extends ChangeNotifier {
  List<SettingsModel> _settingsModel = [];
  List<SettingsModel> get settingsModel => _settingsModel;

  bool _isClickedSub = false;
  bool get isClickedSub => _isClickedSub;

  bool _isClickedInsurance = false;
  bool get isClickedInsurance => _isClickedInsurance;

  bool _isClickedAds = false;
  bool get isClickedAds => _isClickedAds;

  bool _isClickedTripShare = false;
  bool get isClickedTripShare => _isClickedTripShare;

  void selectedButtonSubscriptionFunction(bool value) {
    _isClickedSub = value;
    notifyListeners();
  }

  void selectedButtonInsuranceFunction(bool value) {
    _isClickedInsurance = value;
    notifyListeners();
  }

  void selectedButtonAdsFunction(bool value) {
    _isClickedAds = value;
    notifyListeners();
  }

  void selectedButtonTripShareFunction(bool value) {
    _isClickedTripShare = value;
    notifyListeners();
  }

  Future<void> fetchSettings() async {
    SettingsServices settingsServices = SettingsServices();
    SettingsModel? result = await settingsServices.fetchsettingsData();

    if (result != null) {
      _settingsModel = [result];
      log('Settings fetched successfully: $_settingsModel');
      notifyListeners();
    } else {
      log('Failed to fetch settings data or data is empty.');
    }
  }

  Future<bool> postSettingsData(BuildContext context) async {
    log('Sending settings data to the backend...');

    // Instantiate the SettingsServices
    SettingsServices settingsServices = SettingsServices();

    // Prepare the settings data
    SettingsModel data = SettingsModel(
      autoSubscription: _isClickedSub,
      autoInsurance: _isClickedInsurance,
      autoAds: _isClickedAds,
      autoTripShare: _isClickedTripShare,
      phoneBookEnabled: _getApplianceStatus("Phone Book"),
      referralBonusEnabled: _getApplianceStatus("Referral Bonus"),
      walletEnabled: _getApplianceStatus("Wallet"),
      notificationEnabled: _getApplianceStatus("Notification"),
    );

    log('Settings data prepared: $data');

    // Send the settings data to the backend
    final result = await settingsServices.postSettingsData(data);

    if (result != null && result['status'] == true) {
      log('Settings data successfully sent to the backend.');
      await Future.delayed(const Duration(seconds: 1));

      return true;
    } else {
      log('Failed to send settings data to the backend.');
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    }
  }

  bool _getApplianceStatus(String name) {
    return appliances
        .firstWhere((element) => element.name == name,
            orElse: () => Appliance(name))
        .isOn;
  }

  List<Appliance> appliances = [
    Appliance('Phone Book'),
    Appliance('Referral Bonus'),
    Appliance('Wallet'),
    Appliance('Notification'),
  ];

  void toggleAppliance(int index) {
    appliances[index].isOn = !appliances[index].isOn;
    notifyListeners();
  }
}
