

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:json_parsing_practice/provider/example_two_provider.dart';
import 'package:provider/provider.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final postProvider = Provider.of<ExampleTwoProvider>(context, listen: false);
    postProvider.getExampleTwoPosts();
  }
  @override
  Widget build(BuildContext context) {
    final postNotifier = Provider.of<ExampleTwoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Two'),
      ),
      body: postNotifier.postModel.isEmpty ?
          Center(
            child: CircularProgressIndicator(),
          )  :
      Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: postNotifier.postModel.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('id: ${postNotifier.postModel[index].id}'),
                            const SizedBox(height: 12,),
                            const Text('title',style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text(postNotifier.postModel[index].title.toString()),
                            const SizedBox(height: 12,),
                            const Text('Description',style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text(postNotifier.postModel[index].body.toString()),
                          ],
                        ),
                      ),
                    ),
                  );

                }),
          )
        ],
      ),
    );
  }
}