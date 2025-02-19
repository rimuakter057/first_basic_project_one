/*

import 'dart:convert';

import 'package:http/http.dart';

import '../models/details_model.dart';

class DetailsApi{
Future <List<DetailsModel>> detailsApi() async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=10");
  Response response =await get(url);
  try {
 if(response.statusCode==200){
   var decodeData=jsonDecode(response.body);
      print(decodeData);
 }else{
   throw Exception("Error");
 }
  }catch(e){
    print(e.toString());
  }

}
}*/
import 'dart:convert'; // For jsonDecode
import 'package:http/http.dart'; // For HTTP requests

import '../models/details_model.dart';

class DetailsApi {
  Future<List<DetailsModel>> detailsApi() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=10");
    try {
      Response response = await get(url);
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body); // Decoding JSON data
        print(decodeData);

        // Convert JSON to List<DetailsModel>
        List<DetailsModel> detailsList = (decodeData as List)
            .map((item) => DetailsModel.fromJson(item))
            .toList();
        return detailsList; // Returning the parsed list
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      return []; // Returning an empty list in case of error
    }
  }
}

