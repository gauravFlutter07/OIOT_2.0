class HomeScreenServiceModel {
  final String serviceType;
  final String servicePic;
  final bool isActive;

  HomeScreenServiceModel({
    required this.serviceType,
    required this.servicePic,
    required this.isActive,
  });

  factory HomeScreenServiceModel.fromJson(Map<String, dynamic> json) {
    return HomeScreenServiceModel(
      serviceType: json['serviceType'] as String,
      servicePic: json['servicePic'] as String,
      isActive: json['isActive'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'serviceType': serviceType,
        'servicePic': servicePic,
        'isActive': isActive,
      };
}
