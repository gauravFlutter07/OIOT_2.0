

import 'dart:developer';

import 'package:oiot/api/api_end_url.dart';
import 'package:oiot/imports.dart';
import 'package:oiot/main.dart';

class RiderRepo{

  static Future<dynamic> createRider(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.createRider}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> login(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.ridersLogin}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> verifyNumber(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.verifyNumber}";
    final response =  apiHelper.post(url, body);
    return response;
  }

 static Future<dynamic> forgotPassword(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.forgotPassword}";
    final response =  apiHelper.post(url, body);
    return response;
  }

 static Future<dynamic> resetPassword(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.forgotPassword}";
    final response =  apiHelper.patch(url, body);
    return response;
  }

  static Future<dynamic> uploadProfilePicture(file, fileType) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.uploadProfilePicture   }";
    final response = apiHelper.multipartPut(url, file,fileType,);
    return response;
    }

  static Future<dynamic> getStates(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.getStates}";
    final response =  apiHelper.get(url, body);
    return response;
  }

  static Future<dynamic> getCity(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.getCity}/$body";
    final response =  apiHelper.get(url, null);
    return response;
  }


  static Future<dynamic> updateProfile(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.updateProfile}";
    final response =  apiHelper.put(url, body);
    return response;
  }

  static Future<dynamic> fetchProfile(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.updateProfile}";
    final response =  apiHelper.get(url, body);
    return response;
  }

  static Future<dynamic> serviceBasicFare(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.serviceBasicFare}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> applyPromoCode(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.applyPromoCode}";
    final response =  apiHelper.put(url, body);
    return response;
  }

  static Future<dynamic> getPastTripHistory(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.riderTripHistory}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> estimationFare(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.estimationFare}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> scheduledTaxi(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.scheduledTaxi}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> searchDrivers(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.searchDrivers}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> getOutstationTaxi(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.outstationTaxi}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> bookOutstationTaxi(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.bookOutstationTaxi}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> submitSupport(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.submitSupport}";
    final response =  apiHelper.multipartPost(url, body );
    return response;
  }

  static Future<dynamic> requestTaxi(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.requestTaxi}";
    final response =  apiHelper.post(url, body );
    return response;
  }

  static Future<dynamic> cancelTaxi(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.cancelTaxi}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> packageList(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.packageList}";
    final response =  apiHelper.post(url, body );
    return response;
  }

  static Future<dynamic> rentalVehicle(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.rentalVehicle}";
    final response =  apiHelper.post(url, body );
    return response;
  }

  static Future<dynamic> requestRentalTaxi(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.requestRentalTaxi}";
    final response =  apiHelper.post(url, body );
    return response;
  }

  static Future<dynamic> scheduledTaxiRider(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.scheduledTaxiRider}";
    final response =  apiHelper.post(url, body );
    return response;
  }

  // get favourites api hit
  static Future<dynamic> fetchFavourites(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.ridersAddress}";
    final response = apiHelper.get(url, body);
    return response;
  }

  // delete favourites api hit
  static Future<dynamic> deleteFavourite(String id, body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.ridersAddressDelete}/${id}";
    final response = apiHelper.delete(url, body: body);
    return response;
  }

  //post add fav api
  static Future<dynamic> addMyFav(body) async {
    final url = "${ApiEndUrl.baseUrl}${ApiEndUrl.ridersAddress}";
    final response = apiHelper.post(url, body);
    return response;
  }

  //get legal data
  static Future<dynamic> fetchLegalData(body) async {
    final url = ApiEndUrl.legalData;
    final response = apiHelper.get(url, body);
    return response;
  }
}