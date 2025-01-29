import '../../../../../imports.dart';

class UpdateKycModel {
  final String panNumber;
  final String aadharNumber;
  final File? panCard;
  final File? aadhar;

  UpdateKycModel({
    required this.panNumber,
    required this.aadharNumber,
    this.panCard,
    this.aadhar,
  });

  factory UpdateKycModel.fromJson(Map<String, dynamic> json) {
    return UpdateKycModel(
      panNumber: json['panNumber'],
      aadharNumber: json['aadharNumber'],
      panCard: json['panCard'],
      aadhar: json['aadhar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'panNumber': panNumber,
      'aadharNumber': aadharNumber,
      'panCard': panCard,
      'aadhar': aadhar,
    };
  }
}
