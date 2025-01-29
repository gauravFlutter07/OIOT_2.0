class FaqModel {
  final String heading;
  final String faq;

  FaqModel({
    required this.heading,
    required this.faq,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      heading: json['heading'],
      faq: json['faq'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'heading': heading,
      'faq': faq,
    };
  }
}
