// ignore_for_file: prefer_null_aware_operators

import '../../../../../imports.dart';

class PhoneContactModel {
  final String displayName;
  final String phoneNumber;
  final File? photo;

  PhoneContactModel({
    required this.displayName,
    required this.phoneNumber,
    this.photo,
  });

  factory PhoneContactModel.fromJson(Map<String, dynamic> json) {
    return PhoneContactModel(
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'],
      photo: json['photo'] != null ? File(json['photo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'photo': photo != null ? photo!.path : null,
    };
  }

  Map<String, dynamic> toFormData() {
    return {
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      if (photo != null) 'photo': MultipartFile.fromFileSync(photo!.path),
    };
  }
}
