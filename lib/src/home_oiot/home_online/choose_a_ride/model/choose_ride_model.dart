class ChooseARideInvoiceModel {
  final Hatchback hatchback;
  final Sedan sedan;
  final Suv suv;

  ChooseARideInvoiceModel({
    required this.hatchback,
    required this.sedan,
    required this.suv,
  });

  factory ChooseARideInvoiceModel.fromJson(Map<String, dynamic> json) {
    return ChooseARideInvoiceModel(
      hatchback: Hatchback.fromJson(json['hatchBack']),
      sedan: Sedan.fromJson(json['sedan']),
      suv: Suv.fromJson(json['suv']),
    );
  }
}

class Hatchback {
  final String bookingId;
  final String estimatedAmount;
  final String bookingType;
  final String pickUpLocation;
  final String destinationLocation;
  final String serviceType;
  final String package;
  final String basePrice;
  final String extraKm;
  final String extraTime;
  final String totalDistance;
  final String totalRidingTime;

  Hatchback({
    required this.bookingId,
    required this.estimatedAmount,
    required this.bookingType,
    required this.pickUpLocation,
    required this.destinationLocation,
    required this.serviceType,
    required this.package,
    required this.basePrice,
    required this.extraKm,
    required this.extraTime,
    required this.totalDistance,
    required this.totalRidingTime,
  });

  factory Hatchback.fromJson(Map<String, dynamic> json) {
    return Hatchback(
      bookingId: json['bookingId'],
      estimatedAmount: json['estimatedAmount'],
      bookingType: json['bookingType'],
      pickUpLocation: json['pickUpLocation'],
      destinationLocation: json['destinationLocation'],
      serviceType: json['serviceType'],
      package: json['package'],
      basePrice: json['basePrice'],
      extraKm: json['extraKm'],
      extraTime: json['extraTime'],
      totalDistance: json['totalDistance'],
      totalRidingTime: json['totalRidingTime'],
    );
  }
}

class Sedan {
  final String bookingId;
  final String estimatedAmount;
  final String bookingType;
  final String pickUpLocation;
  final String destinationLocation;
  final String serviceType;
  final String package;
  final String basePrice;
  final String extraKm;
  final String extraTime;
  final String totalDistance;
  final String totalRidingTime;

  Sedan({
    required this.bookingId,
    required this.estimatedAmount,
    required this.bookingType,
    required this.pickUpLocation,
    required this.destinationLocation,
    required this.serviceType,
    required this.package,
    required this.basePrice,
    required this.extraKm,
    required this.extraTime,
    required this.totalDistance,
    required this.totalRidingTime,
  });

  factory Sedan.fromJson(Map<String, dynamic> json) {
    return Sedan(
      bookingId: json['bookingId'],
      estimatedAmount: json['estimatedAmount'],
      bookingType: json['bookingType'],
      pickUpLocation: json['pickUpLocation'],
      destinationLocation: json['destinationLocation'],
      serviceType: json['serviceType'],
      package: json['package'],
      basePrice: json['basePrice'],
      extraKm: json['extraKm'],
      extraTime: json['extraTime'],
      totalDistance: json['totalDistance'],
      totalRidingTime: json['totalRidingTime'],
    );
  }
}

class Suv {
  final String bookingId;
  final String estimatedAmount;
  final String bookingType;
  final String pickUpLocation;
  final String destinationLocation;
  final String serviceType;
  final String package;
  final String basePrice;
  final String extraKm;
  final String extraTime;
  final String totalDistance;
  final String totalRidingTime;

  Suv({
    required this.bookingId,
    required this.estimatedAmount,
    required this.bookingType,
    required this.pickUpLocation,
    required this.destinationLocation,
    required this.serviceType,
    required this.package,
    required this.basePrice,
    required this.extraKm,
    required this.extraTime,
    required this.totalDistance,
    required this.totalRidingTime,
  });

  factory Suv.fromJson(Map<String, dynamic> json) {
    return Suv(
      bookingId: json['bookingId'],
      estimatedAmount: json['estimatedAmount'],
      bookingType: json['bookingType'],
      pickUpLocation: json['pickUpLocation'],
      destinationLocation: json['destinationLocation'],
      serviceType: json['serviceType'],
      package: json['package'],
      basePrice: json['basePrice'],
      extraKm: json['extraKm'],
      extraTime: json['extraTime'],
      totalDistance: json['totalDistance'],
      totalRidingTime: json['totalRidingTime'],
    );
  }
}
