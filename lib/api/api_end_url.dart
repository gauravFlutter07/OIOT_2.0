class ApiEndUrl {
  static String baseUrl = 'http://4.240.74.40:8080/api/';
  String loginUrl = '/auth/login';
  String meUrl = '/auth/me';
  static const String imageBaseUrl = 'https://stgenttowner.blob.core.windows.net/enttownercontainer/';

  static String createRider = 'riders';
  static String ridersLogin = 'riderslogin';
  static String verifyNumber = 'verifyNumber';
  static String forgotPassword = 'riderForgotPassword';
  static String uploadProfilePicture = 'riderImage';
  static String getStates = 'state/101';
  static String getCity = 'city';
  static String updateProfile = 'rider';
  static String serviceBasicFare = 'all-vehicle/serviceBasicFare';
  static String applyPromoCode = 'validatePromo';
  static String riderTripHistory  = 'riderTripHistory';
  static String estimationFare  = 'estimationFare';
  static String scheduledTaxi  = 'riderUpcomingScheduleTaxi';
  static String searchDrivers  = 'getNearByDriversInApp';
  static String outstationTaxi  = 'rental/outstationVehicleListWithFare';
  static String bookOutstationTaxi  = 'requestOutstationTaxi';
  static String submitSupport  = 'submitTicketInApp';
  static String requestTaxi  = 'requestTaxi';
  static String cancelTaxi  = 'cancelTaxi';
  static String packageList  = 'rental/packageList';
  static String rentalVehicle  = 'rental/fareEstimation';
  static String requestRentalTaxi  = 'requestRentalTaxi';
  static String scheduledTaxiRider  = 'riderUpcomingScheduleTaxi';

  static String ridersAddress = 'ridersAddress'; //get favourites end url
  static String ridersAddressDelete = 'ridersAddress'; //delete favorite end url
  //Legal data url
  static String legalData = 'http://4.240.74.40:8080/adminapi/pages?landingtype=OIOT&_page=1&_limit=10';

  //select interested driver
  static String selectInterestedDriver = "acceptdriverintrest";

  //get interested Driver List
  static String getInterestedDriverList = "intresteddriverlistforrider";

}
