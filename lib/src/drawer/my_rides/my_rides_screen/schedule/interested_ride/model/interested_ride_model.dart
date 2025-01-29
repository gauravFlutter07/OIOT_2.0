class InterestedDriverModel {
  String driverName;
  String mobileNumber;
  String carModel;
  double rating;
  String price;
  String drivePhoto;

  InterestedDriverModel({
    required this.driverName,
    required this.mobileNumber,
    required this.rating,
    required this.price,
    required this.carModel,
    required this.drivePhoto,
  });

  factory InterestedDriverModel.fromJson(Map<String, dynamic> json) {
    return InterestedDriverModel(
      driverName: json['driverName'],
      mobileNumber: json['mobileNumber'],
      carModel: json['carModel'],
      rating: json['rating'].toDouble(),
      price: json['price'],
      drivePhoto: json['drivePhoto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driverName': driverName,
      'mobileNumber': mobileNumber,
      'carModel': carModel,
      'rating': rating,
      'price': price,
      'drivePhoto': drivePhoto,
    };
  }
}
