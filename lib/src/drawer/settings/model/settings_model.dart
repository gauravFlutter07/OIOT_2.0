class SettingsModel {
  bool autoSubscription;
  bool autoInsurance;
  bool autoAds;
  bool autoTripShare;
  bool phoneBookEnabled;
  bool referralBonusEnabled;
  bool walletEnabled;
  bool notificationEnabled;

  SettingsModel({
    required this.autoSubscription,
    required this.autoInsurance,
    required this.autoAds,
    required this.autoTripShare,
    required this.phoneBookEnabled,
    required this.referralBonusEnabled,
    required this.walletEnabled,
    required this.notificationEnabled,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      autoSubscription: json['autoSubscription'] ?? false,
      autoInsurance: json['autoInsurance'] ?? false,
      autoAds: json['autoAds'] ?? false,
      autoTripShare: json['autoTripShare'] ?? false,
      phoneBookEnabled: json['phoneBookEnabled'] ?? false,
      referralBonusEnabled: json['referralBonusEnabled'] ?? false,
      walletEnabled: json['walletEnabled'] ?? false,
      notificationEnabled: json['notificationEnabled'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'autoSubscription': autoSubscription,
      'autoInsurance': autoInsurance,
      'autoAds': autoAds,
      'autoTripShare': autoTripShare,
      'phoneBookEnabled': phoneBookEnabled,
      'referralBonusEnabled': referralBonusEnabled,
      'walletEnabled': walletEnabled,
      'notificationEnabled': notificationEnabled,
    };
  }
}
