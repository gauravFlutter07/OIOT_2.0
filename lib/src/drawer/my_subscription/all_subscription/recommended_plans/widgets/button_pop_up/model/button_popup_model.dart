class ButtonPopUpDataModel {
  final String validity;
  final String popUpAmount;
  final String benefit1;
  final String benefit2;
  final String benefit3;
  final String benefit4;
  final String benefit5;

  ButtonPopUpDataModel({
    required this.validity,
    required this.popUpAmount,
    required this.benefit1,
    required this.benefit2,
    required this.benefit3,
    required this.benefit4,
    required this.benefit5,
  });

  factory ButtonPopUpDataModel.fromJson(Map<String, dynamic> json) {
    return ButtonPopUpDataModel(
      validity: json['validity'],
      popUpAmount: json['popUpAmount'],
      benefit1: json['benefit1'],
      benefit2: json['benefit2'],
      benefit3: json['benefit3'],
      benefit4: json['benefit4'],
      benefit5: json['benefit5'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'validity': validity,
      'popUpAmount': popUpAmount,
      'benefit1': benefit1,
      'benefit2': benefit2,
      'benefit3': benefit3,
      'benefit4': benefit4,
      'benefit5': benefit5,
    };
  }
}
