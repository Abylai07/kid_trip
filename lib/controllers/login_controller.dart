import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kid_trip/utils/api_endpoints.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../ui/navigation/navigation.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);
      Map body = {
        'email' : emailController.text.trim(),
        'password' : passwordController.text,
      };

      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        if(json['code'] == 0){
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences prefs = await _prefs;

          await prefs.setString('token', token);
          emailController.clear();
          passwordController.clear();

          Get.off(Navigation());
        } else if(json['code'] == 1){
          throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occurred';
        }
      } else {
        throw jsonDecode(response.body)['Message'] ?? 'Unknown Error Occurred';
      }
    } catch(e){
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20.0),
              children: [
                Text(e.toString()),
              ],
            );
          });
    }
  }
}