import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
List<InfoModel> InfoModelFromJson(String str) =>
    List<InfoModel>.from(json.decode(str).map((x) => InfoModel.fromJson(x)));
*/

class InfoModel{

  final String title;
  final String description;
  final String contenu;
  final String url;
  final String image;
  final String published;
  //final String sourceName;

  InfoModel({
    required this.title,
    required this.description,
    required this.contenu,
    required this.url,
    required this.image,
    required this.published,
    //required this.sourceName,
} );


  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      title: json['title'],
      description: json['description'],
      contenu: json['content'],
      url: json['url'],
      image: json['image'],
      published: json['publishedAt'],
      //sourceName:json['name'],
    );
  }


}