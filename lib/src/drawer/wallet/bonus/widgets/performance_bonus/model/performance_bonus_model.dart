class PerformanceBonusModel {
  final String id;
  final String bonusAmount;
  final String expiryDate;
  final String expiryTime;

  final bool isActive;

  PerformanceBonusModel({
    required this.id,
    required this.bonusAmount,
    required this.expiryDate,
    required this.expiryTime,
    required this.isActive,
  });

  factory PerformanceBonusModel.fromJson(Map<String, dynamic> json) {
    return PerformanceBonusModel(
      id: json['id'],
      bonusAmount: json['bonusAmount'],
      expiryDate: json['expiryDate'],
      expiryTime: json['expiryTime'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bonusAmount': bonusAmount,
      'expiryDate': expiryDate,
      'expiryTime': expiryTime,
      'isActive': isActive,
    };
  }
}
