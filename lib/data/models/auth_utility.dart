import 'dart:convert';

import 'package:task_managet/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtility {
  AuthUtility._();  /// Single Tone Object Creator, we have to use "static" key word
  /// in front of our method or function

  static Future<void> saveUserInfo(LoginModel model) async{
    SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
    //_shairedPrefs.setDouble('user-data', model.toJson().toString() as double);
    await _shairedPrefs.setString('user-data', model.toJson().toString());
  }

  static Future<LoginModel> getUserInfo(LoginModel model) async{
    SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
    String value  = _shairedPrefs.getString('user-data')!;
    //LoginModel model = LoginModel.fromJson(jsonDecode(value));
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> clearUserInfo() async{
    SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
    await _shairedPrefs.clear();
  }

  static Future<bool> checkIfUserLoggedIn() async{
    SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
    return await _shairedPrefs.containsKey('user-data');
  }


}