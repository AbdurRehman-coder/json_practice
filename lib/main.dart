import 'package:flutter/material.dart';
import 'package:json_parsing_practice/provider/example_two_provider.dart';
import 'package:json_parsing_practice/screens/example_one.dart';
import 'package:json_parsing_practice/screens/example_two.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ExampleTwoProvider()),
        ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  ExampleTwo(),
    ),);
  }
}