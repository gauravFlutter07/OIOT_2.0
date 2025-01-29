


class AppException implements Exception {
  final message;
  String? code;
  final _prefix;

  AppException([this.message, this._prefix, this.code]);

  @override
  String toString() {
    return "$_prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([ String? message])
      : super(message, "Error During Communication: ");
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([  String? message])
      : super(message, "Request Timeout:");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Error: ");
}

class UnauthorisedException extends AppException {
  // UnauthorisedException([message]) : super(message, "Unauthorised: ");
  UnauthorisedException([message]) : super('The Token has Expired', "");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Error: ");
}

class ErrorException extends AppException {
  ErrorException([String? message,String?code]) : super(message, "Error: ",code);
}