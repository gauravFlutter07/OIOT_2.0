
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../main.dart';
import 'app_exception.dart';

final PrettyDioLogger _log = PrettyDioLogger();

class ApiBaseHelper {
  // final String _baseUrl = BASE_URL;

  static final dio = Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        request: true));
    // ..interceptors.add(DioFirebasePerformanceInterceptor());



  Future<dynamic> get(String url, dynamic param, {dynamic header}) async {
    _log.logPrint('Api Get, url $url');

    var responseJson;
    try {
      // dio.interceptors.clear();
      // dio.interceptors.add(LogInterceptor(responseBody: false));

      // updateDataSource(url);


     if(param != null) _log.logPrint(param);
      log("Param:- $param");
      final response = await dio.get(Uri.parse(url).toString(),
          queryParameters: param, options: options().copyWith(
              headers: {
                "x-access-token": localStorageService.token
              }

          ));
      responseJson = _returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('Error caught: ${e.response}');
        var errorResponse = _decodeErrorResponse(e);
        return BadRequestException('Bad Request');

        // responseJson =
        //     ErrorException(errorResponse['message'], errorResponse['code']);
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        _log.logPrint('check your connection');
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        _log.logPrint('unable to connect to the server');
        return;
      }
      if (e.type == DioExceptionType.unknown) {
        _log.logPrint('Something went wrong');
        return;
      }
      if (kDebugMode) {
        _log.logPrint('Error: ${e.message}');
      }
    } on SocketException {
      return FetchDataException('No Internet connection');
    } on TimeoutException {
      return RequestTimeoutException('Timeout');
    }

    return responseJson;
  }

  Future<dynamic> download(
      String url,
      ) async {
    _log.logPrint('Api download, url $url');

    var responseJson;
    try {
      // dio.interceptors.clear();
      // dio.interceptors.add(LogInterceptor(responseBody: false));

      // updateDataSource(url);

      final response =
      await dio.download(Uri.parse(url).toString(), "AppConstants.savePath");
      responseJson = _returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('Error caught: ${e.response}');
        var errorResponse = _decodeErrorResponse(e);
        responseJson =
            ErrorException(errorResponse['message'], errorResponse['code']);
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        _log.logPrint('check your connection');
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        _log.logPrint('unable to connect to the server');
        return;
      }
      if (e.type == DioExceptionType.unknown) {
        _log.logPrint('Something went wrong');
        return;
      }
      if (kDebugMode) {
        _log.logPrint('Error: ${e.message}');
      }
    } on SocketException {
      return FetchDataException('No Internet connection');
    } on TimeoutException {
      return RequestTimeoutException('Timeout');
    }

    return responseJson;
  }

  Future<String> download2(String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      _log.logPrint(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();

      return raf.path;
    } catch (e) {
      _log.logPrint(e);
      return "";
    }
  }

  Options options() {
    var userId = -1;


    return Options(responseType: ResponseType.plain, headers: {
      // 'Authorization': 'bearer ${Storage.getToken()}',
      // 'Authorization': 'bearer eyJhbGciOiJBMjU2S1ciLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiemlwIjoiREVGIn0.yq-wQLVHtS9y_Dbmefudz6BaSh-agYnGRgMP2m51nzO1lJ5idCLgY7BqZH1yHgQ2EpgZCHuBOjDgxSzsgAtvLix-V2HZxIei.Iih_usd_WsCM-x9B8uZ6HQ.viZiMIK7LcwJKh12_DZ5xpraoM6kvM7Il6B1I5ussAJoNaXceOwN0Fqh_oYtImnU3lu2TROHAEO9yLkUjtbzq0YAy5nfk_JeSXpE8jnSdsDznrHtd7SbVn6yxLnUCYmgfxM_zr9-dWXL9gkYbw5UlzRZDod-SXFGx7OQYTXxi14.FgT5jRxWz7yXFkmAPQrYaw3K8MF_UT0PQ_T4qyZtMSE',
      'Content-Type': 'application/json; charset=utf-8',
      // 'Time-Zone': '${AppConstants.currentTimeZone}',
      // 'X-Data-Source': describeEnum(AppConstants.dataServer as Object),
      'accept': 'application/json',
      "x-access-token": localStorageService.token
      // 'X-BRANCH': AppConstants.apiBranch,
      // 'X-Environment': 'dev', // dev/stage/prod
      // 'user-agent': 'Mobile/${AppConstants.appBuildNumber}',
      // 'user-id': '$userId',
    });
    // return options;
  }

  Future<dynamic> post(String url, dynamic body, {dynamic header, dynamic param}) async {
    var responseJson;
    try {
      if (kDebugMode) {
        _log.logPrint('Url $url');
      }
      dio.interceptors.clear();
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));

      // updateDataSource(url);

      final response = await dio.post(Uri.parse(url).toString(),
          queryParameters: param,
          data: body, options: options().copyWith(
              headers: {
                "x-access-token": localStorageService.token
              }
          ));

      responseJson = _returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('Error caught: ${e.response}');
        var errorResponse = _decodeErrorResponse(e);
        responseJson =
            ErrorException(errorResponse['message'], errorResponse['code']);
        return responseJson;
      }

      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('check your connection');
        return;
      }

      if (e.type == DioExceptionType.receiveTimeout) {
        _log.logPrint('unable to connect to the server');
        return;
      }

      if (e.type == DioExceptionType.unknown) {
        _log.logPrint('Something went wrong');
        return;
      }
    } on SocketException {
      return FetchDataException('No Internet connection');
    } on TimeoutException {
      return RequestTimeoutException('Timeout');
    }
    return responseJson;
  }

  Future<dynamic> patch(String url, dynamic body, {dynamic header, dynamic param}) async {
    var responseJson;
    try {
      if (kDebugMode) {
        _log.logPrint('Url $url');
      }
      dio.interceptors.clear();
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));

      // updateDataSource(url);

      final response = await dio.patch(Uri.parse(url).toString(),
          queryParameters: param,
          data: body, options: options());

      responseJson = _returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('Error caught: ${e.response}');
        var errorResponse = _decodeErrorResponse(e);
        responseJson =
            ErrorException(errorResponse['message'], errorResponse['code']);
        return responseJson;
      }

      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('check your connection');
        return;
      }

      if (e.type == DioExceptionType.receiveTimeout) {
        _log.logPrint('unable to connect to the server');
        return;
      }

      if (e.type == DioExceptionType.unknown) {
        _log.logPrint('Something went wrong');
        return;
      }
    } on SocketException {
      return FetchDataException('No Internet connection');
    } on TimeoutException {
      return RequestTimeoutException('Timeout');
    }
    return responseJson;
  }

  void updateDataSource(String url) {
    /*if (url.isCaseInsensitiveContainsAny(EndPoints.geoFencing) ||
        (url.isCaseInsensitiveContainsAny(EndPoints.geoVisiting)) ||
        (url.isCaseInsensitiveContainsAny(EndPoints.updateLocation))) {
      //  TODO: send only test data to here for QA only
      AppConstants.dataServer = DataServer.test;
    } else {
      AppConstants.dataServer = DataServer.live;
    }*/
  }

  Future<dynamic> put(String url, dynamic body) async {
    _log.logPrint('Api Put, url $url');
    var responseJson;
    try {
      dio.interceptors.clear();
      dio.interceptors.add(LogInterceptor(responseBody: false));

      final response = await dio.put(Uri.parse(url).toString(),
          options: options().copyWith(
              headers: {
                "x-access-token": localStorageService.token
              }
          ),
        data: body
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      _log.logPrint('No net');
      throw FetchDataException('No Internet connection');
    }
    _log.logPrint('api put.');
    _log.logPrint(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url,
      {dynamic header, dynamic body, dynamic param}) async {
    _log.logPrint('Api delete, url $url');
    var responseJson;
    try {
      dio.interceptors.clear();
      dio.interceptors.add(LogInterceptor(responseBody: false));
      final response = await dio.delete(Uri.parse(url).toString(),
          data: body, queryParameters: param, options: options());
      responseJson = _returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('Error caught: ${e.response}');
        var errorResponse = _decodeErrorResponse(e);
        responseJson =
            ErrorException(errorResponse['message'], errorResponse['code']);
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        _log.logPrint('check your connection');
        return;
      }

      if (e.type == DioExceptionType.receiveTimeout) {
        _log.logPrint('unable to connect to the server');
        return;
      }

      if (e.type == DioExceptionType.unknown) {
        _log.logPrint('Something went wrong');
        return;
      }
      _log.logPrint('Error: ${e.message}');
    } on SocketException {
      return FetchDataException('No Internet connection');
    } on TimeoutException {
      return RequestTimeoutException('Timeout');
    }

    return responseJson;
  }

  Future<dynamic> multipartPost(String url, dynamic formData,
      {dynamic header}) async {
    var responseJson;
    try {
      if (kDebugMode) {
        _log.logPrint('Url $url');
      }
      // dio.interceptors.clear();
      // dio.interceptors.add(LogInterceptor(responseBody: true,requestBody: true));

      // file
/*
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
        "type": type
      });*/

      // updateDataSource(url);

      final response = await dio.post(Uri.parse(url).toString(),
          data: formData, options: options());

      responseJson = _returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('Error caught: ${e.response}');
        var errorResponse = _decodeErrorResponse(e);
        responseJson =
            ErrorException(errorResponse['message'], errorResponse['code']);
        return responseJson;
      }

      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('check your connection');
        return;
      }

      if (e.type == DioExceptionType.receiveTimeout) {
        _log.logPrint('unable to connect to the server');
        return;
      }

      if (e.type == DioExceptionType.unknown) {
        _log.logPrint('Something went wrong');
        return;
      }
    } on SocketException {
      return FetchDataException('No Internet connection');
    } on TimeoutException {
      return RequestTimeoutException('Timeout');
    }
    return responseJson;
  }


  Future<dynamic> multipartPut(String url, File file, String type,
      {dynamic header}) async {
    var responseJson;
    try {
      if (kDebugMode) {
        _log.logPrint('Url $url');
      }
      // dio.interceptors.clear();
      // dio.interceptors.add(LogInterceptor(responseBody: true,requestBody: true));

      // file

      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
        "type": type
      });

      // updateDataSource(url);

      final response = await dio.put(Uri.parse(url).toString(),
          data: formData, options: options().copyWith(
              headers: {
                "x-access-token": localStorageService.token
              }          ));

      responseJson = _returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('Error caught: ${e.response}');
        var errorResponse = _decodeErrorResponse(e);
        responseJson =
            ErrorException(errorResponse['message'], errorResponse['code']);
        return responseJson;
      }

      if (e.type == DioExceptionType.badResponse) {
        _log.logPrint('check your connection');
        return;
      }

      if (e.type == DioExceptionType.receiveTimeout) {
        _log.logPrint('unable to connect to the server');
        return;
      }

      if (e.type == DioExceptionType.unknown) {
        _log.logPrint('Something went wrong');
        return;
      }
    } on SocketException {
      return FetchDataException('No Internet connection');
    } on TimeoutException {
      return RequestTimeoutException('Timeout');
    }
    return responseJson;
  }
}

dynamic _returnResponse(Response response) {
  log("Status Data: ${response.data}");
  log("Status Code: ${response.statusCode}");
  switch (response.statusCode) {
    case 200:
      var responseJson = GetUtils.isNullOrBlank(response.data)! ? response.data ?? "" : jsonDecode(response.data.toString());
      return responseJson;
    case 400:
      return BadRequestException(response.data.toString());
    case 401:
      return UnauthorisedException(response.data.toString());
    case 408:
      return RequestTimeoutException();
    case 403:
    // return SessionExpiredModel();
      return UnauthorisedException(response.data.toString());
    case 429:
      return RequestTimeoutException();
  // return ErrorResponse(code: 'MOBILE_VALIDATION',message: 'We require your mobile number as part of the registration process.');
    case 500:
      var responseJson = json.decode(response.data.toString());
      _log.logPrint(responseJson);
      // return ErrorResponse.fromJson(responseJson);
      return RequestTimeoutException();
    case 502:
      return BadRequestException(response.data.toString());
    default:
      _log.logPrint("GOt response:-${response.data}");
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

dynamic _decodeErrorResponse(dynamic e) {
  dynamic data = {"code": "", "message": "Unknown Error"};
  if (e is DioException) {
    if (e.type == DioExceptionType.badResponse) {
      final response = e.response;
      try {
        if (response != null && response.data != null) {
          final responseData = jsonDecode(response.data);
          data["message"] = responseData['message'];
          data["code"] = responseData['code'] ?? '00';
        }

        // token expired or irrelevant login found
        if (e.response?.statusCode == 401) {

        }
      } catch (e) {
        data["message"] = "Internal Error Catch";
        _log.logPrint("Error catch got: $e");
        return BadRequestException('Internal Error Catch');
      }
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      data["message"] = "Request timeout";
      data["code"] = 408.toString();
    } else if (e.error is SocketException) {
      data["message"] = "No Internet Connection!";
    }
  }
  return data;
}

// 1