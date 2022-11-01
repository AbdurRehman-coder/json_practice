
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../models/post_model.dart';

class ExampleTwoProvider with ChangeNotifier{


  List<PostModel> postModel = [];
  setPostModelList(PostModel value){
    postModel.add(value);
    notifyListeners();
  }

  Future getExampleTwoPosts() async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200){
      var jsonParse = jsonDecode(response.body.toString());

      for (var data in jsonParse){
        PostModel model = PostModel.fromJson(data);
        setPostModelList(model);
      }
    }
  }
}