class AddWalletModel {
  final String amount;

  AddWalletModel({required this.amount});

  factory AddWalletModel.fromJson(Map<String, dynamic> json) {
    return AddWalletModel(amount: json['amount'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
    };
  }
}
