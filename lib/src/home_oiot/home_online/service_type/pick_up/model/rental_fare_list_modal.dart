// To parse this JSON data, do
//
//     final rentalFareListModal = rentalFareListModalFromMap(jsonString);

import 'dart:convert';

RentalFareListModal rentalFareListModalFromMap(String str) => RentalFareListModal.fromMap(json.decode(str));

String rentalFareListModalToMap(RentalFareListModal data) => json.encode(data.toMap());

class RentalFareListModal {
  final bool? success;
  final String? message;
  final List<RentalVehicleModal>? data;

  RentalFareListModal({
    this.success,
    this.message,
    this.data,
  });

  factory RentalFareListModal.fromMap(Map<String, dynamic> json) => RentalFareListModal(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<RentalVehicleModal>.from(json["data"]!.map((x) => RentalVehicleModal.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class RentalVehicleModal {
  final String? id;
  final String? tripTypeCode;
  final String? type;
  final String? bkm;
  final String? timeFare;
  final String? baseFare;
  final String? packageDistance;
  final String? packageDuration;
  final String? file;
  final String? description;
  final int? seat;
  final String? packageId;
  final String? fare;

  RentalVehicleModal({
    this.id,
    this.tripTypeCode,
    this.type,
    this.bkm,
    this.timeFare,
    this.baseFare,
    this.packageDistance,
    this.packageDuration,
    this.file,
    this.description,
    this.seat,
    this.packageId,
    this.fare,
  });

  factory RentalVehicleModal.fromMap(Map<String, dynamic> json) => RentalVehicleModal(
    id: json["_id"],
    tripTypeCode: json["tripTypeCode"],
    type: json["type"],
    bkm: json["bkm"],
    timeFare: json["timeFare"],
    baseFare: json["baseFare"],
    packageDistance: json["packageDistance"],
    packageDuration: json["packageDuration"],
    file: json["file"],
    description: json["description"],
    seat: json["seat"],
    packageId: json["packageId"],
    fare: json["fare"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "tripTypeCode": tripTypeCode,
    "type": type,
    "bkm": bkm,
    "timeFare": timeFare,
    "baseFare": baseFare,
    "packageDistance": packageDistance,
    "packageDuration": packageDuration,
    "file": file,
    "description": description,
    "seat": seat,
    "packageId": packageId,
    "fare": fare,
  };
}
