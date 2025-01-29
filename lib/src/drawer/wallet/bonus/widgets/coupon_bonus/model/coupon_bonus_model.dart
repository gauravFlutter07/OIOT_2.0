class CouponModel {
  final String id;
  final String couponCode;
  final String discountAmount;
  final String expirationDate;
  final bool isActive;

  CouponModel({
    required this.id,
    required this.couponCode,
    required this.discountAmount,
    required this.expirationDate,
    required this.isActive,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['id'],
      couponCode: json['couponCode'],
      discountAmount: json['discountAmount'],
      expirationDate: json['expirationDate'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'couponCode': couponCode,
      'discountAmount': discountAmount,
      'expirationDate': expirationDate,
      'isActive': isActive,
    };
  }
}
