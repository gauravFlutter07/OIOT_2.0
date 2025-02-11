class MyFavouritesModel {
  String id;
  String address;
  double lng;
  double lat;
  String label;

  MyFavouritesModel({
    required this.id,
    required this.address,
    required this.lng,
    required this.lat,
    required this.label,
  });

  factory MyFavouritesModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? coords = json['Coords'] as List<dynamic>?;
    return MyFavouritesModel(
      id: json['_id'] ?? '',
      address: json['address'] ?? '',
      lng: (coords != null && coords.isNotEmpty)
          ? (coords[0] ?? 0.0).toDouble()
          : 0.0,
      lat: (coords != null && coords.length > 1)
          ? (coords[1] ?? 0.0).toDouble()
          : 0.0,
      label: json['label'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'address': address,
      'Coords': [lng, lat],
      'label': label,
    };
  }
}
