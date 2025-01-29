class WalletDataModel {
  final String totalBalance;
  final String walletHistoryId;
  final String walletHistoryAmount;
  final String walletHistoryStatus;
  final String walletHistoryDate;
  final String walletHistoryTime;
  final String purpose;

  WalletDataModel({
    required this.totalBalance,
    required this.walletHistoryId,
    required this.walletHistoryAmount,
    required this.walletHistoryStatus,
    required this.walletHistoryDate,
    required this.walletHistoryTime,
    required this.purpose,
  });

  factory WalletDataModel.fromJson(Map<String, dynamic> json) {
    return WalletDataModel(
      totalBalance: json['totalBalance'],
      walletHistoryId: json['walletHistoryId'],
      walletHistoryAmount: json['walletHistoryAmount'],
      walletHistoryStatus: json['walletHistoryStatus'],
      walletHistoryDate: json['walletHistoryDate'],
      walletHistoryTime: json['walletHistoryTime'],
      purpose: json['purpose'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalBalance': totalBalance,
      'walletHistoryId': walletHistoryId,
      'walletHistoryAmount': walletHistoryAmount,
      'walletHistoryStatus': walletHistoryStatus,
      'walletHistoryDate': walletHistoryDate,
      'walletHistoryTime': walletHistoryTime,
      'purpose': purpose,
    };
  }
}
