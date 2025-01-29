class ScheduledRideModel {
  final String serviceType;
  final String vehicleType;
  final String tripId;
  String tripDate;
  String tripTime;
  final String driverName;
  final String driverPhoto;
  final String driverRating;
  final String pickUpLocation;
  final String dropLocation;
  final String vehicleNumber;
  final String vehicleModel;
  final String tripAmount;
  final String driverReachTime;
  final String tripKmAway;
  final String tripDistance;
  final String tripDuration;
  final String extraKm;
  final String extraTime;
  final String baseFare;
  final String baseTime;

  ScheduledRideModel({
    required this.serviceType,
    required this.vehicleType,
    required this.tripId,
    required this.tripDate,
    required this.tripTime,
    required this.driverName,
    required this.driverPhoto,
    required this.driverRating,
    required this.pickUpLocation,
    required this.dropLocation,
    required this.vehicleNumber,
    required this.vehicleModel,
    required this.tripAmount,
    required this.driverReachTime,
    required this.tripKmAway,
    required this.tripDistance,
    required this.tripDuration,
    required this.extraKm,
    required this.extraTime,
    required this.baseFare,
    required this.baseTime,
  });

  factory ScheduledRideModel.fromJson(Map<String, dynamic> json) {
    return ScheduledRideModel(
      serviceType: json['serviceType'],
      vehicleType: json['vehicleType'],
      tripId: json['tripId'],
      tripDate: json['tripDate'],
      tripTime: json['tripTime'],
      driverName: json['driverName'],
      driverPhoto: json['driverPhoto'],
      driverRating: json['driverRating'],
      pickUpLocation: json['pickUpLocation'],
      dropLocation: json['dropLocation'],
      vehicleNumber: json['vehicleNumber'],
      vehicleModel: json['vehicleModel'],
      tripAmount: json['tripAmount'],
      driverReachTime: json['driverReachTime'],
      tripKmAway: json['tripKmAway'],
      tripDistance: json['tripDistance'],
      tripDuration: json['tripDuration'],
      extraKm: json['extraKm'],
      extraTime: json['extraTime'],
      baseFare: json['baseFare'],
      baseTime: json['baseTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceType': serviceType,
      'vehicleType': vehicleType,
      'tripId': tripId,
      'tripDate': tripDate,
      'tripTime': tripTime,
      'driverName': driverName,
      'driverPhoto': driverPhoto,
      'driverRating': driverRating,
      'pickUpLocation': pickUpLocation,
      'dropLocation': dropLocation,
      'vehicleNumber': vehicleNumber,
      'vehicleModel': vehicleModel,
      'tripAmount': tripAmount,
      'driverReachTime': driverReachTime,
      'tripKmAway': tripKmAway,
      'tripDistance': tripDistance,
      'tripDuration': tripDuration,
      'extraKm': extraKm,
      'extraTime': extraTime,
      'baseFare': baseFare,
      'baseTime': baseTime,
    };
  }
}
