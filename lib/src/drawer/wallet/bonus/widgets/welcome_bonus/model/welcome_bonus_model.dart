class WelcomeBonusModel {
  final String id;
  final String bonusAmount;
  final String date;
  final String time;
  final bool isActive;

  WelcomeBonusModel({
    required this.id,
    required this.bonusAmount,
    required this.date,
    required this.time,
    required this.isActive,
  });

  factory WelcomeBonusModel.fromJson(Map<String, dynamic> json) {
    return WelcomeBonusModel(
      id: json['id'],
      bonusAmount: json['bonusAmount'],
      date: json['date'],
      time: json['time'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bonusAmount': bonusAmount,
      'date': date,
      'time': time,
      'isActive': isActive,
    };
  }
}
