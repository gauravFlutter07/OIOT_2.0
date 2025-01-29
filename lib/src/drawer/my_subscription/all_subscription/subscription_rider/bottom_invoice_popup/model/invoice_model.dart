import 'dart:convert';

class SubscriptionInvoiceModel {
  final String invoiceId;
  final String startDate;
  final String endDate;
  final String businessName;
  final String panNumber;
  final String gstNumber;
  final String totalCharges;
  final String gstAmount;
  final String couponDiscount;
  final String pgCharges;
  final String bankCharges;
  final String roundOff;
  final String paymentMode;
  final String paidAmount;

  SubscriptionInvoiceModel({
    required this.invoiceId,
    required this.startDate,
    required this.endDate,
    required this.businessName,
    required this.panNumber,
    required this.gstNumber,
    required this.totalCharges,
    required this.gstAmount,
    required this.couponDiscount,
    required this.pgCharges,
    required this.bankCharges,
    required this.roundOff,
    required this.paymentMode,
    required this.paidAmount,
  });

  factory SubscriptionInvoiceModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionInvoiceModel(
      invoiceId: json['invoiceId'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      businessName: json['businessName'],
      panNumber: json['panNumber'],
      gstNumber: json['gstNumber'],
      totalCharges: json['totalCharges'],
      gstAmount: json['gstAmount'],
      couponDiscount: json['couponDiscount'],
      pgCharges: json['pgCharges'],
      bankCharges: json['bankCharges'],
      roundOff: json['roundOff'],
      paymentMode: json['PaymentMode'],
      paidAmount: json['PaidAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'invoiceId': invoiceId,
      'startDate': startDate,
      'endDate': endDate,
      'businessName': businessName,
      'panNumber': panNumber,
      'gstNumber': gstNumber,
      'totalCharges': totalCharges,
      'gstAmount': gstAmount,
      'couponDiscount': couponDiscount,
      'pgCharges': pgCharges,
      'bankCharges': bankCharges,
      'roundOff': roundOff,
      'PaymentMode': paymentMode,
      'PaidAmount': paidAmount,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}
