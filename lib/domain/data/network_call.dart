import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_colors.dart';
import 'constants.dart';


class NetworkCall {
  // next three lines makes this class a Singleton
  static NetworkCall _instance = NetworkCall.internal();
  NetworkCall.internal();
  factory NetworkCall() => _instance;

  final JsonDecoder _decoder = JsonDecoder();
  var baseUrl = ApiConstants.endpointRest;

  dynamic _decodedRes;
  Future<dynamic> doRequestUnAuth({
    required String path,
    required String method,
    required BuildContext context,
    Map<String, dynamic>? requestParams,
    dynamic body,
    Map<String, dynamic>? data,
  }) async {
    BaseOptions options = BaseOptions(
      // headers: {'Authorization': 'Token $accessToken'},
      baseUrl: baseUrl, //base server url
      method: method,
      contentType: ContentType.parse("application/json").value,
    );

    Dio dio = Dio(options);
    Response response;

    try {
      response = await dio.request(
        path,
        queryParameters: requestParams,
        data: body,
      );

      _decodedRes = _decoder.convert(response.toString());
      return _decodedRes;
    } on DioError catch (error) {
      if (error.response!.statusCode! > 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: AppColors.red,
            content: Text('${error.response?.data['detail']}'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 190.h,
              right: 24.w,
              left: 24.w,
            ),
          ),
        );
      }
      if (path == '/users/devices/') {
        return {"registration_id": "This field must be unique."};
      }
      handleError(error, context);
    }
  }

  Future<dynamic> doRequestAuth({
    required String path,
    required String method,
    required BuildContext context,
    Map<String, dynamic>? requestParams,
    dynamic body,
    Map<String, dynamic>? data,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('token');
    print('Access Token ---- $accessToken');
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      method: method,
      headers: {
        'authorization': 'Bearer $accessToken',
      },
      contentType: 'application/json',
    );

    Dio dio = Dio(options);
    Response response;

    try {
      response = await dio.request(
        path,
        queryParameters: requestParams,
        data: data ?? body,
      );
      return response.data;
    } on DioError catch (error) {
       if (error.response!.statusCode! > 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: AppColors.red,
            content: Text(
                '${error.response?.data['detail']}'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 170.h,
              right: 24.w,
              left: 24.w,
            ),
          ),
        );
      }
      if (path == '/users/devices/') {
        return {"registration_id": "This field must be unique."};
      }
      handleError(error, context);
    }
  }

  /// handling available cases from server and show to users
  Future<void> handleError(DioError error, BuildContext context) async {
    String? errorDescription;
    Map<String, dynamic>? errorResponse;

    if (error.response!.data is String) {
      if (!error.response!.data.toString().contains("html>")) {
        var err = json.decode(error.response!.data);
        errorResponse = err as Map<String, dynamic>;
      } else {}
    } else {
      errorResponse = error.response!.data as Map<String, dynamic>;
    }

    log("${error.response!.data}");

    if (error == DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          errorDescription = 'Запрос был отменен';
          log(errorDescription);

          break;
        case DioErrorType.connectTimeout:
          errorDescription = 'Попробуйте позже или перезагрузите';
          log(errorDescription);

          break;
        case DioErrorType.other:
          errorDescription = 'Проблемы с интернетом!';
          log(errorDescription);

          break;
        case DioErrorType.receiveTimeout:
          errorDescription = 'Время ожидание ответа сервера истекло';
          log(errorDescription);

          break;
        case DioErrorType.response:
          if (errorResponse == null) {
            errorDescription = "Ошибка сервера!";
          } else {
            if (errorResponse.containsKey('message')) {
              errorDescription = errorResponse['message'];
            } else {
              errorDescription = "Ошибка сервера!";
            }
          }

          log(errorDescription!);
          break;
        case DioErrorType.sendTimeout:
          errorDescription = 'Время соединения истекло';
          log(errorDescription);
          break;
      }
    }
  }
}
