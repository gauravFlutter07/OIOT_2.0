import 'package:oiot/imports.dart';

class CreateAccountModel {
  final File? photo;
  final String? fullname;
  final String mobile;
  final String? email;
  final String? gender;
  final String appSignature;
  final String? password;
  final dynamic referral;

  CreateAccountModel(
      {this.photo,
      required this.fullname,
      required this.mobile,
      required this.appSignature,
      this.email,
      this.gender,
      this.password,
      this.referral});

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) {
    return CreateAccountModel(
      photo: json['photo'],
      fullname: json['fullname'],
      mobile: json['mobile'],
      email: json['email'],
      gender: json['gender'],
      password: json['password'],
      appSignature: json['appSignature'],
      referral: json['referral'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "photo": photo,
      "fname": fullname,
      "phone": mobile,
      "email": email,
      "gender": gender,
      "password": password,
      "appSignature": appSignature,
      "referral": referral,
    };
  }
}
