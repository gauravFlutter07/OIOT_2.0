class AddContactModel {
  String fullname;
  String mobileNumber;
  String emailAddress;

  AddContactModel({
    required this.fullname,
    required this.mobileNumber,
    required this.emailAddress,
  });

  factory AddContactModel.fromJson(Map<String, dynamic> json) {
    return AddContactModel(
      fullname: json['fullname'],
      mobileNumber: json['mobileNumber'],
      emailAddress: json['emailAddress'],
    );
  }

  Map<String, dynamic> toJson() {
    return AddContactModel(
      fullname: fullname,
      mobileNumber: mobileNumber,
      emailAddress: emailAddress,
    ).toJson();
  }
}
