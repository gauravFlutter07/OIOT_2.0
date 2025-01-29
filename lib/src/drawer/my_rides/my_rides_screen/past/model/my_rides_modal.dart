// To parse this JSON data, do
//
//     final myRIdesModal = myRIdesModalFromMap(jsonString);

import 'dart:convert';

List<MyRIdesModal> myRIdesModalFromMap(String str) => List<MyRIdesModal>.from(json.decode(str).map((x) => MyRIdesModal.fromMap(x)));

String myRIdesModalToMap(List<MyRIdesModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class MyRIdesModal {
  final Other? other;
  final Csp? csp;
  final Dsp? dsp;
  final Acsp? acsp;
  final ApplyValues? applyValues;
  final Tripinvoicedriverdetails? tripinvoicedriverdetails;
  final Scheduletripprocess? scheduletripprocess;
  final String? id;
  final String? tenantId;
  final String? requestFrom;
  final String? requestId;
  final String? triptype;
  final String? bookingType;
  final String? bookingFor;
  final String? notes;
  final dynamic hotelid;
  final dynamic cpy;
  final String? cpyid;
  final String? drivercmpnyname;
  final dynamic ridcpyid;
  final String? ridercmpnyname;
  final String? dvr;
  final String? dvrid;
  final String? ridrating;
  final String? ridid;
  final String? fare;
  final String? vehicle;
  final String? service;
  final String? paymentSts;
  final String? paymentMode;
  final int? noofseats;
  final List<dynamic>? additionalFee;
  final String? estTime;
  final String? status;
  final List<String>? tripOtp;
  final String? paymenttxnid;
  final String? review;
  final List<ReqDvr>? reqDvr;
  final List<dynamic>? curReq;
  final String? needClear;
  final String? tripDt;
  final String? utc;
  final String? tripFdt;
  final String? gmtTime;
  final String? scId;
  final String? scity;
  final bool? isMultiLocation;
  final List<dynamic>? multiLocation;
  final String? createdAt;
  final int? tripno;
  final int? v;
  final Adsp? adsp;
  final Erfb? driverfb;
  final String? tripCode;
  final String? date;
  final String? rid;
  final Erfb? riderfb;

  MyRIdesModal({
    this.other,
    this.csp,
    this.dsp,
    this.acsp,
    this.applyValues,
    this.tripinvoicedriverdetails,
    this.scheduletripprocess,
    this.id,
    this.tenantId,
    this.requestFrom,
    this.requestId,
    this.triptype,
    this.bookingType,
    this.bookingFor,
    this.notes,
    this.hotelid,
    this.cpy,
    this.cpyid,
    this.drivercmpnyname,
    this.ridcpyid,
    this.ridercmpnyname,
    this.dvr,
    this.dvrid,
    this.ridrating,
    this.ridid,
    this.fare,
    this.vehicle,
    this.service,
    this.paymentSts,
    this.paymentMode,
    this.noofseats,
    this.additionalFee,
    this.estTime,
    this.status,
    this.tripOtp,
    this.paymenttxnid,
    this.review,
    this.reqDvr,
    this.curReq,
    this.needClear,
    this.tripDt,
    this.utc,
    this.tripFdt,
    this.gmtTime,
    this.scId,
    this.scity,
    this.isMultiLocation,
    this.multiLocation,
    this.createdAt,
    this.tripno,
    this.v,
    this.adsp,
    this.driverfb,
    this.tripCode,
    this.date,
    this.rid,
    this.riderfb,
  });

  factory MyRIdesModal.fromMap(Map<String, dynamic> json) => MyRIdesModal(
    other: json["other"] == null ? null : Other.fromMap(json["other"]),
    csp: json["csp"] == null ? null : Csp.fromMap(json["csp"]),
    dsp: json["dsp"] == null ? null : Dsp.fromMap(json["dsp"]),
    acsp: json["acsp"] == null ? null : Acsp.fromMap(json["acsp"]),
    applyValues: json["applyValues"] == null ? null : ApplyValues.fromMap(json["applyValues"]),
    tripinvoicedriverdetails: json["tripinvoicedriverdetails"] == null ? null : Tripinvoicedriverdetails.fromMap(json["tripinvoicedriverdetails"]),
    scheduletripprocess: json["scheduletripprocess"] == null ? null : Scheduletripprocess.fromMap(json["scheduletripprocess"]),
    id: json["_id"],
    tenantId: json["tenantId"],
    requestFrom: json["requestFrom"],
    requestId: json["requestId"],
    triptype: json["triptype"],
    bookingType: json["bookingType"],
    bookingFor: json["bookingFor"],
    notes: json["notes"],
    hotelid: json["hotelid"],
    cpy: json["cpy"],
    cpyid: json["cpyid"],
    drivercmpnyname: json["drivercmpnyname"],
    ridcpyid: json["ridcpyid"],
    ridercmpnyname: json["ridercmpnyname"],
    dvr: json["dvr"],
    dvrid: json["dvrid"],
    ridrating: json["ridrating"],
    ridid: json["ridid"],
    fare: json["fare"],
    vehicle: json["vehicle"],
    service: json["service"],
    paymentSts: json["paymentSts"],
    paymentMode: json["paymentMode"],
    noofseats: json["noofseats"],
    additionalFee: json["additionalFee"] == null ? [] : List<dynamic>.from(json["additionalFee"]!.map((x) => x)),
    estTime: json["estTime"],
    status: json["status"],
    tripOtp: json["tripOTP"] == null ? [] : List<String>.from(json["tripOTP"]!.map((x) => x)),
    paymenttxnid: json["paymenttxnid"],
    review: json["review"],
    reqDvr: json["reqDvr"] == null ? [] : List<ReqDvr>.from(json["reqDvr"]!.map((x) => ReqDvr.fromMap(x))),
    curReq: json["curReq"] == null ? [] : List<dynamic>.from(json["curReq"]!.map((x) => x)),
    needClear: json["needClear"],
    tripDt: json["tripDT"],
    utc: json["utc"],
    tripFdt: json["tripFDT"],
    gmtTime: json["gmtTime"],
    scId: json["scId"],
    scity: json["scity"],
    isMultiLocation: json["isMultiLocation"],
    multiLocation: json["multiLocation"] == null ? [] : List<dynamic>.from(json["multiLocation"]!.map((x) => x)),
    createdAt: json["createdAt"],
    tripno: json["tripno"],
    v: json["__v"],
    adsp: json["adsp"] == null ? null : Adsp.fromMap(json["adsp"]),
    driverfb: json["driverfb"] == null ? null : Erfb.fromMap(json["driverfb"]),
    tripCode: json["tripCode"],
    date: json["date"],
    rid: json["rid"],
    riderfb: json["riderfb"] == null ? null : Erfb.fromMap(json["riderfb"]),
  );

  Map<String, dynamic> toMap() => {
    "other": other?.toMap(),
    "csp": csp?.toMap(),
    "dsp": dsp?.toMap(),
    "acsp": acsp?.toMap(),
    "applyValues": applyValues?.toMap(),
    "tripinvoicedriverdetails": tripinvoicedriverdetails?.toMap(),
    "scheduletripprocess": scheduletripprocess?.toMap(),
    "_id": id,
    "tenantId": tenantId,
    "requestFrom": requestFrom,
    "requestId": requestId,
    "triptype": triptype,
    "bookingType": bookingType,
    "bookingFor": bookingFor,
    "notes": notes,
    "hotelid": hotelid,
    "cpy": cpy,
    "cpyid": cpyid,
    "drivercmpnyname": drivercmpnyname,
    "ridcpyid": ridcpyid,
    "ridercmpnyname": ridercmpnyname,
    "dvr": dvr,
    "dvrid": dvrid,
    "ridrating": ridrating,
    "ridid": ridid,
    "fare": fare,
    "vehicle": vehicle,
    "service": service,
    "paymentSts": paymentSts,
    "paymentMode": paymentMode,
    "noofseats": noofseats,
    "additionalFee": additionalFee == null ? [] : List<dynamic>.from(additionalFee!.map((x) => x)),
    "estTime": estTime,
    "status": status,
    "tripOTP": tripOtp == null ? [] : List<dynamic>.from(tripOtp!.map((x) => x)),
    "paymenttxnid": paymenttxnid,
    "review": review,
    "reqDvr": reqDvr == null ? [] : List<dynamic>.from(reqDvr!.map((x) => x.toMap())),
    "curReq": curReq == null ? [] : List<dynamic>.from(curReq!.map((x) => x)),
    "needClear": needClear,
    "tripDT": tripDt,
    "utc": utc,
    "tripFDT": tripFdt,
    "gmtTime": gmtTime,
    "scId": scId,
    "scity": scity,
    "isMultiLocation": isMultiLocation,
    "multiLocation": multiLocation == null ? [] : List<dynamic>.from(multiLocation!.map((x) => x)),
    "createdAt": createdAt,
    "tripno": tripno,
    "__v": v,
    "adsp": adsp?.toMap(),
    "driverfb": driverfb?.toMap(),
    "tripCode": tripCode,
    "date": date,
    "rid": rid,
    "riderfb": riderfb?.toMap(),
  };
}

class Acsp {
  final List<DistanceObj>? distanceObj;
  final int? minFareAdded;
  final int? timeRate;
  final int? hotelcommision;
  final int? companyAllowance;
  final int? companyCommission;
  final int? taxPercentage;
  final int? taxPercentagecgst;
  final int? taxcgst;
  final int? taxPercentagesgst;
  final int? taxsgst;
  final int? tollFee;
  final bool? isNight;
  final bool? isPeak;
  final String? surgeReason;
  final int? surgeAmt;
  final int? discountPercentage;
  final String? discountName;
  final int? startMeter;
  final int? endMeter;
  final String? startTime;
  final String? endTime;
  final dynamic packageId;
  final String? packageName;
  final int? baseKm;
  final int? extraKm;
  final int? fareForExtraKm;
  final int? baseTime;
  final int? extraTime;
  final int? fareForExtraTime;
  final int? returnTime;
  final int? returnKm;
  final int? hillKm;
  final int? hillFare;
  final int? driverEarning;
  final int? dayFare;
  final int? noOfNights;
  final int? noOfDays;
  final int? dayRate;
  final int? nightFare;
  final int? nightRate;
  final int? roundOff;
  final int? gatewayCharge;
  final int? drivermanualdiscountAmt;
  final int? drivermanualconvenyancefee;
  final int? googleCharge;
  final int? pgcharge;
  final int? base;
  final String? dist;
  final int? distfare;
  final String? time;
  final int? timefare;
  final int? comison;
  final int? cost;
  final String? via;
  final int? actualcost;
  final int? bal;
  final int? booking;
  final int? carddebt;
  final String? chId;
  final int? conveyance;
  final int? costBeforeDiscount;
  final int? detect;
  final int? fareAmtBeforeSurge;
  final String? fareType;
  final int? farewithoutTaxNBookingFee;
  final int? minFare;
  final String? minwaitingTime;
  final double? nightPer;
  final int? oldBalance;
  final int? outstanding;
  final int? peakPer;
  final int? perKmRate;
  final int? promoamt;
  final int? tax;
  final int? totalFareWithOutOldBal;
  final String? totalwaitingTime;
  final int? waitingCharge;
  final int? waitingRate;
  final String? waitingTime;
  final int? walletdebt;

  Acsp({
    this.distanceObj,
    this.minFareAdded,
    this.timeRate,
    this.hotelcommision,
    this.companyAllowance,
    this.companyCommission,
    this.taxPercentage,
    this.taxPercentagecgst,
    this.taxcgst,
    this.taxPercentagesgst,
    this.taxsgst,
    this.tollFee,
    this.isNight,
    this.isPeak,
    this.surgeReason,
    this.surgeAmt,
    this.discountPercentage,
    this.discountName,
    this.startMeter,
    this.endMeter,
    this.startTime,
    this.endTime,
    this.packageId,
    this.packageName,
    this.baseKm,
    this.extraKm,
    this.fareForExtraKm,
    this.baseTime,
    this.extraTime,
    this.fareForExtraTime,
    this.returnTime,
    this.returnKm,
    this.hillKm,
    this.hillFare,
    this.driverEarning,
    this.dayFare,
    this.noOfNights,
    this.noOfDays,
    this.dayRate,
    this.nightFare,
    this.nightRate,
    this.roundOff,
    this.gatewayCharge,
    this.drivermanualdiscountAmt,
    this.drivermanualconvenyancefee,
    this.googleCharge,
    this.pgcharge,
    this.base,
    this.dist,
    this.distfare,
    this.time,
    this.timefare,
    this.comison,
    this.cost,
    this.via,
    this.actualcost,
    this.bal,
    this.booking,
    this.carddebt,
    this.chId,
    this.conveyance,
    this.costBeforeDiscount,
    this.detect,
    this.fareAmtBeforeSurge,
    this.fareType,
    this.farewithoutTaxNBookingFee,
    this.minFare,
    this.minwaitingTime,
    this.nightPer,
    this.oldBalance,
    this.outstanding,
    this.peakPer,
    this.perKmRate,
    this.promoamt,
    this.tax,
    this.totalFareWithOutOldBal,
    this.totalwaitingTime,
    this.waitingCharge,
    this.waitingRate,
    this.waitingTime,
    this.walletdebt,
  });

  factory Acsp.fromMap(Map<String, dynamic> json) => Acsp(
    distanceObj: json["distanceObj"] == null ? [] : List<DistanceObj>.from(json["distanceObj"]!.map((x) => DistanceObj.fromMap(x))),
    minFareAdded: json["minFareAdded"],
    timeRate: json["timeRate"],
    hotelcommision: json["hotelcommision"],
    companyAllowance: json["companyAllowance"],
    companyCommission: json["companyCommission"],
    taxPercentage: json["taxPercentage"],
    taxPercentagecgst: json["taxPercentagecgst"],
    taxcgst: json["taxcgst"],
    taxPercentagesgst: json["taxPercentagesgst"],
    taxsgst: json["taxsgst"],
    tollFee: json["tollFee"],
    isNight: json["isNight"],
    isPeak: json["isPeak"],
    surgeReason: json["surgeReason"],
    surgeAmt: json["surgeAmt"],
    discountPercentage: json["discountPercentage"],
    discountName: json["discountName"],
    startMeter: json["startMeter"],
    endMeter: json["endMeter"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    packageId: json["packageId"],
    packageName: json["packageName"],
    baseKm: json["baseKM"],
    extraKm: json["extraKM"],
    fareForExtraKm: json["fareForExtraKM"],
    baseTime: json["baseTime"],
    extraTime: json["extraTime"],
    fareForExtraTime: json["fareForExtraTime"],
    returnTime: json["returnTime"],
    returnKm: json["returnKM"],
    hillKm: json["hillKm"],
    hillFare: json["hillFare"],
    driverEarning: json["driverEarning"],
    dayFare: json["dayFare"],
    noOfNights: json["noOfNights"],
    noOfDays: json["noOfDays"],
    dayRate: json["dayRate"],
    nightFare: json["nightFare"],
    nightRate: json["nightRate"],
    roundOff: json["roundOff"],
    gatewayCharge: json["gatewayCharge"],
    drivermanualdiscountAmt: json["drivermanualdiscountAmt"],
    drivermanualconvenyancefee: json["drivermanualconvenyancefee"],
    googleCharge: json["googleCharge"],
    pgcharge: json["pgcharge"],
    base: json["base"],
    dist: json["dist"],
    distfare: json["distfare"],
    time: json["time"],
    timefare: json["timefare"],
    comison: json["comison"],
    cost: json["cost"],
    via: json["via"],
    actualcost: json["actualcost"],
    bal: json["bal"],
    booking: json["booking"],
    carddebt: json["carddebt"],
    chId: json["chId"],
    conveyance: json["conveyance"],
    costBeforeDiscount: json["costBeforeDiscount"],
    detect: json["detect"],
    fareAmtBeforeSurge: json["fareAmtBeforeSurge"],
    fareType: json["fareType"],
    farewithoutTaxNBookingFee: json["farewithoutTaxNBookingFee"],
    minFare: json["minFare"],
    minwaitingTime: json["minwaitingTime"],
    nightPer: json["nightPer"]?.toDouble(),
    oldBalance: json["oldBalance"],
    outstanding: json["outstanding"],
    peakPer: json["peakPer"],
    perKmRate: json["perKmRate"],
    promoamt: json["promoamt"],
    tax: json["tax"],
    totalFareWithOutOldBal: json["totalFareWithOutOldBal"],
    totalwaitingTime: json["totalwaitingTime"],
    waitingCharge: json["waitingCharge"],
    waitingRate: json["waitingRate"],
    waitingTime: json["waitingTime"],
    walletdebt: json["walletdebt"],
  );

  Map<String, dynamic> toMap() => {
    "distanceObj": distanceObj == null ? [] : List<dynamic>.from(distanceObj!.map((x) => x.toMap())),
    "minFareAdded": minFareAdded,
    "timeRate": timeRate,
    "hotelcommision": hotelcommision,
    "companyAllowance": companyAllowance,
    "companyCommission": companyCommission,
    "taxPercentage": taxPercentage,
    "taxPercentagecgst": taxPercentagecgst,
    "taxcgst": taxcgst,
    "taxPercentagesgst": taxPercentagesgst,
    "taxsgst": taxsgst,
    "tollFee": tollFee,
    "isNight": isNight,
    "isPeak": isPeak,
    "surgeReason": surgeReason,
    "surgeAmt": surgeAmt,
    "discountPercentage": discountPercentage,
    "discountName": discountName,
    "startMeter": startMeter,
    "endMeter": endMeter,
    "startTime": startTime,
    "endTime": endTime,
    "packageId": packageId,
    "packageName": packageName,
    "baseKM": baseKm,
    "extraKM": extraKm,
    "fareForExtraKM": fareForExtraKm,
    "baseTime": baseTime,
    "extraTime": extraTime,
    "fareForExtraTime": fareForExtraTime,
    "returnTime": returnTime,
    "returnKM": returnKm,
    "hillKm": hillKm,
    "hillFare": hillFare,
    "driverEarning": driverEarning,
    "dayFare": dayFare,
    "noOfNights": noOfNights,
    "noOfDays": noOfDays,
    "dayRate": dayRate,
    "nightFare": nightFare,
    "nightRate": nightRate,
    "roundOff": roundOff,
    "gatewayCharge": gatewayCharge,
    "drivermanualdiscountAmt": drivermanualdiscountAmt,
    "drivermanualconvenyancefee": drivermanualconvenyancefee,
    "googleCharge": googleCharge,
    "pgcharge": pgcharge,
    "base": base,
    "dist": dist,
    "distfare": distfare,
    "time": time,
    "timefare": timefare,
    "comison": comison,
    "cost": cost,
    "via": via,
    "actualcost": actualcost,
    "bal": bal,
    "booking": booking,
    "carddebt": carddebt,
    "chId": chId,
    "conveyance": conveyance,
    "costBeforeDiscount": costBeforeDiscount,
    "detect": detect,
    "fareAmtBeforeSurge": fareAmtBeforeSurge,
    "fareType": fareType,
    "farewithoutTaxNBookingFee": farewithoutTaxNBookingFee,
    "minFare": minFare,
    "minwaitingTime": minwaitingTime,
    "nightPer": nightPer,
    "oldBalance": oldBalance,
    "outstanding": outstanding,
    "peakPer": peakPer,
    "perKmRate": perKmRate,
    "promoamt": promoamt,
    "tax": tax,
    "totalFareWithOutOldBal": totalFareWithOutOldBal,
    "totalwaitingTime": totalwaitingTime,
    "waitingCharge": waitingCharge,
    "waitingRate": waitingRate,
    "waitingTime": waitingTime,
    "walletdebt": walletdebt,
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

class Adsp {
  final String? start;
  final String? end;
  final String? from;
  final String? to;
  final double? pLat;
  final double? pLng;
  final double? dLat;
  final double? dLng;
  final String? distanceKm;
  final String? estTime;
  final String? map;

  Adsp({
    this.start,
    this.end,
    this.from,
    this.to,
    this.pLat,
    this.pLng,
    this.dLat,
    this.dLng,
    this.distanceKm,
    this.estTime,
    this.map,
  });

  factory Adsp.fromMap(Map<String, dynamic> json) => Adsp(
    start: json["start"],
    end: json["end"],
    from: json["from"],
    to: json["to"],
    pLat: json["pLat"]?.toDouble(),
    pLng: json["pLng"]?.toDouble(),
    dLat: json["dLat"]?.toDouble(),
    dLng: json["dLng"]?.toDouble(),
    distanceKm: json["distanceKM"],
    estTime: json["estTime"],
    map: json["map"],
  );

  Map<String, dynamic> toMap() => {
    "start": start,
    "end": end,
    "from": from,
    "to": to,
    "pLat": pLat,
    "pLng": pLng,
    "dLat": dLat,
    "dLng": dLng,
    "distanceKM": distanceKm,
    "estTime": estTime,
    "map": map,
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

class Csp {
  final int? base;
  final String? dist;
  final double? distfare;
  final int? perKmRate;
  final String? time;
  final int? timefare;
  final int? comison;
  final int? hotelcommision;
  final String? promo;
  final int? promoamt;
  final int? travelRate;
  final double? cost;
  final int? conveyance;
  final int? tax;
  final String? via;
  final int? taxPercentage;
  final int? driverCancelFee;
  final int? riderCancelFee;
  final bool? isNight;
  final bool? isPeak;
  final double? nightPer;
  final int? peakPer;
  final String? packageId;
  final String? packageName;
  final int? baseKm;
  final double? extraKm;
  final double? fareForExtraKm;
  final int? baseTime;
  final int? extraTime;
  final double? fareForExtraTime;
  final int? googleCharge;
  final int? pgcharge;
  final int? booking;
  final List<dynamic>? distanceObj;
  final int? minFareAdded;
  final int? minFare;
  final double? travelFare;
  final int? companyAllowance;
  final int? companyCommission;
  final int? taxPercentagecgst;
  final int? taxcgst;
  final int? taxPercentagesgst;
  final int? taxsgst;
  final String? surgeReason;
  final int? surgeAmt;
  final int? oldBalance;
  final int? dayFare;
  final int? nightFare;

  Csp({
    this.base,
    this.dist,
    this.distfare,
    this.perKmRate,
    this.time,
    this.timefare,
    this.comison,
    this.hotelcommision,
    this.promo,
    this.promoamt,
    this.travelRate,
    this.cost,
    this.conveyance,
    this.tax,
    this.via,
    this.taxPercentage,
    this.driverCancelFee,
    this.riderCancelFee,
    this.isNight,
    this.isPeak,
    this.nightPer,
    this.peakPer,
    this.packageId,
    this.packageName,
    this.baseKm,
    this.extraKm,
    this.fareForExtraKm,
    this.baseTime,
    this.extraTime,
    this.fareForExtraTime,
    this.googleCharge,
    this.pgcharge,
    this.booking,
    this.distanceObj,
    this.minFareAdded,
    this.minFare,
    this.travelFare,
    this.companyAllowance,
    this.companyCommission,
    this.taxPercentagecgst,
    this.taxcgst,
    this.taxPercentagesgst,
    this.taxsgst,
    this.surgeReason,
    this.surgeAmt,
    this.oldBalance,
    this.dayFare,
    this.nightFare,
  });

  factory Csp.fromMap(Map<String, dynamic> json) => Csp(
    base: json["base"],
    dist: json["dist"],
    distfare: json["distfare"]?.toDouble(),
    perKmRate: json["perKmRate"],
    time: json["time"],
    timefare: json["timefare"],
    comison: json["comison"],
    hotelcommision: json["hotelcommision"],
    promo: json["promo"],
    promoamt: json["promoamt"],
    travelRate: json["travelRate"],
    cost: json["cost"]?.toDouble(),
    conveyance: json["conveyance"],
    tax: json["tax"],
    via: json["via"],
    taxPercentage: json["taxPercentage"],
    driverCancelFee: json["driverCancelFee"],
    riderCancelFee: json["riderCancelFee"],
    isNight: json["isNight"],
    isPeak: json["isPeak"],
    nightPer: json["nightPer"]?.toDouble(),
    peakPer: json["peakPer"],
    packageId: json["packageId"],
    packageName: json["packageName"],
    baseKm: json["baseKM"],
    extraKm: json["extraKM"]?.toDouble(),
    fareForExtraKm: json["fareForExtraKM"]?.toDouble(),
    baseTime: json["baseTime"],
    extraTime: json["extraTime"],
    fareForExtraTime: json["fareForExtraTime"]?.toDouble(),
    googleCharge: json["googleCharge"],
    pgcharge: json["pgcharge"],
    booking: json["booking"],
    distanceObj: json["distanceObj"] == null ? [] : List<dynamic>.from(json["distanceObj"]!.map((x) => x)),
    minFareAdded: json["minFareAdded"],
    minFare: json["minFare"],
    travelFare: json["travelFare"]?.toDouble(),
    companyAllowance: json["companyAllowance"],
    companyCommission: json["companyCommission"],
    taxPercentagecgst: json["taxPercentagecgst"],
    taxcgst: json["taxcgst"],
    taxPercentagesgst: json["taxPercentagesgst"],
    taxsgst: json["taxsgst"],
    surgeReason: json["surgeReason"],
    surgeAmt: json["surgeAmt"],
    oldBalance: json["oldBalance"],
    dayFare: json["dayFare"],
    nightFare: json["nightFare"],
  );

  Map<String, dynamic> toMap() => {
    "base": base,
    "dist": dist,
    "distfare": distfare,
    "perKmRate": perKmRate,
    "time": time,
    "timefare": timefare,
    "comison": comison,
    "hotelcommision": hotelcommision,
    "promo": promo,
    "promoamt": promoamt,
    "travelRate": travelRate,
    "cost": cost,
    "conveyance": conveyance,
    "tax": tax,
    "via": via,
    "taxPercentage": taxPercentage,
    "driverCancelFee": driverCancelFee,
    "riderCancelFee": riderCancelFee,
    "isNight": isNight,
    "isPeak": isPeak,
    "nightPer": nightPer,
    "peakPer": peakPer,
    "packageId": packageId,
    "packageName": packageName,
    "baseKM": baseKm,
    "extraKM": extraKm,
    "fareForExtraKM": fareForExtraKm,
    "baseTime": baseTime,
    "extraTime": extraTime,
    "fareForExtraTime": fareForExtraTime,
    "googleCharge": googleCharge,
    "pgcharge": pgcharge,
    "booking": booking,
    "distanceObj": distanceObj == null ? [] : List<dynamic>.from(distanceObj!.map((x) => x)),
    "minFareAdded": minFareAdded,
    "minFare": minFare,
    "travelFare": travelFare,
    "companyAllowance": companyAllowance,
    "companyCommission": companyCommission,
    "taxPercentagecgst": taxPercentagecgst,
    "taxcgst": taxcgst,
    "taxPercentagesgst": taxPercentagesgst,
    "taxsgst": taxsgst,
    "surgeReason": surgeReason,
    "surgeAmt": surgeAmt,
    "oldBalance": oldBalance,
    "dayFare": dayFare,
    "nightFare": nightFare,
  };
}

class Erfb {
  final String? rating;
  final String? cmts;

  Erfb({
    this.rating,
    this.cmts,
  });

  factory Erfb.fromMap(Map<String, dynamic> json) => Erfb(
    rating: json["rating"],
    cmts: json["cmts"],
  );

  Map<String, dynamic> toMap() => {
    "rating": rating,
    "cmts": cmts,
  };
}

class Dsp {
  final String? distanceKm;
  final String? estTime;
  final String? start;
  final String? end;
  final List<double>? startcoords;
  final List<double>? endcoords;
  final String? startDay;
  final String? returnDay;
  final String? outstationType;

  Dsp({
    this.distanceKm,
    this.estTime,
    this.start,
    this.end,
    this.startcoords,
    this.endcoords,
    this.startDay,
    this.returnDay,
    this.outstationType,
  });

  factory Dsp.fromMap(Map<String, dynamic> json) => Dsp(
    distanceKm: json["distanceKM"],
    estTime: json["estTime"],
    start: json["start"],
    end: json["end"],
    startcoords: json["startcoords"] == null ? [] : List<double>.from(json["startcoords"]!.map((x) => x?.toDouble())),
    endcoords: json["endcoords"] == null ? [] : List<double>.from(json["endcoords"]!.map((x) => x?.toDouble())),
    startDay: json["startDay"],
    returnDay: json["returnDay"],
    outstationType: json["outstationType"],
  );

  Map<String, dynamic> toMap() => {
    "distanceKM": distanceKm,
    "estTime": estTime,
    "start": start,
    "end": end,
    "startcoords": startcoords == null ? [] : List<dynamic>.from(startcoords!.map((x) => x)),
    "endcoords": endcoords == null ? [] : List<dynamic>.from(endcoords!.map((x) => x)),
    "startDay": startDay,
    "returnDay": returnDay,
    "outstationType": outstationType,
  };
}

class Other {
  final String? ph;
  final String? phCode;
  final String? name;
  final dynamic email;

  Other({
    this.ph,
    this.phCode,
    this.name,
    this.email,
  });

  factory Other.fromMap(Map<String, dynamic> json) => Other(
    ph: json["ph"],
    phCode: json["phCode"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "ph": ph,
    "phCode": phCode,
    "name": name,
    "email": email,
  };
}

class ReqDvr {
  final String? drvId;
  final int? called;
  final int? distVal;

  ReqDvr({
    this.drvId,
    this.called,
    this.distVal,
  });

  factory ReqDvr.fromMap(Map<String, dynamic> json) => ReqDvr(
    drvId: json["drvId"],
    called: json["called"],
    distVal: json["distVal"],
  );

  Map<String, dynamic> toMap() => {
    "drvId": drvId,
    "called": called,
    "distVal": distVal,
  };
}

class Scheduletripprocess {
  final String? tripprocessstatus;
  final List<dynamic>? tripintresteddrivers;
  final dynamic userrequesteddriver;
  final dynamic acceptriderid;
  final dynamic acceptdriverid;
  final List<dynamic>? tripdeclinedrivers;
  final String? riderrequestwaitingtime;
  final String? acceptriderdate;

  Scheduletripprocess({
    this.tripprocessstatus,
    this.tripintresteddrivers,
    this.userrequesteddriver,
    this.acceptriderid,
    this.acceptdriverid,
    this.tripdeclinedrivers,
    this.riderrequestwaitingtime,
    this.acceptriderdate,
  });

  factory Scheduletripprocess.fromMap(Map<String, dynamic> json) => Scheduletripprocess(
    tripprocessstatus: json["tripprocessstatus"],
    tripintresteddrivers: json["tripintresteddrivers"] == null ? [] : List<dynamic>.from(json["tripintresteddrivers"]!.map((x) => x)),
    userrequesteddriver: json["userrequesteddriver"],
    acceptriderid: json["acceptriderid"],
    acceptdriverid: json["acceptdriverid"],
    tripdeclinedrivers: json["tripdeclinedrivers"] == null ? [] : List<dynamic>.from(json["tripdeclinedrivers"]!.map((x) => x)),
    riderrequestwaitingtime: json["riderrequestwaitingtime"],
    acceptriderdate: json["acceptriderdate"],
  );

  Map<String, dynamic> toMap() => {
    "tripprocessstatus": tripprocessstatus,
    "tripintresteddrivers": tripintresteddrivers == null ? [] : List<dynamic>.from(tripintresteddrivers!.map((x) => x)),
    "userrequesteddriver": userrequesteddriver,
    "acceptriderid": acceptriderid,
    "acceptdriverid": acceptdriverid,
    "tripdeclinedrivers": tripdeclinedrivers == null ? [] : List<dynamic>.from(tripdeclinedrivers!.map((x) => x)),
    "riderrequestwaitingtime": riderrequestwaitingtime,
    "acceptriderdate": acceptriderdate,
  };
}

class Tripinvoicedriverdetails {
  final String? driverbussinessname;
  final String? driveraddress;
  final String? drivergstNo;
  final String? driverpancardNo;
  final String? drivername;
  final String? driverphone;
  final String? drivervehicletype;
  final String? drivervehicleNumber;

  Tripinvoicedriverdetails({
    this.driverbussinessname,
    this.driveraddress,
    this.drivergstNo,
    this.driverpancardNo,
    this.drivername,
    this.driverphone,
    this.drivervehicletype,
    this.drivervehicleNumber,
  });

  factory Tripinvoicedriverdetails.fromMap(Map<String, dynamic> json) => Tripinvoicedriverdetails(
    driverbussinessname: json["driverbussinessname"],
    driveraddress: json["driveraddress"],
    drivergstNo: json["drivergstNo"],
    driverpancardNo: json["driverpancardNo"],
    drivername: json["drivername"],
    driverphone: json["driverphone"],
    drivervehicletype: json["drivervehicletype"],
    drivervehicleNumber: json["drivervehicleNumber"],
  );

  Map<String, dynamic> toMap() => {
    "driverbussinessname": driverbussinessname,
    "driveraddress": driveraddress,
    "drivergstNo": drivergstNo,
    "driverpancardNo": driverpancardNo,
    "drivername": drivername,
    "driverphone": driverphone,
    "drivervehicletype": drivervehicletype,
    "drivervehicleNumber": drivervehicleNumber,
  };
}
