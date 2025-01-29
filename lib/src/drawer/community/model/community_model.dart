class CommunityModel {
  Map<String, Map<String, dynamic>> dropdowns;

  CommunityModel({required this.dropdowns});

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      dropdowns: json.map((key, value) {
        return MapEntry(key, {
          "imageUrl": value['imageUrl'],
          "items": List<String>.from(value['items']),
        });
      }),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      for (var entry in dropdowns.entries)
        entry.key: {
          "imageUrl": entry.value['imageUrl'],
          "items": entry.value['items']
        }
    };
  }
}
