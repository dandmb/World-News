import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/info_model.dart';
import '../screens/link_screen.dart';

class InfosPoliticList extends StatelessWidget {
  const InfosPoliticList({super.key, required this.infos});

  final List<InfoModel> infos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: infos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LinkDetail(url: infos[index].url,)));
                      },
                      child: CachedNetworkImage(
                        imageUrl: infos[index].image,
                        placeholder: (context,url) => CircularProgressIndicator(),
                        errorWidget: (context,url,error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      infos[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(infos[index].description),
                  ),
                ],
              )),
        );
      },
    );
  }
}
