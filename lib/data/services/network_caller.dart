import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:task_managet/app.dart';
import 'package:task_managet/data/models/auth_utility.dart';
import 'package:task_managet/data/models/network_response.dart';
import 'package:flutter/material.dart';
import 'package:task_managet/ui/screens/auth/login_screen.dart';


class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async{
    //Map<String, dynamic>? decodedResponse;
    try{
      Response response = await get(Uri.parse(url), headers: {
        'token': AuthUtility.userInfo.token.toString(),
      });
      log(response.statusCode.toString());
      log('massage 111 : ${response.statusCode}');
      log(response.body);
      if (response.statusCode == 200) {
        //decodedResponse = jsonDecode(response.body);
        //final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
      } else {
        //todo - handle other response code - 401,400, 500
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());      ///*** Replace of print method
    }
    return NetworkResponse(false, -1, null);

    //return decodedResponse;
    // finally {
    //   return decodedResponse;
    // }
  }
  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body) async{
    //Map<String, dynamic>? decodedResponse;
    try{
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthUtility.userInfo.token.toString(),
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        //decodedResponse = jsonDecode(response.body);
        //final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
      }
      else if (response.statusCode == 401) {
        gotoLogin();
      }
      else {
        //todo - handle other response code - 401,400, 500
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());      ///*** Replace of print method
    }
    return NetworkResponse(false, -1, null);

    //return decodedResponse;
    // finally {
    //   return decodedResponse;
    // }
  }

  Future<void> gotoLogin() async{
    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);  ///*** Old code, Error context not found
    await AuthUtility.clearUserInfo();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }

}