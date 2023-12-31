import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:task_managet/data/models/network_response.dart';


class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async{
    //Map<String, dynamic>? decodedResponse;
    try{
      Response response = await get(Uri.parse(url));
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
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
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


}