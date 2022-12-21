

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LinkDetail extends StatelessWidget {
  final String url;
  const LinkDetail({super.key, required this.url});


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: const Center(child: Text("World' News")),
      ),

      url: url,

    );
  }
}
