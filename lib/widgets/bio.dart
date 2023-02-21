import 'package:flutter/material.dart';
import 'package:untitled1/pages/about_screen.dart';

class BioLink extends StatelessWidget {
  const BioLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).restorablePushNamed(AboutScreen.route),
      child: const Text(
        'About me',
        style: TextStyle(color: Colors.white, letterSpacing: 5, fontSize: 30),
      ),
    );
  }
}
