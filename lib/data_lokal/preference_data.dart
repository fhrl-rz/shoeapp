import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeapp/res/res_login.dart';

import '../data_global.dart';

class SavePreference {
  Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_save', jsonEncode(dataGlobal.user));
  }

  Future<User?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user_save') != null) {
      return User.fromJson(jsonDecode(prefs.getString('user_save') ?? ""));
    }
  }

  Future<void>  clearAll()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}