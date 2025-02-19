
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../../../models/ecommerce_model.dart';
class ECommercePage extends StatefulWidget {
  const ECommercePage({super.key});

  @override
  State<ECommercePage> createState() => _ECommercePageState();
}

class _ECommercePageState extends State<ECommercePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(future: ecommerceData(),
              builder: (context, snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
                ),
              );
            }else{
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                return ListTile(
                 title: Text(snapshot.data![index].title.toString()),
                  subtitle: Text(snapshot.data![index].price.toString()),

                );
              });
            }
              }))
        ],
      ),
    );
  }
  Future<List<EcommerceModel>> ecommerceData()async{
    List <EcommerceModel> ecommerceList = [];
    final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode == 200){
      var decodedData=jsonDecode(response.body.toString());
      for (Map i in decodedData){
        ecommerceList.add(EcommerceModel.fromJson(i as Map<String,dynamic>));
      }
      return ecommerceList;
    }else {
      return ecommerceList;
    }
  }
}
