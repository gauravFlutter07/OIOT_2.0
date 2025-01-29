class ReferFriendsModel {
  final String code;

  ReferFriendsModel({
    required this.code,
  });

  factory ReferFriendsModel.fromJson(Map<String, dynamic> json) {
    return ReferFriendsModel(
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}
