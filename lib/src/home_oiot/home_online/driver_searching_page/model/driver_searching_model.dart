class DriverSearchingModel {
  final String driverId;
  final String driverPhoto;
  final String driverName;
  final double driverRating;
  final String driverTimeAway;
  final String vehicleModel;
  final String vehiclePhoto;
  final String vehicleNumber;
  final String discount;
  final String driverCharge;

  DriverSearchingModel({
    required this.driverId,
    required this.driverPhoto,
    required this.driverName,
    required this.driverRating,
    required this.driverTimeAway,
    required this.vehicleModel,
    required this.vehiclePhoto,
    required this.vehicleNumber,
    required this.discount,
    required this.driverCharge,
  });

  factory DriverSearchingModel.fromJson(Map<String, dynamic> json) {
    return DriverSearchingModel(
      driverId: json['driverId'],
      driverPhoto: json['driverPhoto'],
      driverName: json['driverName'],
      driverRating: double.parse(json['driverRating']),
      driverTimeAway: json['driverTimeAway'],
      vehicleModel: json['vehicleModel'],
      vehiclePhoto: json['vehiclePhoto'],
      vehicleNumber: json['vehicleNumber'],
      discount: json['discount'],
      driverCharge: json['driverCharge'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driverId': driverId,
      'driverPhoto': driverPhoto,
      'driverName': driverName,
      'driverRating': driverRating.toString(),
      'driverTimeAway': driverTimeAway,
      'vehicleModel': vehicleModel,
      'vehiclePhoto': vehiclePhoto,
      'vehicleNumber': vehicleNumber,
      'discount': discount,
      'driverCharge': driverCharge,
    };
  }
}
