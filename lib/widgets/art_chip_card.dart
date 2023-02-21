import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:untitled1/models/art_piece.dart';

class ArtChipCard extends StatefulWidget {
  final bool isLast;
  final bool isNotCollection;
  final ArtData data;

  const ArtChipCard(
      {this.isLast = false,
      this.isNotCollection = true,
      required this.data,
      Key? key})
      : super(key: key);

  @override
  _ArtChipCardState createState() => _ArtChipCardState();
}

class _ArtChipCardState extends State<ArtChipCard> with RestorationMixin {
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = const Offset(0, 0);
  bool isVisible = false;

  @override
  String? get restorationId => "counter_screen";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // registerForRestoration(detail, "detail");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(context) {
    return InkWell(
      onHover: (value) {
        if (value) {
          setState(() {
            elevation = 1;
            scale = 1.005;
            translate = const Offset(0, 0);
            isVisible = true;
          });
        } else {
          setState(() {
            elevation = 0;
            scale = 1.00;
            translate = const Offset(0, 0);
            isVisible = false;
          });
        }
      },
      child: Transform.translate(
        offset: translate,
        child: Transform.scale(
          scale: scale,
          child: Material(
            animationDuration: const Duration(milliseconds: 500),
            elevation: elevation,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isVisible
                        ? Colors.black.withOpacity(1.0)
                        : Colors.black.withOpacity(0.1),
                    gradient: const LinearGradient(
                        colors: [Colors.black, Colors.white],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.yellowAccent, width: 2),
                    image: DecorationImage(
                      image: ExactAssetImage(widget.data.path),
                    ),
                  ),
                ),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 60, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Colors.amber.withOpacity(0.5), width: 2),
                        ),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: 'assets/${widget.data.path}',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          tileMode: TileMode.mirror,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.white.withOpacity(0.1)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                  ),
                ),
                if (widget.isLast && widget.isNotCollection)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 60,
                      ),
                      Text(
                        'Collection',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/* Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (isVisible)
                                Flexible(
                                  child: Text(
                                    widget.data.title,
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontSize: 28,
                                        letterSpacing: 5,
                                        color: Colors.white.withOpacity(0.8)),
                                  ),
                                ),
                              if (isVisible)
                                Flexible(
                                  child: Text(
                                    widget.data.description,
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 4,
                                        overflow: TextOverflow.fade),
                                  ),
                                ),
                            ],
                          ),
                        ),*/
