import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/pages/about_screen.dart';
import 'package:untitled1/pages/collection_screen.dart';
import 'package:untitled1/pages/detail_screen.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/pages/splach_screen.dart';
import 'package:untitled1/theme/theme.dart';
import 'package:untitled1/widgets/home_paint_widget.dart';

import 'models/art_piece.dart';

const spotifyLink =
    'https://open.spotify.com/user/21m5rnsx3tqkr4xn62ouwfkgq?si=T0_X5JfQTBaALNYMrW2DAQ&utm_source=copy-link';
const fbLink = 'https://m.facebook.com/100001046332630/';
const igLink = 'https://www.instagram.com/on_masny/';

List<ArtData> arts = <ArtData>[
  ArtData('Would you take a sit?', '/images/waiter.jpeg', 'ooooooooooo'),
  ArtData('Duality', '/images/weight_down.jpeg',
      ' exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Donec iaculis gravida nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '),
  ArtData('Some coffees are just discusting', '/images/business_man.jpeg',
      ' exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Donec iaculis gravida nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '),
  ArtData('Take a sip, loose some sh*t', '/images/drinkin_paint.jpg',
      'ooooooooooo'),
  ArtData('F*in bad timing', '/images/motion_paint.jpeg',
      ' exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Donec iaculis gravida nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '),
  ArtData('Sad woman', '/images/sadness_paint.jpeg',
      ' exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Donec iaculis gravida nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '),
  ArtData('Self-reflect', '/images/self_reflection.jpeg',
      ' exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Donec iaculis gravida nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '),
  ArtData('Out-of-box idea', '/images/standing_pain.jpg',
      ' exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Donec iaculis gravida nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '),
  ArtData('First string of life', '/images/strings_of_life.jpg', 'ooooooooooo'),
  ArtData('Adam', '/images/adam_.jpeg', 'ooooooooooo'),
  ArtData('Eve', '/images/eve_.jpeg', 'ooooooooooo'),
  ArtData('I dont know', '/images/here_i_sit.jpg', 'ooooooooooo'),
  ArtData('Dreaming', '/images/landscape.jpg', 'ooooooooooo'),
  ArtData('Floating', '/images/gave_up.jpg', 'ooooooooooo'),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
              theme: notifier.darkMode! ? darkMode : lightMode,
              initialRoute: '/',
              routes: {
                HomePage.route: (context) => const HomePage(),
                DetailScreen.route: (context) => const DetailScreen(),
                AboutScreen.route: (context) => const AboutScreen(),
                CollectionScreen.route: (context) => const CollectionScreen()
              },
              home: const HomePage());
        },
      ),
    );
  }
}

class HomePageIntroRoutePaint extends StatelessWidget {
  const HomePageIntroRoutePaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // pass double.infinity to prevent shrinking of the painter area to 0.
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.1),
      child: CustomPaint(
        painter: FaceOutlinePainter(),
      ),
    );
  }
}
