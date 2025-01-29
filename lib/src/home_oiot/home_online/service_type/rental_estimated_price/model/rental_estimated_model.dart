class RentalEstimatModel {
  final Hatchback hatchback;
  final Sedan sedan;
  final Suv suv;
  final Luxury luxury;

  RentalEstimatModel({
    required this.hatchback,
    required this.sedan,
    required this.suv,
    required this.luxury,
  });

  factory RentalEstimatModel.fromJson(Map<String, dynamic> json) {
    return RentalEstimatModel(
      hatchback: Hatchback.fromJson(json['hatchBack']),
      sedan: Sedan.fromJson(json['sedan']),
      suv: Suv.fromJson(json['suv']),
      luxury: Luxury.fromJson(json['luxury']),
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

class Luxury {
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

  Luxury({
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

  factory Luxury.fromJson(Map<String, dynamic> json) {
    return Luxury(
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
