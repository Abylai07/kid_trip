import 'dart:core';
import 'network_call.dart';
import 'package:flutter/material.dart';

class AppData {
  static final AppData _instance = AppData.internal();

  AppData.internal();

  factory AppData() => _instance;

  final NetworkCall _networkCall = NetworkCall();

  //URLS

  //ACCOUNT
  static const String signUp = "auth/public/signup";
  static const String signIn = "auth/public/login";
  static const String me = "/accounts/me/";
  static const String forgot_password = "accounts/forgot_password/";
  static const String set_password = "/accounts/set_password/";
  static const String verify_by_code = "/accounts/verify_by_code/";
  ///METHODS

  Future<dynamic> postRequest({
    dynamic response,
    required BuildContext context,
    required String path,
    required Map<String, dynamic> data,
  }) async {
    dynamic response = await _networkCall.doRequestUnAuth(
      path: path,
      method: 'POST',
      context: context,
      body: data,
    );
    return response;
  }

  Future<dynamic> postRequestAuth({
    dynamic response,
    required BuildContext context,
    required String path,
    required Map<String, dynamic> data,
  }) async {
    dynamic response = await _networkCall.doRequestAuth(
      path: path,
      method: 'POST',
      context: context,
      body: data,
    );
    return response;
  }

  Future<dynamic> getRequest({
    dynamic response,
    required BuildContext context,
    required String path,
  }) async {
    dynamic response = await _networkCall.doRequestAuth(
      path: path,
      method: 'GET',
      context: context,
    );
    return response;
  }


  Future<dynamic> putRequest({
    dynamic response,
    required String path,
    required BuildContext context,
    required Map<String, dynamic> data,
  }) async {
    dynamic response = await _networkCall.doRequestAuth(
      path: path,
      method: 'PUT',
      context: context,
      body: data,
    );
    return response;
  }
}
