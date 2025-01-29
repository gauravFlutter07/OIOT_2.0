// To parse this JSON data, do
//
//     final outstationTaxiModal = outstationTaxiModalFromMap(jsonString);

import 'dart:convert';

OutstationTaxiModal outstationTaxiModalFromMap(String str) => OutstationTaxiModal.fromMap(json.decode(str));

String outstationTaxiModalToMap(OutstationTaxiModal data) => json.encode(data.toMap());

class OutstationTaxiModal {
  final bool? success;
  final String? message;
  final List<VehicleList>? vehicleList;
  final int? returnHours;
  final DepatureValues? depatureValues;

  OutstationTaxiModal({
    this.success,
    this.message,
    this.vehicleList,
    this.returnHours,
    this.depatureValues,
  });

  factory OutstationTaxiModal.fromMap(Map<String, dynamic> json) => OutstationTaxiModal(
    success: json["success"],
    message: json["message"],
    vehicleList: json["vehicleList"] == null ? [] : List<VehicleList>.from(json["vehicleList"]!.map((x) => VehicleList.fromMap(x))),
    returnHours: json["returnHours"],
    depatureValues: json["depatureValues"] == null ? null : DepatureValues.fromMap(json["depatureValues"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "vehicleList": vehicleList == null ? [] : List<dynamic>.from(vehicleList!.map((x) => x.toMap())),
    "returnHours": returnHours,
    "depatureValues": depatureValues?.toMap(),
  };
}

class DepatureValues {
  final List<ReturnDay>? returnDays;
  final List<String>? hoursInCurrentDay;
  final List<String>? hoursInADay;

  DepatureValues({
    this.returnDays,
    this.hoursInCurrentDay,
    this.hoursInADay,
  });

  factory DepatureValues.fromMap(Map<String, dynamic> json) => DepatureValues(
    returnDays: json["returnDays"] == null ? [] : List<ReturnDay>.from(json["returnDays"]!.map((x) => ReturnDay.fromMap(x))),
    hoursInCurrentDay: json["hoursInCurrentDay"] == null ? [] : List<String>.from(json["hoursInCurrentDay"]!.map((x) => x)),
    hoursInADay: json["hoursInADay"] == null ? [] : List<String>.from(json["hoursInADay"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "returnDays": returnDays == null ? [] : List<dynamic>.from(returnDays!.map((x) => x.toMap())),
    "hoursInCurrentDay": hoursInCurrentDay == null ? [] : List<dynamic>.from(hoursInCurrentDay!.map((x) => x)),
    "hoursInADay": hoursInADay == null ? [] : List<dynamic>.from(hoursInADay!.map((x) => x)),
  };
}

class ReturnDay {
  final String? lable;
  final dynamic value;

  ReturnDay({
    this.lable,
    this.value,
  });

  factory ReturnDay.fromMap(Map<String, dynamic> json) => ReturnDay(
    lable: json["lable"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "lable": lable,
    "value": value,
  };
}

class VehicleList {
  final String? id;
  final String? packageId;
  final String? packageName;
  final String? type;
  final String? vehicle;
  final String? tripTypeCode;
  final FareDetails? fareDetails;
  final String? file;
  final String? description;
  final String? asppc;
  final String? timeFare;
  final String? bkm;
  final String? distanceLable;
  final String? pickupLocation;
  final String? dropLocation;
  final String? comison;
  final String? comisonAmt;
  final String? conveyancePerKm;
  final String? cancelationFeesDriver;
  final String? cancelationFeesRider;
  final String? distanceKmUpAndDown;
  final String? durationInHourUpAndDown;
  final String? distanceKm;
  final String? durationInHour;
  final String? scity;
  final String? tax;
  final int? googleCharge;
  final int? pgcharge;
  final int? pickupCharge;

  VehicleList({
    this.id,
    this.packageId,
    this.packageName,
    this.type,
    this.vehicle,
    this.tripTypeCode,
    this.fareDetails,
    this.file,
    this.description,
    this.asppc,
    this.timeFare,
    this.bkm,
    this.distanceLable,
    this.pickupLocation,
    this.dropLocation,
    this.comison,
    this.comisonAmt,
    this.conveyancePerKm,
    this.cancelationFeesDriver,
    this.cancelationFeesRider,
    this.distanceKmUpAndDown,
    this.durationInHourUpAndDown,
    this.distanceKm,
    this.durationInHour,
    this.scity,
    this.tax,
    this.googleCharge,
    this.pgcharge,
    this.pickupCharge,
  });

  factory VehicleList.fromMap(Map<String, dynamic> json) => VehicleList(
    id: json["_id"],
    packageId: json["packageId"],
    packageName: json["packageName"],
    type: json["type"],
    vehicle: json["vehicle"],
    tripTypeCode: json["tripTypeCode"],
    fareDetails: json["fareDetails"] == null ? null : FareDetails.fromMap(json["fareDetails"]),
    file: json["file"],
    description: json["description"],
    asppc: json["asppc"],
    timeFare: json["timeFare"],
    bkm: json["bkm"],
    distanceLable: json["distanceLable"],
    pickupLocation: json["pickupLocation"],
    dropLocation: json["dropLocation"],
    comison: json["comison"],
    comisonAmt: json["comisonAmt"],
    conveyancePerKm: json["conveyancePerKm"],
    cancelationFeesDriver: json["cancelationFeesDriver"],
    cancelationFeesRider: json["cancelationFeesRider"],
    distanceKmUpAndDown: json["distanceKMUpAndDown"],
    durationInHourUpAndDown: json["durationInHourUpAndDown"],
    distanceKm: json["distanceKM"],
    durationInHour: json["durationInHour"],
    scity: json["scity"],
    tax: json["tax"],
    googleCharge: json["googleCharge"],
    pgcharge: json["pgcharge"],
    pickupCharge: json["pickupCharge"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "packageId": packageId,
    "packageName": packageName,
    "type": type,
    "vehicle": vehicle,
    "tripTypeCode": tripTypeCode,
    "fareDetails": fareDetails?.toMap(),
    "file": file,
    "description": description,
    "asppc": asppc,
    "timeFare": timeFare,
    "bkm": bkm,
    "distanceLable": distanceLable,
    "pickupLocation": pickupLocation,
    "dropLocation": dropLocation,
    "comison": comison,
    "comisonAmt": comisonAmt,
    "conveyancePerKm": conveyancePerKm,
    "cancelationFeesDriver": cancelationFeesDriver,
    "cancelationFeesRider": cancelationFeesRider,
    "distanceKMUpAndDown": distanceKmUpAndDown,
    "durationInHourUpAndDown": durationInHourUpAndDown,
    "distanceKM": distanceKm,
    "durationInHour": durationInHour,
    "scity": scity,
    "tax": tax,
    "googleCharge": googleCharge,
    "pgcharge": pgcharge,
    "pickupCharge": pickupCharge,
  };
}

class FareDetails {
  final String? baseFareLabel;
  final String? extraTimeFare;
  final String? fareDetailsBaseFare;
  final int? bookingFee;
  final String? remainingKm;
  final dynamic remainingFare;
  final String? remainingFareLabel;
  final String? remainingTimeFareLabel;
  final String? totalFare;
  final String? description;
  final String? baseFare;
  final String? bookingFare;
  final String? minFare;
  final int? minFareAdded;
  final String? distance;
  final String? kmFare;
  final String? perKmRate;
  final String? perKmRateRound;
  final String? travelTime;
  final String? travelFare;
  final int? pickupCharge;
  final String? waitingFare;
  final String? waitingTime;
  final String? totalFareWithOutOldBal;
  final String? fareAmtBeforeSurge;
  final String? oldCancellationAmt;
  final String? detuctedFare;
  final String? hotelcommisionAmt;
  final String? discountAmt;
  final String? fareBeforeTax;
  final String? paymentMode;
  final String? tranxid;
  final Obj? nightObj;
  final Obj? peakObj;
  final String? discountName;
  final String? discountPercentage;
  final String? additionalFee;
  final String? packageDistance;
  final String? packageDuration;
  final String? seat;
  final String? comison;
  final String? comisonAmt;
  final String? extraHours;
  final String? additionalTimeFareNew;
  final String? additionalDurationFare;
  final String? additionalDuration;
  final String? additionalTimeRate;
  final String? additionalDistance;
  final String? additionalDistanceFare;
  final String? packageId;
  final String? packageName;
  final int? taxcgst;
  final int? taxsgst;
  final String? taxPercentage;
  final int? taxPercentagesgst;
  final int? taxPercentagecgst;
  final String? tax;
  final int? taxTds;
  final bool? taxTdsPercentage;
  final int? noOfNights;
  final String? nightFare;
  final dynamic noOfDays;
  final String? dayFare;
  final int? nightRate;
  final int? dayRate;
  final int? roundOff;
  final int? googleCharge;
  final int? pgcharge;
  final int? travelRate;
  final int? cancelationFeesRider;
  final int? cancelationFeesDriver;

  FareDetails({
    this.baseFareLabel,
    this.extraTimeFare,
    this.fareDetailsBaseFare,
    this.bookingFee,
    this.remainingKm,
    this.remainingFare,
    this.remainingFareLabel,
    this.remainingTimeFareLabel,
    this.totalFare,
    this.description,
    this.baseFare,
    this.bookingFare,
    this.minFare,
    this.minFareAdded,
    this.distance,
    this.kmFare,
    this.perKmRate,
    this.perKmRateRound,
    this.travelTime,
    this.travelFare,
    this.pickupCharge,
    this.waitingFare,
    this.waitingTime,
    this.totalFareWithOutOldBal,
    this.fareAmtBeforeSurge,
    this.oldCancellationAmt,
    this.detuctedFare,
    this.hotelcommisionAmt,
    this.discountAmt,
    this.fareBeforeTax,
    this.paymentMode,
    this.tranxid,
    this.nightObj,
    this.peakObj,
    this.discountName,
    this.discountPercentage,
    this.additionalFee,
    this.packageDistance,
    this.packageDuration,
    this.seat,
    this.comison,
    this.comisonAmt,
    this.extraHours,
    this.additionalTimeFareNew,
    this.additionalDurationFare,
    this.additionalDuration,
    this.additionalTimeRate,
    this.additionalDistance,
    this.additionalDistanceFare,
    this.packageId,
    this.packageName,
    this.taxcgst,
    this.taxsgst,
    this.taxPercentage,
    this.taxPercentagesgst,
    this.taxPercentagecgst,
    this.tax,
    this.taxTds,
    this.taxTdsPercentage,
    this.noOfNights,
    this.nightFare,
    this.noOfDays,
    this.dayFare,
    this.nightRate,
    this.dayRate,
    this.roundOff,
    this.googleCharge,
    this.pgcharge,
    this.travelRate,
    this.cancelationFeesRider,
    this.cancelationFeesDriver,
  });

  factory FareDetails.fromMap(Map<String, dynamic> json) => FareDetails(
    baseFareLabel: json["baseFareLabel"],
    extraTimeFare: json["extraTimeFare"],
    fareDetailsBaseFare: json["baseFare"],
    bookingFee: json["bookingFee"],
    remainingKm: json["remainingKM"],
    remainingFare: json["remainingFare"],
    remainingFareLabel: json["remainingFareLabel"],
    remainingTimeFareLabel: json["remainingTimeFareLabel"],
    totalFare: json["totalFare"],
    description: json["description"],
    baseFare: json["BaseFare"],
    bookingFare: json["bookingFare"],
    minFare: json["minFare"],
    minFareAdded: json["minFareAdded"],
    distance: json["distance"],
    kmFare: json["KMFare"],
    perKmRate: json["perKmRate"],
    perKmRateRound: json["perKmRateRound"],
    travelTime: json["travelTime"],
    travelFare: json["travelFare"],
    pickupCharge: json["pickupCharge"],
    waitingFare: json["waitingFare"],
    waitingTime: json["waitingTime"],
    totalFareWithOutOldBal: json["totalFareWithOutOldBal"],
    fareAmtBeforeSurge: json["fareAmtBeforeSurge"],
    oldCancellationAmt: json["oldCancellationAmt"],
    detuctedFare: json["DetuctedFare"],
    hotelcommisionAmt: json["hotelcommisionAmt"],
    discountAmt: json["discountAmt"],
    fareBeforeTax: json["fareBeforeTax"],
    paymentMode: json["paymentMode"],
    tranxid: json["tranxid"],
    nightObj: json["nightObj"] == null ? null : Obj.fromMap(json["nightObj"]),
    peakObj: json["peakObj"] == null ? null : Obj.fromMap(json["peakObj"]),
    discountName: json["discountName"],
    discountPercentage: json["discountPercentage"],
    additionalFee: json["additionalFee"],
    packageDistance: json["packageDistance"],
    packageDuration: json["packageDuration"],
    seat: json["seat"],
    comison: json["comison"],
    comisonAmt: json["comisonAmt"],
    extraHours: json["extraHours"],
    additionalTimeFareNew: json["additionalTimeFareNew"],
    additionalDurationFare: json["additionalDurationFare"],
    additionalDuration: json["additionalDuration"],
    additionalTimeRate: json["additionalTimeRate"],
    additionalDistance: json["additionalDistance"],
    additionalDistanceFare: json["additionalDistanceFare"],
    packageId: json["packageId"],
    packageName: json["packageName"],
    taxcgst: json["taxcgst"],
    taxsgst: json["taxsgst"],
    taxPercentage: json["taxPercentage"],
    taxPercentagesgst: json["taxPercentagesgst"],
    taxPercentagecgst: json["taxPercentagecgst"],
    tax: json["tax"],
    taxTds: json["taxTDS"],
    taxTdsPercentage: json["taxTDSPercentage"],
    noOfNights: json["noOfNights"],
    nightFare: json["nightFare"],
    noOfDays: json["noOfDays"],
    dayFare: json["dayFare"],
    nightRate: json["nightRate"],
    dayRate: json["dayRate"],
    roundOff: json["roundOff"],
    googleCharge: json["googleCharge"],
    pgcharge: json["pgcharge"],
    travelRate: json["travelRate"],
    cancelationFeesRider: json["cancelationFeesRider"],
    cancelationFeesDriver: json["cancelationFeesDriver"],
  );

  Map<String, dynamic> toMap() => {
    "baseFareLabel": baseFareLabel,
    "extraTimeFare": extraTimeFare,
    "baseFare": fareDetailsBaseFare,
    "bookingFee": bookingFee,
    "remainingKM": remainingKm,
    "remainingFare": remainingFare,
    "remainingFareLabel": remainingFareLabel,
    "remainingTimeFareLabel": remainingTimeFareLabel,
    "totalFare": totalFare,
    "description": description,
    "BaseFare": baseFare,
    "bookingFare": bookingFare,
    "minFare": minFare,
    "minFareAdded": minFareAdded,
    "distance": distance,
    "KMFare": kmFare,
    "perKmRate": perKmRate,
    "perKmRateRound": perKmRateRound,
    "travelTime": travelTime,
    "travelFare": travelFare,
    "pickupCharge": pickupCharge,
    "waitingFare": waitingFare,
    "waitingTime": waitingTime,
    "totalFareWithOutOldBal": totalFareWithOutOldBal,
    "fareAmtBeforeSurge": fareAmtBeforeSurge,
    "oldCancellationAmt": oldCancellationAmt,
    "DetuctedFare": detuctedFare,
    "hotelcommisionAmt": hotelcommisionAmt,
    "discountAmt": discountAmt,
    "fareBeforeTax": fareBeforeTax,
    "paymentMode": paymentMode,
    "tranxid": tranxid,
    "nightObj": nightObj?.toMap(),
    "peakObj": peakObj?.toMap(),
    "discountName": discountName,
    "discountPercentage": discountPercentage,
    "additionalFee": additionalFee,
    "packageDistance": packageDistance,
    "packageDuration": packageDuration,
    "seat": seat,
    "comison": comison,
    "comisonAmt": comisonAmt,
    "extraHours": extraHours,
    "additionalTimeFareNew": additionalTimeFareNew,
    "additionalDurationFare": additionalDurationFare,
    "additionalDuration": additionalDuration,
    "additionalTimeRate": additionalTimeRate,
    "additionalDistance": additionalDistance,
    "additionalDistanceFare": additionalDistanceFare,
    "packageId": packageId,
    "packageName": packageName,
    "taxcgst": taxcgst,
    "taxsgst": taxsgst,
    "taxPercentage": taxPercentage,
    "taxPercentagesgst": taxPercentagesgst,
    "taxPercentagecgst": taxPercentagecgst,
    "tax": tax,
    "taxTDS": taxTds,
    "taxTDSPercentage": taxTdsPercentage,
    "noOfNights": noOfNights,
    "nightFare": nightFare,
    "noOfDays": noOfDays,
    "dayFare": dayFare,
    "nightRate": nightRate,
    "dayRate": dayRate,
    "roundOff": roundOff,
    "googleCharge": googleCharge,
    "pgcharge": pgcharge,
    "travelRate": travelRate,
    "cancelationFeesRider": cancelationFeesRider,
    "cancelationFeesDriver": cancelationFeesDriver,
  };
}

class Obj {
  final bool? isApply;
  final int? percentageIncrease;

  Obj({
    this.isApply,
    this.percentageIncrease,
  });

  factory Obj.fromMap(Map<String, dynamic> json) => Obj(
    isApply: json["isApply"],
    percentageIncrease: json["percentageIncrease"],
  );

  Map<String, dynamic> toMap() => {
    "isApply": isApply,
    "percentageIncrease": percentageIncrease,
  };
}
