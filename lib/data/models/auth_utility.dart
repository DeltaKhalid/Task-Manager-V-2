import 'dart:convert';

import 'package:task_managet/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtility {
  AuthUtility._();  /// Single Tone Object Creator, we have to use "static" key word in front of our method or function
  static LoginModel userInfo = LoginModel();


  static Future<void> saveUserInfo(LoginModel model) async{
    SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
    //_shairedPrefs.setDouble('user-data', model.toJson().toString() as double);
    //await _shairedPrefs.setString('user-data', model.toJson().toString());
    await _shairedPrefs.setString('user-data', jsonEncode(model.toJson()));
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

  /// old code checkIfUserLoggedIn
  // static Future<bool> checkIfUserLoggedIn() async{
  //   SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
  //   return await _shairedPrefs.containsKey('user-data');
  // }

  static Future<bool> checkIfUserLoggedIn() async{
    SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
    bool isLongin = _shairedPrefs.containsKey('user-data');
    if (isLongin) {
      userInfo = await getUserInfo(userInfo);
    }
    return isLongin;
  }


}