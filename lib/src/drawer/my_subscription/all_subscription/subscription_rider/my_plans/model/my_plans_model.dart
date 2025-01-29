class MyPlansModel {
  final String annualPlanDays;
  final String standardPlan;
  final String remainingDays;
  final String validity;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String days365Pack;
  final String days180Pack;
  final String days90Pack;

  MyPlansModel({
    required this.annualPlanDays,
    required this.standardPlan,
    required this.remainingDays,
    required this.validity,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.days365Pack,
    required this.days180Pack,
    required this.days90Pack,
  });

  factory MyPlansModel.fromJson(Map<String, dynamic> json) {
    return MyPlansModel(
      annualPlanDays: json['AnnualPlanDays'] ?? '',
      standardPlan: json['StandardPlan'] ?? '',
      remainingDays: json['remainingDays'] ?? '',
      validity: json['Validity'] ?? '',
      startDate: json['StartDate'] ?? '',
      startTime: json['StartTime'] ?? '',
      endDate: json['EndDate'] ?? '',
      endTime: json['EndTime'] ?? '',
      days365Pack: json['365DaysPack'] ?? '',
      days180Pack: json['180DaysPack'] ?? '',
      days90Pack: json['90DaysPack'] ?? '',
    );
  }
}
