class CarouselImageModel {
  final String imageUrl;

  CarouselImageModel({required this.imageUrl});

  factory CarouselImageModel.fromJson(Map<String, dynamic> json) {
    return CarouselImageModel(
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
      };
}
