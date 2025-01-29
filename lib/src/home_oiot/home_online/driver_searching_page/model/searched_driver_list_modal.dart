// To parse this JSON data, do
//
//     final rideBookNowModal = rideBookNowModalFromMap(jsonString);

import 'dart:convert';

RideBookNowModal rideBookNowModalFromMap(String str) => RideBookNowModal.fromMap(json.decode(str));

String rideBookNowModalToMap(RideBookNowModal data) => json.encode(data.toMap());

class RideBookNowModal {
  final bool? success;
  final String? message;
  final List<Driver>? drivers;

  RideBookNowModal({
    this.success,
    this.message,
    this.drivers,
  });

  factory RideBookNowModal.fromMap(Map<String, dynamic> json) => RideBookNowModal(
    success: json["success"],
    message: json["message"],
    drivers: json["drivers"] == null ? [] : List<Driver>.from(json["drivers"]!.map((x) => Driver.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "drivers": drivers == null ? [] : List<dynamic>.from(drivers!.map((x) => x.toMap())),
  };
}

class Driver {
  final String? id;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final Ratings? ratings;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? gender;
  final String? driverWillCome;

  Driver({
    this.id,
    this.phone,
    this.firstName,
    this.lastName,
    this.ratings,
    this.vehicleType,
    this.vehicleNumber,
    this.gender,
    this.driverWillCome,
  });

  factory Driver.fromMap(Map<String, dynamic> json) => Driver(
    id: json["id"],
    phone: json["phone"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    ratings: json["ratings"] == null ? null : Ratings.fromMap(json["ratings"]),
    vehicleType: json["vehicleType"],
    vehicleNumber: json["vehicleNumber"],
    gender: json["gender"],
    driverWillCome: json["driverWillCome"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "phone": phone,
    "firstName": firstName,
    "lastName": lastName,
    "ratings": ratings?.toMap(),
    "vehicleType": vehicleType,
    "vehicleNumber": vehicleNumber,
    "gender": gender,
    "driverWillCome": driverWillCome,
  };
}

class Ratings {
  final String? rating;
  final int? nos;
  final int? tottrip;
  final int? star;
  final String? cmts;

  Ratings({
    this.rating,
    this.nos,
    this.tottrip,
    this.star,
    this.cmts,
  });

  factory Ratings.fromMap(Map<String, dynamic> json) => Ratings(
    rating: json["rating"],
    nos: json["nos"],
    tottrip: json["tottrip"],
    star: json["star"],
    cmts: json["cmts"],
  );

  Map<String, dynamic> toMap() => {
    "rating": rating,
    "nos": nos,
    "tottrip": tottrip,
    "star": star,
    "cmts": cmts,
  };
}
