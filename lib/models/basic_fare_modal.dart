// To parse this JSON data, do
//
//     final basicFareModal = basicFareModalFromMap(jsonString);

import 'dart:convert';

BasicFareModal basicFareModalFromMap(String str) => BasicFareModal.fromMap(json.decode(str));

String basicFareModalToMap(BasicFareModal data) => json.encode(data.toMap());

class BasicFareModal {
  final bool? success;
  final String? message;
  final List<VehicleCategory>? vehicleCategories;
  final String? pickupCity;
  final bool? showSupportNo;

  BasicFareModal({
    this.success,
    this.message,
    this.vehicleCategories,
    this.pickupCity,
    this.showSupportNo,
  });

  factory BasicFareModal.fromMap(Map<String, dynamic> json) => BasicFareModal(
    success: json["success"],
    message: json["message"],
    vehicleCategories: json["vehicleCategories"] == null ? [] : List<VehicleCategory>.from(json["vehicleCategories"]!.map((x) => VehicleCategory.fromMap(x))),
    pickupCity: json["pickupCity"],
    showSupportNo: json["showSupportNo"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "vehicleCategories": vehicleCategories == null ? [] : List<dynamic>.from(vehicleCategories!.map((x) => x.toMap())),
    "pickupCity": pickupCity,
    "showSupportNo": showSupportNo,
  };
}

class VehicleCategory {
  final String? id;
  final String? type;
  final String? tripTypeCode;
  final int? bkm;
  final String? file;
  final bool? available;
  bool? isSelected;
  final bool? isRideLater;
  final int? asppc;
  final bool? isShareAvailable;
  final String? eta;
  final String? totalEstimationFare;
  final Estimation? estimation;
  final VehicleCategoryEstimatedDropTime? estimatedDropTime;

  VehicleCategory({
    this.id,
    this.type,
    this.tripTypeCode,
    this.bkm,
    this.file,
    this.available,
    this.isRideLater,
    this.asppc,
    this.isShareAvailable,
    this.eta,
    this.totalEstimationFare,
    this.estimation,
    this.estimatedDropTime,
    this.isSelected,
  });

  factory VehicleCategory.fromMap(Map<String, dynamic> json) => VehicleCategory(
    id: json["_id"],
    type: json["type"],
    tripTypeCode: json["tripTypeCode"],
    bkm: json["bkm"],
    file: json["file"],
    available: json["available"],
    isRideLater: json["isRideLater"],
    asppc: json["asppc"],
    isShareAvailable: json["isShareAvailable"],
    eta: json["eta"],
    totalEstimationFare: json["totalEstimationFare"],
    estimation: json["estimation"] == null ? null : Estimation.fromMap(json["estimation"]),
    estimatedDropTime: json["estimatedDropTime"] == null ? null : VehicleCategoryEstimatedDropTime.fromMap(json["estimatedDropTime"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "type": type,
    "tripTypeCode": tripTypeCode,
    "bkm": bkm,
    "file": file,
    "available": available,
    "isRideLater": isRideLater,
    "asppc": asppc,
    "isShareAvailable": isShareAvailable,
    "eta": eta,
    "totalEstimationFare": totalEstimationFare,
    "estimation": estimation?.toMap(),
    "estimatedDropTime": estimatedDropTime?.toMap(),
  };
}

class VehicleCategoryEstimatedDropTime {
  final String? dropTime;

  VehicleCategoryEstimatedDropTime({
    this.dropTime,
  });

  factory VehicleCategoryEstimatedDropTime.fromMap(Map<String, dynamic> json) => VehicleCategoryEstimatedDropTime(
    dropTime: json["dropTime"],
  );

  Map<String, dynamic> toMap() => {
    "dropTime": dropTime,
  };
}

class Estimation {
  final bool? success;
  final String? message;
  final EstimationVehicleDetails? vehicleDetails;
  final DistanceDetails? distanceDetails;
  final EstimationEstimatedDropTime? estimatedDropTime;
  final String? totalAmt;

  Estimation({
    this.success,
    this.message,
    this.vehicleDetails,
    this.distanceDetails,
    this.estimatedDropTime,
    this.totalAmt,
  });

  factory Estimation.fromMap(Map<String, dynamic> json) => Estimation(
    success: json["success"],
    message: json["message"],
    vehicleDetails: json["vehicleDetails"] == null ? null : EstimationVehicleDetails.fromMap(json["vehicleDetails"]),
    distanceDetails: json["distanceDetails"] == null ? null : DistanceDetails.fromMap(json["distanceDetails"]),
    estimatedDropTime: json["estimatedDropTime"] == null ? null : EstimationEstimatedDropTime.fromMap(json["estimatedDropTime"]),
    totalAmt: json["totalAmt"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "vehicleDetails": vehicleDetails?.toMap(),
    "distanceDetails": distanceDetails?.toMap(),
    "estimatedDropTime": estimatedDropTime?.toMap(),
    "totalAmt": totalAmt,
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
  final List<double>? startCords;
  final List<double>? endcoords;

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
    startCords: json["startCords"] == null ? [] : List<double>.from(json["startCords"]!.map((x) => x?.toDouble())),
    endcoords: json["endcoords"] == null ? [] : List<double>.from(json["endcoords"]!.map((x) => x?.toDouble())),
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

class EstimationEstimatedDropTime {
  final String? dropTime;
  final String? dropTimeInMinutes;

  EstimationEstimatedDropTime({
    this.dropTime,
    this.dropTimeInMinutes,
  });

  factory EstimationEstimatedDropTime.fromMap(Map<String, dynamic> json) => EstimationEstimatedDropTime(
    dropTime: json["dropTime"],
    dropTimeInMinutes: json["dropTimeInMinutes"],
  );

  Map<String, dynamic> toMap() => {
    "dropTime": dropTime,
    "dropTimeInMinutes": dropTimeInMinutes,
  };
}

class EstimationVehicleDetails {
  final VehicleDetailsVehicleDetails? vehicleDetails;
  final FareDetails? fareDetails;
  final Offers? offers;
  final ApplyValues? applyValues;

  EstimationVehicleDetails({
    this.vehicleDetails,
    this.fareDetails,
    this.offers,
    this.applyValues,
  });

  factory EstimationVehicleDetails.fromMap(Map<String, dynamic> json) => EstimationVehicleDetails(
    vehicleDetails: json["vehicleDetails"] == null ? null : VehicleDetailsVehicleDetails.fromMap(json["vehicleDetails"]),
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
  final int? perKmRate;
  final String? fareType;
  final String? distance;
  final dynamic kmFare;
  final int? baseFare;
  final int? bookingFare;
  final String? travelTime;
  final int? travelRate;
  final double? travelFare;
  final int? timeRate;
  final int? waitingCharge;
  final int? waitingTime;
  final int? waitingFare;
  final int? minwaitingTime;
  final int? cancelationFeesRider;
  final int? cancelationFeesDriver;
  final int? pickupCharge;
  final int? totalwaitingTime;
  final int? comison;
  final double? comisonAmt;
  final bool? isTax;
  final int? taxPercentagecgst;
  final int? taxPercentagesgst;
  final String? tax;
  final int? minFare;
  final int? minFareAdded;
  final int? flatFare;
  final int? oldCancellationAmt;
  final double? fareAmtBeforeSurge;
  final int? totalFareWithOutOldBal;
  final String? totalFare;
  final String? balanceFare;
  final int? detuctedFare;
  final String? paymentMode;
  final String? currency;
  final int? additionalFee;
  final int? mandatorydiscountAmt;
  final int? discountAmt;
  final String? promoCode;
  final int? roundOff;
  final int? googleCharge;
  final int? pgcharge;
  final int? baseKm;
  final dynamic extraKm;
  final int? basetime;
  final dynamic extratime;
  final double? inSecondaryCur;
  final Obj? nightObj;
  final Obj? peakObj;
  final List<DistanceObj>? distanceObj;
  final double? fareAmt;
  final double? taxcgst;
  final double? taxsgst;
  final String? surgeAmt;
  final double? farewithoutTaxNBookingFee;

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
    travelFare: json["travelFare"]?.toDouble(),
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
    comisonAmt: json["comisonAmt"]?.toDouble(),
    isTax: json["isTax"],
    taxPercentagecgst: json["taxPercentagecgst"],
    taxPercentagesgst: json["taxPercentagesgst"],
    tax: json["tax"],
    minFare: json["minFare"],
    minFareAdded: json["minFareAdded"],
    flatFare: json["flatFare"],
    oldCancellationAmt: json["oldCancellationAmt"],
    fareAmtBeforeSurge: json["fareAmtBeforeSurge"]?.toDouble(),
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
    inSecondaryCur: json["inSecondaryCur"]?.toDouble(),
    nightObj: json["nightObj"] == null ? null : Obj.fromMap(json["nightObj"]),
    peakObj: json["peakObj"] == null ? null : Obj.fromMap(json["peakObj"]),
    distanceObj: json["distanceObj"] == null ? [] : List<DistanceObj>.from(json["distanceObj"]!.map((x) => DistanceObj.fromMap(x))),
    fareAmt: json["fareAmt"]?.toDouble(),
    taxcgst: json["taxcgst"]?.toDouble(),
    taxsgst: json["taxsgst"]?.toDouble(),
    surgeAmt: json["surgeAmt"],
    farewithoutTaxNBookingFee: json["farewithoutTaxNBookingFee"]?.toDouble(),
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

class VehicleDetailsVehicleDetails {
  final String? type;
  final int? seats;
  final String? image;
  final bool? available;
  final String? description;
  final List<String>? features;
  final String? serviceId;

  VehicleDetailsVehicleDetails({
    this.type,
    this.seats,
    this.image,
    this.available,
    this.description,
    this.features,
    this.serviceId,
  });

  factory VehicleDetailsVehicleDetails.fromMap(Map<String, dynamic> json) => VehicleDetailsVehicleDetails(
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
