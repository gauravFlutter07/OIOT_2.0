class ErrorHandler {
  String? errorHandlingFunction(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'The server could not understand the request due to invalid syntax. Please check your input and try again.';
      case 401:
        return 'You are not authorized to access this resource. Please log in and try again.';
      case 403:
        return 'You do not have permission to access this resource. Please check your permissions or contact support.';
      case 404:
        return 'The requested resource could not be found. Please check the URL and try again.';
      case 405:
        return 'The request method is not supported for the requested resource. Please check the request method and try again.';
      case 408:
        return 'The server timed out waiting for the request. Please try again later.';
      case 429:
        return 'You have made too many requests in a short period of time. Please wait and try again later.';
      case 500:
        return 'The server encountered an internal error. Please try again later.';
      case 502:
        return 'The server received an invalid response from the upstream server. Please try again later.';
      case 503:
        return 'The server is currently unavailable. Please try again later.';
      case 504:
        return 'The server did not receive a timely response from the upstream server. Please try again later.';
      default:
        return null;
    }
  }
}
