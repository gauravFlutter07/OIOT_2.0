// To parse this JSON data, do
//
//     final userProfileModal = userProfileModalFromMap(jsonString);

import 'dart:convert';

List<UserProfileModal> userProfileModalFromMap(String str) => List<UserProfileModal>.from(json.decode(str).map((x) => UserProfileModal.fromMap(x)));

String userProfileModalToMap(List<UserProfileModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UserProfileModal {
  final String? phone;
  final String? email;
  final dynamic lname;
  final dynamic fname;
  final bool? status;
  final String? referal;
  final int? balance;
  final String? gender;
  final List<dynamic>? address;
  final Rating? rating;
  final List<dynamic>? emgContact;
  final String? profile;
  final dynamic phcode;
  final int? v;
  final String? callmask;
  final String? loginId;
  final String? loginType;
  final String? verificationCode;
  final String? cityname;
  final String? city;
  final String? statename;
  final String? state;
  final String? cntyname;
  final dynamic cnty;
  final String? scity;
  final String? lastCanceledDate;
  final int? canceledCount;
  final dynamic lang;
  final dynamic fcmId;
  final dynamic cur;
  final dynamic nic;
  final String? profileurl;
  final String? googleApiMobile;
  final String? googleApiIos;

  UserProfileModal({
    this.phone,
    this.email,
    this.lname,
    this.fname,
    this.status,
    this.referal,
    this.balance,
    this.gender,
    this.address,
    this.rating,
    this.emgContact,
    this.profile,
    this.phcode,
    this.v,
    this.callmask,
    this.loginId,
    this.loginType,
    this.verificationCode,
    this.cityname,
    this.city,
    this.statename,
    this.state,
    this.cntyname,
    this.cnty,
    this.scity,
    this.lastCanceledDate,
    this.canceledCount,
    this.lang,
    this.fcmId,

    this.cur,
    this.nic,
    this.profileurl,
    this.googleApiMobile,
    this.googleApiIos,
  });

  factory UserProfileModal.fromMap(Map<String, dynamic> json) => UserProfileModal(
    phone: json["phone"],
    email: json["email"],
    lname: json["lname"],
    fname: json["fname"],
    status: json["status"],
    referal: json["referal"],
    balance: json["balance"],
    gender: json["gender"],
    address: json["address"] == null ? [] : List<dynamic>.from(json["address"]!.map((x) => x)),
    rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
    emgContact: json["EmgContact"] == null ? [] : List<dynamic>.from(json["EmgContact"]!.map((x) => x)),
    profile: json["profile"],
    phcode: json["phcode"],
    v: json["__v"],
    callmask: json["callmask"],
    loginId: json["loginId"],
    loginType: json["loginType"],
    verificationCode: json["verificationCode"],
    cityname: json["cityname"],
    city: json["city"],
    statename: json["statename"],
    state: json["state"],
    cntyname: json["cntyname"],
    cnty: json["cnty"],
    scity: json["scity"],
    lastCanceledDate: json["lastCanceledDate"],
    canceledCount: json["canceledCount"],
    lang: json["lang"],
    fcmId: json["fcmId"],
    cur: json["cur"],
    nic: json["nic"],
    profileurl: json["profileurl"],
    googleApiMobile: json["googleApiMobile"],
    googleApiIos: json["googleApiIos"],
  );

  Map<String, dynamic> toMap() => {
    "phone": phone,
    "email": email,
    "lname": lname,
    "fname": fname,
    "status": status,
    "referal": referal,
    "balance": balance,
    "gender": gender,
    "address": address == null ? [] : List<dynamic>.from(address!.map((x) => x)),
    "rating": rating?.toMap(),
    "EmgContact": emgContact == null ? [] : List<dynamic>.from(emgContact!.map((x) => x)),
    "profile": profile,
    "phcode": phcode,
    "__v": v,
    "callmask": callmask,
    "loginId": loginId,
    "loginType": loginType,
    "verificationCode": verificationCode,
    "cityname": cityname,
    "city": city,
    "statename": statename,
    "state": state,
    "cntyname": cntyname,
    "cnty": cnty,
    "scity": scity,
    "lastCanceledDate": lastCanceledDate,
    "canceledCount": canceledCount,
    "lang": lang,
    "fcmId": fcmId,
    "cur": cur,
    "nic": nic,
    "profileurl": profileurl,
    "googleApiMobile": googleApiMobile,
    "googleApiIos": googleApiIos,
  };
}


class Rating {
  final String? rating;
  final int? nos;
  final String? cmts;

  Rating({
    this.rating,
    this.nos,
    this.cmts,
  });

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
    rating: json["rating"],
    nos: json["nos"],
    cmts: json["cmts"],
  );

  Map<String, dynamic> toMap() => {
    "rating": rating,
    "nos": nos,
    "cmts": cmts,
  };
}
