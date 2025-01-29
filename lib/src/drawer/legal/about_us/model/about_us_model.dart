class AboutUsDataModel {
  final String title;
  final String description;
  final String vision;
  final List<String> values;
  final ContactInfo contact;

  AboutUsDataModel({
    required this.title,
    required this.description,
    required this.vision,
    required this.values,
    required this.contact,
  });

  factory AboutUsDataModel.fromJson(Map<String, dynamic> json) {
    return AboutUsDataModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      vision: json['vision'] ?? '',
      values: List<String>.from(json['values'] ?? []),
      contact: ContactInfo.fromJson(json['contact'] ?? {}),
    );
  }
}

class ContactInfo {
  final String email;
  final String phone;
  final String address;

  ContactInfo({
    required this.email,
    required this.phone,
    required this.address,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
