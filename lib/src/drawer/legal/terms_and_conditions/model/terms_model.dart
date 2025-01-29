class TermsAndConditionsModel {
  final String content;
  final DateTime acceptedDateTime;
  final String acceptedLocation;

  TermsAndConditionsModel({
    required this.content,
    required this.acceptedDateTime,
    required this.acceptedLocation,
  });

  factory TermsAndConditionsModel.fromJson(Map<String, dynamic> json) {
    return TermsAndConditionsModel(
      content: json['content'] ?? '',
      acceptedDateTime: DateTime.parse(json['acceptedDateTime'] ?? ''),
      acceptedLocation: json['acceptedLocation'] ?? '',
    );
  }
}
