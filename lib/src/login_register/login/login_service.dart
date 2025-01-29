import 'dart:developer';
import '../../../imports.dart';

class LoginService {
  ErrorHandler errorHandler = ErrorHandler();
  Dio dio = Dio();
  Future<Map<String, dynamic>?> postLoginRequest(LoginModel data) async {
    // String apiUrl = 'api/';
    try {
      // Response response = await dio.post(
      //   apiUrl,
      //   data: data.toJson(),
      // );
      int? statusCode;

      if (data.mobile == '8907444333') {
        Fluttertoast.showToast(msg: "Login Successfully");

        statusCode = 200;
      } else {
        statusCode = 400;
      }

      if (statusCode == 200) {
        dynamic userData = {
          "status": true,
          "token": "fjsafjagsfjgasfjasfasjfjsa",
          "userData": {
            "photo":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvhUoP4NjNxzsA4fCoaoxM45ZS5ZVHQE_njQ&s",
            "Name": "Ajeesh",
            "Mobile": "0123456789",
            "Age": "34 years",
            "Gender": "Male",
            "Email": "ajeeshrko@gmail.com",
            "Location": "Bangalore",
            "State": "Karnataka",
            "City": "Bangalore",
            "Aadhar": "5084 6845 1240",
            "DOB": "09/11/1989",
            "ReferralCode": "OIOT36TF635",
            "userRating": "4.3  Since 2019",
          }
        };
        return userData;
      } else {
        String? errorMessage = errorHandler.errorHandlingFunction(statusCode);
        Fluttertoast.showToast(
            msg: errorMessage.toString(), toastLength: Toast.LENGTH_LONG);
        return null;
      }
    } catch (e) {
      log('Error $e');
      return null;
    }
  }
}
