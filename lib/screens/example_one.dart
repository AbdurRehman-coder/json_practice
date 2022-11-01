
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {

  List<PostModel> postModels = [];

  Future<List<PostModel>> getPostModels() async{
   var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
   if(response.statusCode == 200){
     var jsonParse = jsonDecode(response.body.toString());

     for (var data in jsonParse){
       PostModel model = PostModel.fromJson(data);
       postModels.add(model);
     }
     return postModels;
   }
   return postModels;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostModels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Response'),
      ),
      body: Center(
        child: FutureBuilder<List<PostModel>>(
          future: getPostModels(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Userid: ${snapshot.data![index].id}'),
                        const SizedBox(height: 12,),
                        const Text('title',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(snapshot.data![index].title.toString()),
                        const SizedBox(height: 12,),
                        const Text('Description',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(snapshot.data![index].body.toString()),
                      ],
                    ),
                  );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
      ),
    ),
      );
  }
}