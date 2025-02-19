import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccessful;
  final String? errorMessage;

  NetworkResponse(
      {required this.statusCode,
        required this.isSuccessful,
        this.responseData,
       this.errorMessage});
}

class NetworkCaller {
  static Future <NetworkResponse> getRequest({required String url, Map<String, dynamic>? params})async{
  try  {
    //"https://fakestoreapi.com/products"
      Uri uri = Uri.parse(url);
      debugPrint("uri=> $url");
      Response response = await get(uri);
      debugPrint("status code=> ${response.statusCode}");
      debugPrint("response body=> ${response.body}");
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            responseData: decodedResponse,
            isSuccessful: true);
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccessful: false,
          // errorMessage: response.body
        );
      }
    }catch(e){
    return NetworkResponse(
        statusCode: -1,
        isSuccessful: false,
        errorMessage: e.toString()
    );
  }
  }
}
