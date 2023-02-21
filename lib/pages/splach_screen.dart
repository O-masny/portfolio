import 'dart:async';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed(HomePage.route));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ));
  }
}
