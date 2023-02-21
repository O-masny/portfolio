import 'package:flutter/material.dart';

import '../pages/about_screen.dart';
import '../pages/collection_screen.dart';
import '../pages/home_page.dart';

class DrawerHomepage extends StatelessWidget {
  const DrawerHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle styleItem = TextStyle(
        color: Colors.amber, fontWeight: FontWeight.w700, fontSize: 25);
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 2),
          ListTile(
            title: const Text(
              'Home',
              style: styleItem,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(HomePage.route);
            },
          ),
          ListTile(
            title: const Text(
              'Collection',
              style: styleItem,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(CollectionScreen.route);
            },
          ),
          ListTile(
            title: const Text(
              'About',
              style: styleItem,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AboutScreen.route);
            },
          ),
        ],
      ),
    );
  }
}
