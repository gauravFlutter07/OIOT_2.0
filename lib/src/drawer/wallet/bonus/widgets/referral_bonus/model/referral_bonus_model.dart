class ReferralBonusModel {
  final String id;
  final String bonusAmount;
  final String date;
  final String time;
  final bool status;

  ReferralBonusModel({
    required this.id,
    required this.bonusAmount,
    required this.date,
    required this.time,
    required this.status,
  });

  factory ReferralBonusModel.fromJson(Map<String, dynamic> json) {
    return ReferralBonusModel(
      id: json['id'],
      bonusAmount: json['bonusAmount'],
      date: json['date'],
      time: json['time'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bonusAmount': bonusAmount,
      'date': date,
      'time': time,
      'status': status,
    };
  }
}
