// class PickUpModel {
//   final String pickupLocation;
//   final Map<String, dynamic> pickupLatLng;
//   final String dropLocation;
//   final Map<String, dynamic> dropLatLng;
//   final String userId;
//   final String serviceType;

//   PickUpModel({
//     required this.pickupLocation,
//     required this.dropLocation,
//     required this.userId,
//     required this.serviceType,
//     required this.pickupLatLng,
//     required this.dropLatLng,
//   });

//   factory PickUpModel.fromJson(Map<String, dynamic> json) {
//     return PickUpModel(
//       pickupLocation: json['pickupLocation'],
//       dropLocation: json['dropLocation'],
//       userId: json['userId'],
//       serviceType: json['serviceType'],
//       pickupLatLng: json['pickupLatLng'],
//       dropLatLng: json['dropLatLng'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'pickupLocation': pickupLocation,
//       'dropLocation': dropLocation,
//       'userId': userId,
//       'serviceType': serviceType,
//       'pickupLatLng': pickupLatLng,
//       'dropLatLng': dropLatLng,
//     };
//   }
// }

class PickUpModel {
  String pickUpLocation;
  LocationLatLng pickUpLatLng;
  String dropLocation;
  LocationLatLng dropLatLng;
  String userId;
  String serviceType;

  PickUpModel({
    required this.pickUpLocation,
    required this.pickUpLatLng,
    required this.dropLocation,
    required this.dropLatLng,
    required this.userId,
    required this.serviceType,
  });

  factory PickUpModel.fromJson(Map<String, dynamic> json) {
    return PickUpModel(
      pickUpLocation: json['pickUpLocation'],
      pickUpLatLng: json['pickUpLatLng'],
      dropLocation: json['dropLocation'],
      dropLatLng: json['dropLatLng'],
      userId: json['userId'],
      serviceType: json['serviceType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['pickUpLocation'] = pickUpLocation;
    data['pickUpLatLng'] = pickUpLatLng.toJson();
    data['dropLocation'] = dropLocation;
    data['dropLatLng'] = dropLatLng.toJson();
    data['userId'] = userId;
    data['serviceType'] = serviceType;
    return data;
  }
}

class LocationLatLng {
  String latitude;
  String longitude;

  LocationLatLng({required this.latitude, required this.longitude});

  factory LocationLatLng.fromJson(Map<String, dynamic> json) {
    return LocationLatLng(
      latitude: json['Latitude'],
      longitude: json['Longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Latitude'] = latitude;
    data['Longitude'] = longitude;
    return data;
  }
}
