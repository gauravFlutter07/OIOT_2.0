class EmergencyContactModel {
  String name;
  String phoneNumber;
  bool switchState;

  EmergencyContactModel(
      {required this.name,
      required this.phoneNumber,
      this.switchState = false});

  factory EmergencyContactModel.fromJson(Map<String, dynamic> json) {
    return EmergencyContactModel(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
