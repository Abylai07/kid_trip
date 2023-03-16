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
  static const String sign_up = "accounts/";
  static const String sign_in = "accounts/login/";
  static const String me = "/accounts/me/";
  static const String forgot_password = "accounts/forgot_password/";
  static const String set_password = "/accounts/set_password/";
  static const String verify_by_code = "/accounts/verify_by_code/";

  //PRODUCTS
  static const String products = "products/";

  //MODULES
  static const String allModules = "modules/";
  static const String modules = "get_modules/";

  //COURSES
  static const String all_courses = "courses/";
  static const String courses = "get_courses/";

  //LESSONS
  static const String lessons = "lessons/";
  static const String get_lessons = "get_lessons/";
  static const String get_videos = "get_videos/";

  // FEEDBACK
  static const String feedbacks = "feedbacks/";

  // QUESTIONNAIRES
  static const String questionnaires = "questionnaires/";
  static const String get_questionnaires = "get_questionnaires/";
  static const String questionnaires_results = "questionnaires_results/";
  static const String set_results = "set_results/";

  //SALES
  static const String basket = "basket/create_purchase/";
  static const String sales = "sales/";
  static const String get_purchase_history = "get_purchase_history/";

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
