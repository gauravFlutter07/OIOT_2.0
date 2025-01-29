class LoginModel {
  final String mobile;

  LoginModel({required this.mobile});

  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
    };
  }
}
