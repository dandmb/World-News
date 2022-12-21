import 'package:flutter/material.dart';
import 'package:world_news/network/api_connexion.dart';

import '../main.dart';
import '../model/info_model.dart';
import '../utilities/list_view_politic.dart';

class SecondScreen extends StatelessWidget {
  var myInfo=ApiConnexion();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<List<InfoModel>>(
        future: myInfo.fetchNewsInfos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error?.toString());
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return InfosPoliticList(infos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}