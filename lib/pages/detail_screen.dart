import 'dart:async';
import 'dart:ui';
import 'package:flutter_control/control.dart';
import 'package:untitled1/models/art_piece.dart';

import 'home_page.dart';

class DetailScreen extends StatefulWidget {
  static const String route = '/detail';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(milliseconds: 300), () {
      // set your desired delay time here
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArtData;

    return HomePage(
      body: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(args.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 15),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.amber, width: 3),
                                shape: BoxShape.rectangle),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 1.2,
                              width: MediaQuery.of(context).size.width - 100.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(args.path),
                                  fit: BoxFit.contain,
                                ),
                                border:
                                    Border.all(color: Colors.black, width: 4),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    args.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black, letterSpacing: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 30),
                          child: Text(
                            args.description,
                            style: const TextStyle(letterSpacing: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Image.asset(
                  'icons/back_arrow.png',
                  width: 30,
                ),
                color: Colors.white,
              ),
            ),
            /*   Positioned(
                top: 0,
                right: 30,
                left: 30,
                child: DetailBottomInfo(widget.paintingData!))*/
          ],
        ),
      ),
    );
  }
}

class DetailBottomInfo extends StatelessWidget {
  final ArtData paintingData;

  const DetailBottomInfo(this.paintingData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('YEAR'),
            Text('USED MEDIUMS:'),
          ],
        ),
      ),
    );
  }
}
