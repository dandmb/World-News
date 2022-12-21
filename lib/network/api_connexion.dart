

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/info_model.dart';
import '../utilities/apikey.dart';

class ApiConnexion{


  final String apiKey=ApiKey.apiKey;
  final List<String> langue=['fr','en'];
  final List<String> theme=['football','politique','informatique'];


  List<InfoModel> parseInfos(String responseBody) {
    final parsed = jsonDecode(responseBody)["articles"].cast<Map<String, dynamic>>();

    return parsed.map<InfoModel>((json) => InfoModel.fromJson(json)).toList();
  }

  Future<List<InfoModel>> fetchFootInfos() async {
    final response = await http
        .get(Uri.parse('https://gnews.io/api/v4/search?q=football&lang=fr&max=50&token=$apiKey'));
    // Use the compute function to run parsePhotos in a separate isolate.

    return compute(parseInfos, response.body);
  }
  Future<List<InfoModel>> fetchNewsInfos() async {
    final response = await http
        .get(Uri.parse('https://gnews.io/api/v4/search?q=politique&lang=fr&max=50&token=$apiKey'));
    // Use the compute function to run parsePhotos in a separate isolate.

    return compute(parseInfos, response.body);
  }
  Future<List<InfoModel>> fetchTechInfos() async {
    final response = await http
        .get(Uri.parse('https://gnews.io/api/v4/search?q=informatique&lang=fr&max=50&token=$apiKey'));
    // Use the compute function to run parsePhotos in a separate isolate.

    return compute(parseInfos, response.body);
  }

}