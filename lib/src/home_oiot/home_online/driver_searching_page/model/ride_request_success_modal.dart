// To parse this JSON data, do
//
//     final rideRequestSuccessModal = rideRequestSuccessModalFromMap(jsonString);

import 'dart:convert';

RideRequestSuccessModal rideRequestSuccessModalFromMap(String str) => RideRequestSuccessModal.fromMap(json.decode(str));

String rideRequestSuccessModalToMap(RideRequestSuccessModal data) => json.encode(data.toMap());

class RideRequestSuccessModal {
  final bool? success;
  final String? message;
  final String? requestDetails;
  final int? tripId;
  final String? otp;

  RideRequestSuccessModal({
    this.success,
    this.message,
    this.requestDetails,
    this.tripId,
    this.otp,
  });

  factory RideRequestSuccessModal.fromMap(Map<String, dynamic> json) => RideRequestSuccessModal(
    success: json["success"],
    message: json["message"],
    requestDetails: json["requestDetails"],
    tripId: json["tripId"],
    otp: json["OTP"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "requestDetails": requestDetails,
    "tripId": tripId,
    "OTP": otp,
  };
}
