import 'package:flutter/material.dart';

import '../main.dart';
import '../model/info_model.dart';
import '../network/api_connexion.dart';
import '../utilities/list_view_tech.dart';

class ThirdScreen extends StatelessWidget {
  var myInfo=ApiConnexion();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<List<InfoModel>>(
        future: myInfo.fetchTechInfos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error?.toString());
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return InfosTechList(infos: snapshot.data!);
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