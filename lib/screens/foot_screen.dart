import 'package:flutter/material.dart';

import '../model/info_model.dart';
import '../network/api_connexion.dart';
import '../utilities/list_view.dart';

class FirstScreen extends StatelessWidget {
  var myInfo=ApiConnexion();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<InfoModel>>(
        future: myInfo.fetchFootInfos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error?.toString());
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return InfosList(infos: snapshot.data!);
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


