class SubscriptionModel {
  final String vehicleType;
  final String vehicleModel;
  final bool isProfileAccepted;
  final String planName;
  final int planValidity;
  final int planAmount;
  final int remainingDays;
  final String validityType;
  final String startDate;
  final String endDate;

  SubscriptionModel({
    required this.vehicleType,
    required this.vehicleModel,
    required this.isProfileAccepted,
    required this.planName,
    required this.planValidity,
    required this.planAmount,
    required this.remainingDays,
    required this.validityType,
    required this.startDate,
    required this.endDate,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      vehicleType: json['vehicleType'] ?? '',
      vehicleModel: json['vehicleModel'] ?? '',
      isProfileAccepted: json['isProfileAccepted'] ?? false,
      planName: json['planName'] ?? '',
      planValidity: json['planValidity'] ?? 0,
      planAmount: json['planAmount'] ?? 0,
      remainingDays: json['remainingDays'] ?? 0,
      validityType: json['validityType'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
    );
  }
}
