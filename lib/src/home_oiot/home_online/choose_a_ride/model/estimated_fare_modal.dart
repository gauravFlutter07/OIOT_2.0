// To parse this JSON data, do
//
//     final estimatedFareModal = estimatedFareModalFromMap(jsonString);

import 'dart:convert';

EstimatedFareModal estimatedFareModalFromMap(String str) => EstimatedFareModal.fromMap(json.decode(str));

String estimatedFareModalToMap(EstimatedFareModal data) => json.encode(data.toMap());

class EstimatedFareModal {
  final bool? success;
  final String? message;
  final DistanceDetails? distanceDetails;
  final VehicleDetailsAndFare? vehicleDetailsAndFare;
  final String? estimationId;

  EstimatedFareModal({
    this.success,
    this.message,
    this.distanceDetails,
    this.vehicleDetailsAndFare,
    this.estimationId,
  });

  factory EstimatedFareModal.fromMap(Map<String, dynamic> json) => EstimatedFareModal(
    success: json["success"],
    message: json["message"],
    distanceDetails: json["distanceDetails"] == null ? null : DistanceDetails.fromMap(json["distanceDetails"]),
    vehicleDetailsAndFare: json["vehicleDetailsAndFare"] == null ? null : VehicleDetailsAndFare.fromMap(json["vehicleDetailsAndFare"]),
    estimationId: json["estimationId"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "distanceDetails": distanceDetails?.toMap(),
    "vehicleDetailsAndFare": vehicleDetailsAndFare?.toMap(),
    "estimationId": estimationId,
  };
}

class DistanceDetails {
  final bool? error;
  final String? msg;
  final int? distanceValue;
  final String? distanceLabel;
  final int? timeValue;
  final String? timeLabel;
  final String? from;
  final String? to;
  final String? distanceLable;
  final List<String>? startCords;
  final List<String>? endcoords;

  DistanceDetails({
    this.error,
    this.msg,
    this.distanceValue,
    this.distanceLabel,
    this.timeValue,
    this.timeLabel,
    this.from,
    this.to,
    this.distanceLable,
    this.startCords,
    this.endcoords,
  });

  factory DistanceDetails.fromMap(Map<String, dynamic> json) => DistanceDetails(
    error: json["error"],
    msg: json["msg"],
    distanceValue: json["distanceValue"],
    distanceLabel: json["distanceLabel"],
    timeValue: json["timeValue"],
    timeLabel: json["timeLabel"],
    from: json["from"],
    to: json["to"],
    distanceLable: json["distanceLable"],
    startCords: json["startCords"] == null ? [] : List<String>.from(json["startCords"]!.map((x) => x)),
    endcoords: json["endcoords"] == null ? [] : List<String>.from(json["endcoords"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "error": error,
    "msg": msg,
    "distanceValue": distanceValue,
    "distanceLabel": distanceLabel,
    "timeValue": timeValue,
    "timeLabel": timeLabel,
    "from": from,
    "to": to,
    "distanceLable": distanceLable,
    "startCords": startCords == null ? [] : List<dynamic>.from(startCords!.map((x) => x)),
    "endcoords": endcoords == null ? [] : List<dynamic>.from(endcoords!.map((x) => x)),
  };
}

class VehicleDetailsAndFare {
  final VehicleDetails? vehicleDetails;
  final FareDetails? fareDetails;
  final Offers? offers;
  final ApplyValues? applyValues;

  VehicleDetailsAndFare({
    this.vehicleDetails,
    this.fareDetails,
    this.offers,
    this.applyValues,
  });

  factory VehicleDetailsAndFare.fromMap(Map<String, dynamic> json) => VehicleDetailsAndFare(
    vehicleDetails: json["vehicleDetails"] == null ? null : VehicleDetails.fromMap(json["vehicleDetails"]),
    fareDetails: json["fareDetails"] == null ? null : FareDetails.fromMap(json["fareDetails"]),
    offers: json["offers"] == null ? null : Offers.fromMap(json["offers"]),
    applyValues: json["applyValues"] == null ? null : ApplyValues.fromMap(json["applyValues"]),
  );

  Map<String, dynamic> toMap() => {
    "vehicleDetails": vehicleDetails?.toMap(),
    "fareDetails": fareDetails?.toMap(),
    "offers": offers?.toMap(),
    "applyValues": applyValues?.toMap(),
  };
}

class ApplyValues {
  final bool? applyNightCharge;
  final bool? applyPeakCharge;
  final bool? applyWaitingTime;
  final bool? applyTax;
  final bool? applyCommission;
  final bool? applyPickupCharge;

  ApplyValues({
    this.applyNightCharge,
    this.applyPeakCharge,
    this.applyWaitingTime,
    this.applyTax,
    this.applyCommission,
    this.applyPickupCharge,
  });

  factory ApplyValues.fromMap(Map<String, dynamic> json) => ApplyValues(
    applyNightCharge: json["applyNightCharge"],
    applyPeakCharge: json["applyPeakCharge"],
    applyWaitingTime: json["applyWaitingTime"],
    applyTax: json["applyTax"],
    applyCommission: json["applyCommission"],
    applyPickupCharge: json["applyPickupCharge"],
  );

  Map<String, dynamic> toMap() => {
    "applyNightCharge": applyNightCharge,
    "applyPeakCharge": applyPeakCharge,
    "applyWaitingTime": applyWaitingTime,
    "applyTax": applyTax,
    "applyCommission": applyCommission,
    "applyPickupCharge": applyPickupCharge,
  };
}

class FareDetails {
  final String? perKmRate;
  final String? fareType;
  final String? distance;
  final String? kmFare;
  final String? baseFare;
  final String? bookingFare;
  final String? travelTime;
  final String? travelRate;
  final String? travelFare;
  final String? timeRate;
  final String? waitingCharge;
  final String? waitingTime;
  final String? waitingFare;
  final String? minwaitingTime;
  final String? cancelationFeesRider;
  final String? cancelationFeesDriver;
  final String? pickupCharge;
  final String? totalwaitingTime;
  final String? comison;
  final String? comisonAmt;
  final bool? isTax;
  final String? taxPercentagecgst;
  final String? taxPercentagesgst;
  final String? tax;
  final String? minFare;
  final String? minFareAdded;
  final String? flatFare;
  final String? oldCancellationAmt;
  final String? fareAmtBeforeSurge;
  final String? totalFareWithOutOldBal;
  final String? totalFare;
  final String? balanceFare;
  final String? detuctedFare;
  final String? paymentMode;
  final String? currency;
  final String? additionalFee;
  final String? mandatorydiscountAmt;
  final String? discountAmt;
  final String? promoCode;
  final String? roundOff;
  final String? googleCharge;
  final String? pgcharge;
  final String? baseKm;
  final String? extraKm;
  final String? basetime;
  final String? extratime;
  final String? inSecondaryCur;
  final Obj? nightObj;
  final Obj? peakObj;
  final List<DistanceObj>? distanceObj;
  final String? fareAmt;
  final String? taxcgst;
  final String? taxsgst;
  final String? surgeAmt;
  final String? farewithoutTaxNBookingFee;

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

  factory FareDetails.fromMap(Map<String, dynamic> json) => FareDetails(
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
    nightObj: json["nightObj"] == null ? null : Obj.fromMap(json["nightObj"]),
    peakObj: json["peakObj"] == null ? null : Obj.fromMap(json["peakObj"]),
    distanceObj: json["distanceObj"] == null ? [] : List<DistanceObj>.from(json["distanceObj"]!.map((x) => DistanceObj.fromMap(x))),
    fareAmt: json["fareAmt"],
    taxcgst: json["taxcgst"],
    taxsgst: json["taxsgst"],
    surgeAmt: json["surgeAmt"],
    farewithoutTaxNBookingFee: json["farewithoutTaxNBookingFee"],
  );

  Map<String, dynamic> toMap() => {
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
    "nightObj": nightObj?.toMap(),
    "peakObj": peakObj?.toMap(),
    "distanceObj": distanceObj == null ? [] : List<dynamic>.from(distanceObj!.map((x) => x.toMap())),
    "fareAmt": fareAmt,
    "taxcgst": taxcgst,
    "taxsgst": taxsgst,
    "surgeAmt": surgeAmt,
    "farewithoutTaxNBookingFee": farewithoutTaxNBookingFee,
  };
}

class DistanceObj {
  final String? distanceFareType;
  final dynamic distanceFarePerKm;
  final int? distanceFarePerFlatRate;
  final bool? applyTax;
  final bool? applyWaitingTime;
  final bool? applyNightCharge;
  final bool? applyPeakCharge;
  final bool? applyCommission;
  final bool? applyPickupCharge;
  final int? totalmin;
  final bool? cmpyAllowance;
  final int? discount;
  final int? offerPerDay;
  final int? offerPerUser;
  final int? additionalFarePerHrs;
  final String? id;
  final String? distanceFrom;
  final String? distanceTo;

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

  factory DistanceObj.fromMap(Map<String, dynamic> json) => DistanceObj(
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

  Map<String, dynamic> toMap() => {
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
  final bool? isApply;
  final int? percentageIncrease;
  final String? alertLable;

  Obj({
    this.isApply,
    this.percentageIncrease,
    this.alertLable,
  });

  factory Obj.fromMap(Map<String, dynamic> json) => Obj(
    isApply: json["isApply"],
    percentageIncrease: json["percentageIncrease"],
    alertLable: json["alertLable"],
  );

  Map<String, dynamic> toMap() => {
    "isApply": isApply,
    "percentageIncrease": percentageIncrease,
    "alertLable": alertLable,
  };
}

class Offers {
  final int? offerPerUser;
  final int? offerPerDay;
  final int? discount;
  final bool? cmpyAllowance;

  Offers({
    this.offerPerUser,
    this.offerPerDay,
    this.discount,
    this.cmpyAllowance,
  });

  factory Offers.fromMap(Map<String, dynamic> json) => Offers(
    offerPerUser: json["offerPerUser"],
    offerPerDay: json["offerPerDay"],
    discount: json["discount"],
    cmpyAllowance: json["cmpyAllowance"],
  );

  Map<String, dynamic> toMap() => {
    "offerPerUser": offerPerUser,
    "offerPerDay": offerPerDay,
    "discount": discount,
    "cmpyAllowance": cmpyAllowance,
  };
}

class VehicleDetails {
  final String? type;
  final int? seats;
  final String? image;
  final bool? available;
  final String? description;
  final List<String>? features;
  final String? serviceId;

  VehicleDetails({
    this.type,
    this.seats,
    this.image,
    this.available,
    this.description,
    this.features,
    this.serviceId,
  });

  factory VehicleDetails.fromMap(Map<String, dynamic> json) => VehicleDetails(
    type: json["type"],
    seats: json["seats"],
    image: json["image"],
    available: json["available"],
    description: json["description"],
    features: json["features"] == null ? [] : List<String>.from(json["features"]!.map((x) => x)),
    serviceId: json["serviceId"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "seats": seats,
    "image": image,
    "available": available,
    "description": description,
    "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
    "serviceId": serviceId,
  };
}
