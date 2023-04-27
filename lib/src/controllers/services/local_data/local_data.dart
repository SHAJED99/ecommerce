import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData extends GetxController {
  SharedPreferences? _sharedPreferences;

  Future<String> initData() async {
    if (kDebugMode) print("LocalData: Loading local user data.");
    _sharedPreferences = await SharedPreferences.getInstance();
    String token = _sharedPreferences?.getString("token") ?? "";
    if (kDebugMode) print("LocalData: token = $token");
    return token;
  }

  setToken(String token) {
    _sharedPreferences?.setString("token", token);
  }

  deleteUserData() {
    if (kDebugMode) print("LocalData: Local user data has been reset.");
    _sharedPreferences?.setString("token", "");
  }
}
