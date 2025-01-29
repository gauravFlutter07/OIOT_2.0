class ForgotPasswordModel {
  final String mobile;
  final String appSignature;

  ForgotPasswordModel({
    required this.mobile,
    required this.appSignature,
  });

  Map<String, dynamic> toJson() {
    return {
      "mobile": mobile,
      "appSignature": appSignature,
    };
  }

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(
      mobile: json['mobile'] as String,
      appSignature: json['appSignature'] as String,
    );
  }
}
