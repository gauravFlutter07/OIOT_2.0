class MyProfileModel {
  String photo;
  String name;
  String mobile;
  String age;
  String gender;
  String email;
  String location;
  String state;
  String city;
  String aadhar;
  String dateOfBirth;
  String referralCode;
  String userRating;
  MyProfileModel({
    required this.photo,
    required this.name,
    required this.mobile,
    required this.age,
    required this.gender,
    required this.email,
    required this.location,
    required this.state,
    required this.city,
    required this.aadhar,
    required this.dateOfBirth,
    required this.referralCode,
    required this.userRating,
  });

  factory MyProfileModel.fromJson(Map<String, dynamic> json) {
    return MyProfileModel(
      photo: json['photo'],
      name: json['Name'],
      mobile: json['Mobile'],
      age: json['Age'],
      gender: json['Gender'],
      email: json['Email'],
      location: json['Location'],
      state: json['State'],
      city: json['City'],
      aadhar: json['Aadhar'],
      dateOfBirth: json['DOB'],
      referralCode: json['ReferralCode'] ?? '',
      userRating: json['userRating'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "photo": photo,
      "Name": name,
      "Mobile": mobile,
      "Age": age,
      "Gender": gender,
      "Email": email,
      "Location": location,
      "State": state,
      "City": city,
      "Aadhar": aadhar,
      "DOB": dateOfBirth,
      "ReferralCode": referralCode,
      "userRating": userRating,
    };
  }
}
