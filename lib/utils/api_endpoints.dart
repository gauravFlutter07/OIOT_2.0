class ApiEndPoints {
  static Dev dev = Dev();
  static Prod prod = Prod();
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class Dev {
  String baseUrl = "";
}

class Prod {
  String baseUrl = "";
}

class AuthEndPoints {
  String login = "/login";
  String registerAdmin = "/registerAdmin";
}
