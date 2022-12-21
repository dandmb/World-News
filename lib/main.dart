import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

import 'package:world_news/model/info_model.dart';
import 'package:world_news/screens/foot_screen.dart';
import 'package:world_news/screens/politic_screen.dart';
import 'package:world_news/screens/tech_screen.dart';



// A function that converts a response body into a List<Photo>.



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "World News",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: "World' News"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //late Future<List<Article>> futureInfo;

  @override
  void initState() {
    super.initState();
    //futureInfo = fetchInfo();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.sports_soccer),
              ),
              Tab(
                icon: Icon(Icons.newspaper),
              ),
              Tab(
                icon: Icon(Icons.developer_mode),
              ),
            ],
          ),
        ),
        body:TabBarView(
          children: [
            FirstScreen(),
            SecondScreen(),
            ThirdScreen(),
          ],
        ),
      ),
    );
  }
}
