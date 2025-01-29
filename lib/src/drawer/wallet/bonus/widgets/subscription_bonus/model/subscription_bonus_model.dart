class SubscriptionBonusModel {
  final String id;
  final String bonusAmount;
  final String validityPeriod;
  final bool isActive;

  SubscriptionBonusModel({
    required this.id,
    required this.bonusAmount,
    required this.validityPeriod,
    required this.isActive,
  });

  factory SubscriptionBonusModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionBonusModel(
      id: json['id'],
      bonusAmount: json['bonusAmount'],
      validityPeriod: json['validityPeriod'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bonusAmount': bonusAmount,
      'validityPeriod': validityPeriod,
      'isActive': isActive,
    };
  }
}
