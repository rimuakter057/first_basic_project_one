import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:first_project/models/get_model.dart';
import 'package:flutter/material.dart';

class GetDataPage extends StatefulWidget {
  const GetDataPage({super.key});

  @override
  State<GetDataPage> createState() => _GetDataPageState();
}

class _GetDataPageState extends State<GetDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(future: getData(),
              builder: (context, snapshot){
            if (!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }else{
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                return ListTile(
                  subtitle: Text(snapshot.data![index].userId.toString()),
                //  title: snapshot.data![index].id != null ? Text(snapshot.data![index].id.toString()):Text(""),
                );

              }
              );
            }
              }))
        ],
      ),
    );
  }
 Future<List<GetModel>> getData()async{
    List <GetModel> getModelList = [];
    final response =await http.get(Uri.parse("https://fakestoreapi.com/carts?userId=1"));
    if(response.statusCode == 200){
      var decodedData=jsonDecode(response.body.toString());
      for (Map i in decodedData){
      getModelList.add(GetModel.fromJson(i as Map<String, dynamic>));
      }return getModelList;
    }else{
      return getModelList;
    }
 }
}
