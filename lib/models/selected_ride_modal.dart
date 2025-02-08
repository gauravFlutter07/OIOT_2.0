// To parse this JSON data, do
//
//     final selectedRIdeDetailsModal = selectedRIdeDetailsModalFromJson(jsonString);

import 'dart:convert';

SelectedRIdeDetailsModal selectedRIdeDetailsModalFromJson(String str) => SelectedRIdeDetailsModal.fromJson(json.decode(str));

String selectedRIdeDetailsModalToJson(SelectedRIdeDetailsModal data) => json.encode(data.toJson());

class SelectedRIdeDetailsModal {
  bool? success;
  String? message;
  DistanceDetails? distanceDetails;
  VehicleDetailsAndFare? vehicleDetailsAndFare;
  String? pickupCity;
  String? estimationId;

  SelectedRIdeDetailsModal({
    this.success,
    this.message,
    this.distanceDetails,
    this.vehicleDetailsAndFare,
    this.pickupCity,
    this.estimationId,
  });

  factory SelectedRIdeDetailsModal.fromJson(Map<String, dynamic> json) => SelectedRIdeDetailsModal(
    success: json["success"],
    message: json["message"],
    distanceDetails: json["distanceDetails"] == null ? null : DistanceDetails.fromJson(json["distanceDetails"]),
    vehicleDetailsAndFare: json["vehicleDetailsAndFare"] == null ? null : VehicleDetailsAndFare.fromJson(json["vehicleDetailsAndFare"]),
    pickupCity: json["pickupCity"],
    estimationId: json["estimationId"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "distanceDetails": distanceDetails?.toJson(),
    "vehicleDetailsAndFare": vehicleDetailsAndFare?.toJson(),
    "pickupCity": pickupCity,
    "estimationId": estimationId,
  };
}

class DistanceDetails {
  bool? error;
  String? msg;
  int? distanceValue;
  String? distanceLabel;
  int? timeValue;
  String? timeLable;
  String? from;
  String? to;
  String? distanceLable;
  List<String>? startCords;
  List<String>? endcoords;

  DistanceDetails({
    this.error,
    this.msg,
    this.distanceValue,
    this.distanceLabel,
    this.timeValue,
    this.timeLable,
    this.from,
    this.to,
    this.distanceLable,
    this.startCords,
    this.endcoords,
  });

  factory DistanceDetails.fromJson(Map<String, dynamic> json) => DistanceDetails(
    error: json["error"],
    msg: json["msg"],
    distanceValue: json["distanceValue"],
    distanceLabel: json["distanceLabel"],
    timeValue: json["timeValue"],
    timeLable: json["timeLable"],
    from: json["from"],
    to: json["to"],
    distanceLable: json["distanceLable"],
    startCords: json["startCords"] == null ? [] : List<String>.from(json["startCords"]!.map((x) => x)),
    endcoords: json["endcoords"] == null ? [] : List<String>.from(json["endcoords"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "distanceValue": distanceValue,
    "distanceLabel": distanceLabel,
    "timeValue": timeValue,
    "timeLable": timeLable,
    "from": from,
    "to": to,
    "distanceLable": distanceLable,
    "startCords": startCords == null ? [] : List<dynamic>.from(startCords!.map((x) => x)),
    "endcoords": endcoords == null ? [] : List<dynamic>.from(endcoords!.map((x) => x)),
  };
}

class VehicleDetailsAndFare {
  VehicleDetails? vehicleDetails;
  FareDetails? fareDetails;
  Offers? offers;
  ApplyValues? applyValues;

  VehicleDetailsAndFare({
    this.vehicleDetails,
    this.fareDetails,
    this.offers,
    this.applyValues,
  });

  factory VehicleDetailsAndFare.fromJson(Map<String, dynamic> json) => VehicleDetailsAndFare(
    vehicleDetails: json["vehicleDetails"] == null ? null : VehicleDetails.fromJson(json["vehicleDetails"]),
    fareDetails: json["fareDetails"] == null ? null : FareDetails.fromJson(json["fareDetails"]),
    offers: json["offers"] == null ? null : Offers.fromJson(json["offers"]),
    applyValues: json["applyValues"] == null ? null : ApplyValues.fromJson(json["applyValues"]),
  );

  Map<String, dynamic> toJson() => {
    "vehicleDetails": vehicleDetails?.toJson(),
    "fareDetails": fareDetails?.toJson(),
    "offers": offers?.toJson(),
    "applyValues": applyValues?.toJson(),
  };
}

class ApplyValues {
  bool? applyNightCharge;
  bool? applyPeakCharge;
  bool? applyWaitingTime;
  bool? applyTax;
  bool? applyCommission;
  bool? applyPickupCharge;

  ApplyValues({
    this.applyNightCharge,
    this.applyPeakCharge,
    this.applyWaitingTime,
    this.applyTax,
    this.applyCommission,
    this.applyPickupCharge,
  });

  factory ApplyValues.fromJson(Map<String, dynamic> json) => ApplyValues(
    applyNightCharge: json["applyNightCharge"],
    applyPeakCharge: json["applyPeakCharge"],
    applyWaitingTime: json["applyWaitingTime"],
    applyTax: json["applyTax"],
    applyCommission: json["applyCommission"],
    applyPickupCharge: json["applyPickupCharge"],
  );

  Map<String, dynamic> toJson() => {
    "applyNightCharge": applyNightCharge,
    "applyPeakCharge": applyPeakCharge,
    "applyWaitingTime": applyWaitingTime,
    "applyTax": applyTax,
    "applyCommission": applyCommission,
    "applyPickupCharge": applyPickupCharge,
  };
}

class FareDetails {
  String? perKmRate;
  String? fareType;
  String? distance;
  String? kmFare;
  String? baseFare;
  String? bookingFare;
  String? travelTime;
  String? travelRate;
  String? travelFare;
  String? timeRate;
  String? waitingCharge;
  String? waitingTime;
  String? waitingFare;
  String? minwaitingTime;
  String? cancelationFeesRider;
  String? cancelationFeesDriver;
  String? pickupCharge;
  String? totalwaitingTime;
  String? comison;
  String? comisonAmt;
  bool? isTax;
  String? taxPercentagecgst;
  String? taxPercentagesgst;
  String? tax;
  String? minFare;
  String? minFareAdded;
  String? flatFare;
  String? oldCancellationAmt;
  String? fareAmtBeforeSurge;
  String? totalFareWithOutOldBal;
  String? totalFare;
  String? balanceFare;
  String? detuctedFare;
  String? paymentMode;
  String? currency;
  String? additionalFee;
  String? mandatorydiscountAmt;
  String? discountAmt;
  String? promoCode;
  String? roundOff;
  String? googleCharge;
  String? pgcharge;
  String? baseKm;
  String? extraKm;
  String? basetime;
  String? extratime;
  String? inSecondaryCur;
  Obj? nightObj;
  Obj? peakObj;
  List<DistanceObj>? distanceObj;
  String? fareAmt;
  String? taxcgst;
  String? taxsgst;
  String? surgeAmt;
  String? farewithoutTaxNBookingFee;

  FareDetails({
    this.perKmRate,
    this.fareType,
    this.distance,
    this.kmFare,
    this.baseFare,
    this.bookingFare,
    this.travelTime,
    this.travelRate,
    this.travelFare,
    this.timeRate,
    this.waitingCharge,
    this.waitingTime,
    this.waitingFare,
    this.minwaitingTime,
    this.cancelationFeesRider,
    this.cancelationFeesDriver,
    this.pickupCharge,
    this.totalwaitingTime,
    this.comison,
    this.comisonAmt,
    this.isTax,
    this.taxPercentagecgst,
    this.taxPercentagesgst,
    this.tax,
    this.minFare,
    this.minFareAdded,
    this.flatFare,
    this.oldCancellationAmt,
    this.fareAmtBeforeSurge,
    this.totalFareWithOutOldBal,
    this.totalFare,
    this.balanceFare,
    this.detuctedFare,
    this.paymentMode,
    this.currency,
    this.additionalFee,
    this.mandatorydiscountAmt,
    this.discountAmt,
    this.promoCode,
    this.roundOff,
    this.googleCharge,
    this.pgcharge,
    this.baseKm,
    this.extraKm,
    this.basetime,
    this.extratime,
    this.inSecondaryCur,
    this.nightObj,
    this.peakObj,
    this.distanceObj,
    this.fareAmt,
    this.taxcgst,
    this.taxsgst,
    this.surgeAmt,
    this.farewithoutTaxNBookingFee,
  });

  factory FareDetails.fromJson(Map<String, dynamic> json) => FareDetails(
    perKmRate: json["perKMRate"],
    fareType: json["fareType"],
    distance: json["distance"],
    kmFare: json["KMFare"],
    baseFare: json["BaseFare"],
    bookingFare: json["bookingFare"],
    travelTime: json["travelTime"],
    travelRate: json["travelRate"],
    travelFare: json["travelFare"],
    timeRate: json["timeRate"],
    waitingCharge: json["waitingCharge"],
    waitingTime: json["waitingTime"],
    waitingFare: json["waitingFare"],
    minwaitingTime: json["minwaitingTime"],
    cancelationFeesRider: json["cancelationFeesRider"],
    cancelationFeesDriver: json["cancelationFeesDriver"],
    pickupCharge: json["pickupCharge"],
    totalwaitingTime: json["totalwaitingTime"],
    comison: json["comison"],
    comisonAmt: json["comisonAmt"],
    isTax: json["isTax"],
    taxPercentagecgst: json["taxPercentagecgst"],
    taxPercentagesgst: json["taxPercentagesgst"],
    tax: json["tax"],
    minFare: json["minFare"],
    minFareAdded: json["minFareAdded"],
    flatFare: json["flatFare"],
    oldCancellationAmt: json["oldCancellationAmt"],
    fareAmtBeforeSurge: json["fareAmtBeforeSurge"],
    totalFareWithOutOldBal: json["totalFareWithOutOldBal"],
    totalFare: json["totalFare"],
    balanceFare: json["BalanceFare"],
    detuctedFare: json["DetuctedFare"],
    paymentMode: json["paymentMode"],
    currency: json["currency"],
    additionalFee: json["additionalFee"],
    mandatorydiscountAmt: json["mandatorydiscountAmt"],
    discountAmt: json["discountAmt"],
    promoCode: json["promoCode"],
    roundOff: json["roundOff"],
    googleCharge: json["googleCharge"],
    pgcharge: json["pgcharge"],
    baseKm: json["baseKM"],
    extraKm: json["extraKM"],
    basetime: json["basetime"],
    extratime: json["extratime"],
    inSecondaryCur: json["inSecondaryCur"],
    nightObj: json["nightObj"] == null ? null : Obj.fromJson(json["nightObj"]),
    peakObj: json["peakObj"] == null ? null : Obj.fromJson(json["peakObj"]),
    distanceObj: json["distanceObj"] == null ? [] : List<DistanceObj>.from(json["distanceObj"]!.map((x) => DistanceObj.fromJson(x))),
    fareAmt: json["fareAmt"],
    taxcgst: json["taxcgst"],
    taxsgst: json["taxsgst"],
    surgeAmt: json["surgeAmt"],
    farewithoutTaxNBookingFee: json["farewithoutTaxNBookingFee"],
  );

  Map<String, dynamic> toJson() => {
    "perKMRate": perKmRate,
    "fareType": fareType,
    "distance": distance,
    "KMFare": kmFare,
    "BaseFare": baseFare,
    "bookingFare": bookingFare,
    "travelTime": travelTime,
    "travelRate": travelRate,
    "travelFare": travelFare,
    "timeRate": timeRate,
    "waitingCharge": waitingCharge,
    "waitingTime": waitingTime,
    "waitingFare": waitingFare,
    "minwaitingTime": minwaitingTime,
    "cancelationFeesRider": cancelationFeesRider,
    "cancelationFeesDriver": cancelationFeesDriver,
    "pickupCharge": pickupCharge,
    "totalwaitingTime": totalwaitingTime,
    "comison": comison,
    "comisonAmt": comisonAmt,
    "isTax": isTax,
    "taxPercentagecgst": taxPercentagecgst,
    "taxPercentagesgst": taxPercentagesgst,
    "tax": tax,
    "minFare": minFare,
    "minFareAdded": minFareAdded,
    "flatFare": flatFare,
    "oldCancellationAmt": oldCancellationAmt,
    "fareAmtBeforeSurge": fareAmtBeforeSurge,
    "totalFareWithOutOldBal": totalFareWithOutOldBal,
    "totalFare": totalFare,
    "BalanceFare": balanceFare,
    "DetuctedFare": detuctedFare,
    "paymentMode": paymentMode,
    "currency": currency,
    "additionalFee": additionalFee,
    "mandatorydiscountAmt": mandatorydiscountAmt,
    "discountAmt": discountAmt,
    "promoCode": promoCode,
    "roundOff": roundOff,
    "googleCharge": googleCharge,
    "pgcharge": pgcharge,
    "baseKM": baseKm,
    "extraKM": extraKm,
    "basetime": basetime,
    "extratime": extratime,
    "inSecondaryCur": inSecondaryCur,
    "nightObj": nightObj?.toJson(),
    "peakObj": peakObj?.toJson(),
    "distanceObj": distanceObj == null ? [] : List<dynamic>.from(distanceObj!.map((x) => x.toJson())),
    "fareAmt": fareAmt,
    "taxcgst": taxcgst,
    "taxsgst": taxsgst,
    "surgeAmt": surgeAmt,
    "farewithoutTaxNBookingFee": farewithoutTaxNBookingFee,
  };
}

class DistanceObj {
  String? distanceFareType;
  dynamic distanceFarePerKm;
  int? distanceFarePerFlatRate;
  bool? applyTax;
  bool? applyWaitingTime;
  bool? applyNightCharge;
  bool? applyPeakCharge;
  bool? applyCommission;
  bool? applyPickupCharge;
  int? totalmin;
  bool? cmpyAllowance;
  int? discount;
  int? offerPerDay;
  int? offerPerUser;
  int? additionalFarePerHrs;
  String? id;
  String? distanceFrom;
  String? distanceTo;

  DistanceObj({
    this.distanceFareType,
    this.distanceFarePerKm,
    this.distanceFarePerFlatRate,
    this.applyTax,
    this.applyWaitingTime,
    this.applyNightCharge,
    this.applyPeakCharge,
    this.applyCommission,
    this.applyPickupCharge,
    this.totalmin,
    this.cmpyAllowance,
    this.discount,
    this.offerPerDay,
    this.offerPerUser,
    this.additionalFarePerHrs,
    this.id,
    this.distanceFrom,
    this.distanceTo,
  });

  factory DistanceObj.fromJson(Map<String, dynamic> json) => DistanceObj(
    distanceFareType: json["distanceFareType"],
    distanceFarePerKm: json["distanceFarePerKM"],
    distanceFarePerFlatRate: json["distanceFarePerFlatRate"],
    applyTax: json["applyTax"],
    applyWaitingTime: json["applyWaitingTime"],
    applyNightCharge: json["applyNightCharge"],
    applyPeakCharge: json["applyPeakCharge"],
    applyCommission: json["applyCommission"],
    applyPickupCharge: json["applyPickupCharge"],
    totalmin: json["totalmin"],
    cmpyAllowance: json["cmpyAllowance"],
    discount: json["discount"],
    offerPerDay: json["offerPerDay"],
    offerPerUser: json["offerPerUser"],
    additionalFarePerHrs: json["additionalFarePerHrs"],
    id: json["_id"],
    distanceFrom: json["distanceFrom"],
    distanceTo: json["distanceTo"],
  );

  Map<String, dynamic> toJson() => {
    "distanceFareType": distanceFareType,
    "distanceFarePerKM": distanceFarePerKm,
    "distanceFarePerFlatRate": distanceFarePerFlatRate,
    "applyTax": applyTax,
    "applyWaitingTime": applyWaitingTime,
    "applyNightCharge": applyNightCharge,
    "applyPeakCharge": applyPeakCharge,
    "applyCommission": applyCommission,
    "applyPickupCharge": applyPickupCharge,
    "totalmin": totalmin,
    "cmpyAllowance": cmpyAllowance,
    "discount": discount,
    "offerPerDay": offerPerDay,
    "offerPerUser": offerPerUser,
    "additionalFarePerHrs": additionalFarePerHrs,
    "_id": id,
    "distanceFrom": distanceFrom,
    "distanceTo": distanceTo,
  };
}

class Obj {
  bool? isApply;
  int? percentageIncrease;
  String? alertLable;

  Obj({
    this.isApply,
    this.percentageIncrease,
    this.alertLable,
  });

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    isApply: json["isApply"],
    percentageIncrease: json["percentageIncrease"],
    alertLable: json["alertLable"],
  );

  Map<String, dynamic> toJson() => {
    "isApply": isApply,
    "percentageIncrease": percentageIncrease,
    "alertLable": alertLable,
  };
}

class Offers {
  int? offerPerUser;
  int? offerPerDay;
  int? discount;
  bool? cmpyAllowance;

  Offers({
    this.offerPerUser,
    this.offerPerDay,
    this.discount,
    this.cmpyAllowance,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
    offerPerUser: json["offerPerUser"],
    offerPerDay: json["offerPerDay"],
    discount: json["discount"],
    cmpyAllowance: json["cmpyAllowance"],
  );

  Map<String, dynamic> toJson() => {
    "offerPerUser": offerPerUser,
    "offerPerDay": offerPerDay,
    "discount": discount,
    "cmpyAllowance": cmpyAllowance,
  };
}

class VehicleDetails {
  String? type;
  int? seats;
  String? image;
  bool? available;
  String? description;
  List<String>? features;
  String? serviceId;

  VehicleDetails({
    this.type,
    this.seats,
    this.image,
    this.available,
    this.description,
    this.features,
    this.serviceId,
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) => VehicleDetails(
    type: json["type"],
    seats: json["seats"],
    image: json["image"],
    available: json["available"],
    description: json["description"],
    features: json["features"] == null ? [] : List<String>.from(json["features"]!.map((x) => x)),
    serviceId: json["serviceId"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "seats": seats,
    "image": image,
    "available": available,
    "description": description,
    "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
    "serviceId": serviceId,
  };
}
