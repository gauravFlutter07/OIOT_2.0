import '../../../../../imports.dart';

class EditProfileModel {
  final File? photo;
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String mobileNumber;
  final String email;
  final String address;
  final String state;
  final String city;
  final String id;
  final String? alternativeMobileNumber,cityName;

  EditProfileModel({
    required this.photo,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.id,
    required this.mobileNumber,
    required this.email,
    required this.address,
    required this.state,
    required this.city,
    required this.cityName,
    this.alternativeMobileNumber,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      photo: json['photo'],
      firstName: json['fname'],
      lastName: json['lname'],
      gender: json['gender'],
      dob: json['dob'],
      mobileNumber: json['mobileNumber'],
      email: json['email'],
      id: json['_id'],
      address: json['address'],
      state: json['state'],
      city: json['city'],
      cityName: json['cityname'],
      alternativeMobileNumber: json['alternativeMobileNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photo': photo,
      'fname': firstName,
      'lname': lastName,
      'gender': gender,
      'dob': dob,
      '_id': id,
      'mobileNumber': mobileNumber,
      'email': email,
      'address': address,
      'state': state,
      'city': city,
      'cityname': city,
      'alternativeMobileNumber': alternativeMobileNumber,
    };
  }
}
