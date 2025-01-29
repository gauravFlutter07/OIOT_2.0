class ViewHistoryModel {
  final String annualPlanDays;
  final String standardPlan;
  final String remainingDays;
  final String validity;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;

  ViewHistoryModel({
    required this.annualPlanDays,
    required this.standardPlan,
    required this.remainingDays,
    required this.validity,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
  });

  factory ViewHistoryModel.fromJson(Map<String, dynamic> json) {
    return ViewHistoryModel(
      annualPlanDays: json['AnnualPlanDays'] ?? '',
      standardPlan: json['StandardPlan'] ?? '',
      remainingDays: json['remainingDays'] ?? '',
      validity: json['Validity'] ?? '',
      startDate: json['StartDate'] ?? '',
      startTime: json['StartTime'] ?? '',
      endDate: json['EndDate'] ?? '',
      endTime: json['EndTime'] ?? '',
    );
  }
}
