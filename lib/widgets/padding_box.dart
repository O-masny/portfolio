import 'package:flutter/material.dart';

class HeightBoxMid extends StatelessWidget {
  const HeightBoxMid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(height: height / 3);
  }
}
