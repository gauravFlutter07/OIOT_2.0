class BookingInvoiceModel {
  final String bookingId;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String amountTobePaid;
  final String driverName;
  final String profileId;
  final String vehicleRegNo;
  final String vehicleType;
  final String seatingCapacity;
  final String vehicleColor;
  final String panNo;
  final String gstNo;
  final String customerId;
  final String customerPan;
  final String customerGst;
  final String customerAdress;
  final String modeofBooking;
  final String pickUpLocation;
  final String dropLocation;
  final String serviceType;
  final String basePrice;
  final String package;
  final String extraKm;
  final String extraTime;
  final String totalDistance;
  final String totalRidingTime;
  final String totalBataCount;
  final String dayBata;
  final String nightBata;
  final String totalCharges;
  final String gst;
  final String sgst;
  final String driverDiscount;
  final String convCharges;
  final String payableAmount;
  final String promotionalDiscound;
  final String driverRating;

  BookingInvoiceModel({
    required this.bookingId,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.amountTobePaid,
    required this.driverName,
    required this.profileId,
    required this.vehicleRegNo,
    required this.vehicleType,
    required this.seatingCapacity,
    required this.vehicleColor,
    required this.panNo,
    required this.gstNo,
    required this.customerId,
    required this.customerPan,
    required this.customerGst,
    required this.customerAdress,
    required this.modeofBooking,
    required this.pickUpLocation,
    required this.dropLocation,
    required this.serviceType,
    required this.basePrice,
    required this.package,
    required this.extraKm,
    required this.extraTime,
    required this.totalDistance,
    required this.totalRidingTime,
    required this.totalBataCount,
    required this.dayBata,
    required this.nightBata,
    required this.totalCharges,
    required this.gst,
    required this.sgst,
    required this.driverDiscount,
    required this.convCharges,
    required this.payableAmount,
    required this.promotionalDiscound,
    required this.driverRating,
  });

  factory BookingInvoiceModel.fromJson(Map<String, dynamic> json) {
    return BookingInvoiceModel(
      bookingId: json['bookingId'],
      startDate: json['startDate'],
      startTime: json['startTime'],
      endDate: json['endDate'],
      endTime: json['endTime'],
      amountTobePaid: json['amountTobePaid'],
      driverName: json['driverName'],
      profileId: json['profileId'],
      vehicleRegNo: json['vehicleRegNo'],
      vehicleType: json['vehicleType'],
      seatingCapacity: json['seatingCapacity'],
      vehicleColor: json['vehicleColor'],
      panNo: json['panNo'],
      gstNo: json['gstNo'],
      customerId: json['customerId'],
      customerPan: json['customerPan'],
      customerGst: json['customerGst'],
      customerAdress: json['customerAdress'],
      modeofBooking: json['modeofBooking'],
      pickUpLocation: json['pickUpLocation'],
      dropLocation: json['dropLocation'],
      serviceType: json['serviceType'],
      basePrice: json['basePrice'],
      package: json['package'],
      extraKm: json['extraKm'],
      extraTime: json['extraTime'],
      totalDistance: json['totalDistance'],
      totalRidingTime: json['totalRidingTime'],
      totalBataCount: json['totalBataCount'],
      dayBata: json['dayBata'],
      nightBata: json['nightBata'],
      totalCharges: json['totalCharges'],
      gst: json['gst'],
      sgst: json['sgst'],
      driverDiscount: json['driverDiscount'],
      convCharges: json['convCharges'],
      payableAmount: json['payableAmount'],
      promotionalDiscound: json['promotionalDiscound'],
      driverRating: json['driverRating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'startDate': startDate,
      'startTime': startTime,
      'endDate': endDate,
      'endTime': endTime,
      'amountTobePaid': amountTobePaid,
      'driverName': driverName,
      'profileId': profileId,
      'vehicleRegNo': vehicleRegNo,
      'vehicleType': vehicleType,
      'seatingCapacity': seatingCapacity,
      'vehicleColor': vehicleColor,
      'panNo': panNo,
      'gstNo': gstNo,
      'customerId': customerId,
      'customerPan': customerPan,
      'customerGst': customerGst,
      'customerAdress': customerAdress,
      'modeofBooking': modeofBooking,
      'pickUpLocation': pickUpLocation,
      'dropLocation': dropLocation,
      'serviceType': serviceType,
      'basePrice': basePrice,
      'package': package,
      'extraKm': extraKm,
      'extraTime': extraTime,
      'totalDistance': totalDistance,
      'totalRidingTime': totalRidingTime,
      'totalBataCount': totalBataCount,
      'dayBata': dayBata,
      'nightBata': nightBata,
      'totalCharges': totalCharges,
      'gst': gst,
      'sgst': sgst,
      'driverDiscount': driverDiscount,
      'convCharges': convCharges,
      'payableAmount': payableAmount,
      'promotionalDiscound': promotionalDiscound,
      'driverRating': driverRating,
    };
  }
}
