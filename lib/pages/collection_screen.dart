import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/single_image_view.dart';
import 'home_page.dart';

class CollectionScreen extends StatelessWidget {
  static const String route = '/collection';
  final List? collection;

  const CollectionScreen({this.collection, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage(
      body: SingleImageView(
        paintings: arts,
      ),
    );
  }
}
