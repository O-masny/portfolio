import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/widgets/bottom_navigation.dart';
import 'package:untitled1/widgets/drawer_homepage.dart';

import '../main.dart';
import '../theme/theme.dart';

class HomePage extends StatelessWidget {
  final Widget? body;
  static const String route = '/home';

  const HomePage({this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          drawer: const DrawerHomepage(),
          floatingActionButton: Consumer<ThemeNotifier>(
            builder: (context, theme, child) => FloatingActionButton(
              onPressed: () {
                theme.toggleChangeTheme();
              },
              child: const Icon(Icons.brightness_1_outlined),
            ),
          ),
          appBar: AppBar(
            title: GestureDetector(
              onTap: () => Navigator.pushNamed(context, HomePage.route),
              child: Column(
                children: [
                  const Text(
                    '&ME',
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                  Divider(
                    color: Colors.amber.withOpacity(0.2),
                    height: 2,
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: body ??
                SizedBox(
                  width: width,
                  height: height,
                  child: const HomePageIntroRoutePaint(),
                ),
          ),
          bottomNavigationBar: const BottomNavigationMenu(),
        ),
      ),
    );
  }
}
