// class CreateAccountModel {
//   final String username;
//   final String email;
//   final String gender;
//   final String mobile;

//   CreateAccountModel({
//     required this.username,
//     required this.email,
//     required this.gender,
//     required this.mobile,
//   });

//   factory CreateAccountModel.fromJson(Map<String, dynamic> json) {
//     return CreateAccountModel(
//       username: json['username'] ?? '',
//       email: json['email'] ?? '',
//       gender: json['gender'] ?? '',
//       mobile: json['lastName'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "username": username,
//       "email": email,
//       "gender": gender,
//       "mobile": mobile,
//     };
//   }
// }
