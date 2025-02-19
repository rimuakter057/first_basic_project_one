import 'dart:convert';
import 'package:first_project/models/details_model.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});


  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(future: detailsData(),
              builder: (context, snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }else{
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                return ListTile(
                  title: Text(snapshot.data![index].name.toString()),
                  subtitle: Text(snapshot.data![index].email.toString()),
                );
              });
            }
              }),
        )
      ],),
    );
  }


  //get api data
Future <List<DetailsModel>> detailsData()async{
  List <DetailsModel> detailsList = [];
    final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=10"));
    if(response.statusCode == 200){
      var decodedData=jsonDecode(response.body.toString());
      for (Map i in decodedData){
        detailsList.add(DetailsModel.fromJson(i as Map<String, dynamic>));
      }return detailsList;
    }else{
      return detailsList;
    }
}

}
