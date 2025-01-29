class DriverOnTheWayDataModel {
  final String driverPhoto;
  final String driverName;
  final String driverRating;
  final String driverTime;
  final String vehiclePhoto;
  final String vehicleModel;
  final String vehicleNumber;
  final String tripAmount;
  final String pickUpLocation;
  final String dropLocation;
  final String tripTime;
  final String tripDistance;
  final String tripOtp;
  final String tripId;
  final String tripStartDate;
  final String tripStartTime;
  final String tripEndDate;
  final String tripEndTime;

  DriverOnTheWayDataModel({
    required this.driverPhoto,
    required this.driverName,
    required this.driverRating,
    required this.driverTime,
    required this.vehiclePhoto,
    required this.vehicleModel,
    required this.vehicleNumber,
    required this.tripAmount,
    required this.pickUpLocation,
    required this.dropLocation,
    required this.tripTime,
    required this.tripDistance,
    required this.tripOtp,
    required this.tripId,
    required this.tripStartDate,
    required this.tripStartTime,
    required this.tripEndDate,
    required this.tripEndTime,
  });

  factory DriverOnTheWayDataModel.fromJson(Map<String, dynamic> json) {
    return DriverOnTheWayDataModel(
      driverPhoto: json['driverPhoto'],
      driverName: json['driverName'],
      driverRating: json['driverRating'],
      driverTime: json['driverTime'],
      vehiclePhoto: json['vehiclePhoto'],
      vehicleModel: json['vehicleModel'],
      vehicleNumber: json['vehicleNumber'],
      tripAmount: json['tripAmount'],
      pickUpLocation: json['pickUpLocation'],
      dropLocation: json['dropLocation'],
      tripTime: json['tripTime'],
      tripDistance: json['tripDistance'],
      tripOtp: json['tripOtp'],
      tripId: json['tripId'],
      tripStartDate: json['tripStartDate'],
      tripStartTime: json['tripStartTime'],
      tripEndDate: json['tripEndDate'],
      tripEndTime: json['tripEndTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driverPhoto': driverPhoto,
      'driverName': driverName,
      'driverRating': driverRating,
      'driverTime': driverTime,
      'vehiclePhoto': vehiclePhoto,
      'vehicleModel': vehicleModel,
      'vehicleNumber': vehicleNumber,
      'tripAmount': tripAmount,
      'pickUpLocation': pickUpLocation,
      'dropLocation': dropLocation,
      'tripTime': tripTime,
      'tripDistance': tripDistance,
      'tripOtp': tripOtp,
      'tripId': tripId,
      'tripStartDate': tripStartDate,
      'tripStartTime': tripStartTime,
      'tripEndDate': tripEndDate,
      'tripEndTime': tripEndTime,
    };
  }
}
