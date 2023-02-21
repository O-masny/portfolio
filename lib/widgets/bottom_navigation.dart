import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import 'bio.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SimpleProductTag(
                  'Instagram',
                  Image.asset(
                    'icons/ig.png',
                    width: 29,
                    height: 29,
                  ),
                  igLink),
              SimpleProductTag(
                  'Facebook',
                  Image.asset(
                    'icons/fb.png',
                    width: 29,
                    height: 29,
                  ),
                  fbLink),
              SimpleProductTag(
                  'Spotify',
                  Image.asset(
                    'icons/spotidy.webp',
                    width: 29,
                    height: 29,
                  ),
                  spotifyLink),
              const Flexible(child: BioLink()),
            ]),
      ),
    );
  }
}

class SimpleProductTag extends StatelessWidget {
  final String text;
  final Widget icon;
  final String url;

  const SimpleProductTag(this.text, this.icon, this.url, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(
                letterSpacing: 3,
                  color: Colors.amber.withOpacity(0.9),
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            ),
          ],
        ),
      ),
      onTap: () => launchUrl(Uri.parse(url)),
    );
  }
}
