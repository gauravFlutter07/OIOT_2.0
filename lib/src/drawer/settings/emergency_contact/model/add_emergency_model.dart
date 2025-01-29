class AddEmergencyContactModel {
  final String fullName;

  final String mobileNumber;
  final String email;

  AddEmergencyContactModel({
    required this.fullName,
    required this.mobileNumber,
    required this.email,
  });

  factory AddEmergencyContactModel.fromJson(Map<String, dynamic> json) {
    return AddEmergencyContactModel(
      fullName: json['fullName'],
      mobileNumber: json['mobileNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'email': email,
    };
  }
}
