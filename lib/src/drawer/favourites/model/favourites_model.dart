class FavouriteItemModel {
  final String category;
  final String location;

  FavouriteItemModel({
    required this.category,
    required this.location,
  });

  factory FavouriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavouriteItemModel(
      category: json['category'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'location': location,
    };
  }
}
