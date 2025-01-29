class PastTripModel {
  final String tripId;
  final String serviceType;
  final String vehicleType;
  final String driverPhoto;
  final String driverName;
  final String vehicleNumber;
  final String vehicleModel;
  final String tripAmount;
  final String tripDate;
  final String tripTime;
  final String tripStatus;
  final String tripCancelledReason;
  final String pickUpLocation;
  final String dropLocation;
  final String convenientCharges;
  final String discount;
  final String gst;
  final String sgst;

  PastTripModel({
    required this.tripId,
    required this.serviceType,
    required this.vehicleType,
    required this.driverPhoto,
    required this.driverName,
    required this.vehicleNumber,
    required this.vehicleModel,
    required this.tripAmount,
    required this.tripDate,
    required this.tripTime,
    required this.tripStatus,
    required this.tripCancelledReason,
    required this.pickUpLocation,
    required this.dropLocation,
    required this.convenientCharges,
    required this.discount,
    required this.gst,
    required this.sgst,
  });

  factory PastTripModel.fromJson(Map<String, dynamic> json) {
    return PastTripModel(
      tripId: json['tripId'],
      serviceType: json['serviceType'],
      vehicleType: json['vehicleType'],
      driverPhoto: json['driverPhoto'],
      driverName: json['driverName'],
      vehicleNumber: json['vehicleNumber'],
      vehicleModel: json['vehicleModel'],
      tripAmount: json['tripAmount'],
      tripDate: json['tripDate'],
      tripTime: json['tripTime'],
      tripStatus: json['tripStatus'],
      tripCancelledReason: json['tripCancelledReason'],
      pickUpLocation: json['pickUpLocation'],
      dropLocation: json['dropLocation'],
      convenientCharges: json['convenientCharges'],
      discount: json['discount'],
      gst: json['gst'],
      sgst: json['sgst'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'serviceType': serviceType,
      'vehicleType': vehicleType,
      'driverPhoto': driverPhoto,
      'driverName': driverName,
      'vehicleNumber': vehicleNumber,
      'vehicleModel': vehicleModel,
      'tripAmount': tripAmount,
      'tripDate': tripDate,
      'tripTime': tripTime,
      'tripStatus': tripStatus,
      'tripCancelledReason': tripCancelledReason,
      'pickUpLocation': pickUpLocation,
      'dropLocation': dropLocation,
      'convenientCharges': convenientCharges,
      'discount': discount,
      'gst': gst,
      'sgst': sgst,
    };
  }
}
