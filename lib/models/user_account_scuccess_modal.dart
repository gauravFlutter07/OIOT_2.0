import 'dart:convert';

class CreateUserSuccessModal {
  final bool? success;
  final String? message;
  final List<UserModal>? datas;
  final String? token;
  final String? fbCusToken;

  CreateUserSuccessModal({
    this.success,
    this.message,
    this.datas,
    this.token,
    this.fbCusToken,
  });

  factory CreateUserSuccessModal.fromJson(String str) => CreateUserSuccessModal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateUserSuccessModal.fromMap(Map<String, dynamic> json) => CreateUserSuccessModal(
    success: json["success"],
    message: json["message"],
    datas: json["datas"] == null ? [] : List<UserModal>.from(json["datas"]!.map((x) => UserModal.fromMap(x))),
    token: json["token"],
    fbCusToken: json["FbCusToken"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "datas": datas == null ? [] : List<dynamic>.from(datas!.map((x) => x?.toMap())),
    "token": token,
    "FbCusToken": fbCusToken,
  };
}

class UserModal {
  final String? name;
  final String? email;

  UserModal({
    this.name,
    this.email,
  });

  factory UserModal.fromJson(String str) => UserModal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModal.fromMap(Map<String, dynamic> json) => UserModal(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
  };
}
