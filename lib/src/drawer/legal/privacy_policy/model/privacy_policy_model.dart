class PrivacyPolicyModel {
  final String lastUpdate;
  final String content;

  PrivacyPolicyModel({
    required this.lastUpdate,
    required this.content,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
      lastUpdate: json['lastUpdate'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
