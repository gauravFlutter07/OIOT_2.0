class ReferHistoryModel {
  final String totalBalance;
  final String referName;
  final String referDate;
  final String referTime;
  final String referStatus;
  final String referCode;
  final String referType;
  final String referralAmount;

  ReferHistoryModel({
    required this.totalBalance,
    required this.referName,
    required this.referDate,
    required this.referTime,
    required this.referStatus,
    required this.referCode,
    required this.referType,
    required this.referralAmount,
  });

  factory ReferHistoryModel.fromJson(Map<String, dynamic> json) {
    return ReferHistoryModel(
      totalBalance: json['totalBalance'],
      referName: json['referName'],
      referDate: json['referDate'],
      referTime: json['referTime'],
      referStatus: json['referStatus'],
      referCode: json['referCode'],
      referType: json['referType'],
      referralAmount: json['referralAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalBalance": totalBalance,
      "referName": referName,
      "referDate": referDate,
      "referTime": referTime,
      "referStatus": referStatus,
      "referCode": referCode,
      "referType": referType,
      "referralAmount": referralAmount,
    };
  }
}
