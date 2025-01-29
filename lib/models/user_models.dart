class UserModel {
  final String? _firstName;
  final String? _lastName;
  final DateTime? _lastLogin;

  UserModel(this._firstName, this._lastName, this._lastLogin);

  Map<String, dynamic> toJson() => {
        'firstName': _firstName,
        'lastName': _lastName,
        'lastLogin': _lastLogin?.toIso8601String(),
      };

  UserModel.fromJson(Map<String, dynamic> json)
      : _firstName = json['firstName'],
        _lastName = json['lastName'],
        _lastLogin = json['lastLogin'];
}
