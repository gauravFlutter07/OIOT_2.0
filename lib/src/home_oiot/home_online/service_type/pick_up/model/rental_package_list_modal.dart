// To parse this JSON data, do
//
//     final rentalPackListModal = rentalPackListModalFromMap(jsonString);

import 'dart:convert';

RentalPackListModal rentalPackListModalFromMap(String str) => RentalPackListModal.fromMap(json.decode(str));

String rentalPackListModalToMap(RentalPackListModal data) => json.encode(data.toMap());

class RentalPackListModal {
  final bool? success;
  final String? message;
  final List<PackageDetail>? packageDetail;
  final List<String>? serviceDetail;
  final String? description;

  RentalPackListModal({
    this.success,
    this.message,
    this.packageDetail,
    this.serviceDetail,
    this.description,
  });

  factory RentalPackListModal.fromMap(Map<String, dynamic> json) => RentalPackListModal(
    success: json["success"],
    message: json["message"],
    packageDetail: json["packageDetail"] == null ? [] : List<PackageDetail>.from(json["packageDetail"]!.map((x) => PackageDetail.fromMap(x))),
    serviceDetail: json["serviceDetail"] == null ? [] : List<String>.from(json["serviceDetail"]!.map((x) => x)),
    description: json["Description"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "packageDetail": packageDetail == null ? [] : List<dynamic>.from(packageDetail!.map((x) => x.toMap())),
    "serviceDetail": serviceDetail == null ? [] : List<dynamic>.from(serviceDetail!.map((x) => x)),
    "Description": description,
  };
}

class PackageDetail {
  final String? id;
  final String? name;
  final int? price;
  final int? duration;
  final int? distance;

  PackageDetail({
    this.id,
    this.name,
    this.price,
    this.duration,
    this.distance,
  });

  factory PackageDetail.fromMap(Map<String, dynamic> json) => PackageDetail(
    id: json["_id"],
    name: json["name"],
    price: json["price"],
    duration: json["duration"],
    distance: json["distance"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "price": price,
    "duration": duration,
    "distance": distance,
  };
}
