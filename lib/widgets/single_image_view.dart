import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:untitled1/pages/detail_screen.dart';
import '../models/art_piece.dart';

class SingleImageView extends StatefulWidget {
  final List<ArtData?> paintings;

  const SingleImageView({required this.paintings, Key? key}) : super(key: key);

  @override
  State<SingleImageView> createState() => _SingleImageViewState();
}

class _SingleImageViewState extends State<SingleImageView> {
  PageController controller = PageController();
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = const Offset(0, 0);
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void nextPage() {
    controller.animateToPage(controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 800), curve: Curves.bounceIn);
  }

  void previousPage() {
    controller.animateToPage(controller.page!.toInt() - 1,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    return PageView.builder(
      itemBuilder: (context, position) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: InkWell(
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
                onTap: () => Navigator.pushNamed(
                  context,
                  DetailScreen.route,
                  arguments: widget.paintings[position],
                ),
                child: Transform.translate(
                  offset: translate,
                  child: Transform.scale(
                    scale: scale,
                    child: Material(
                        animationDuration: const Duration(milliseconds: 500),
                        elevation: elevation,
                        child: SinglePhoto(widget.paintings[position]!.path)),
                  ),
                ),
              ),
            ),
            if (position != widget.paintings.length - 1)
              Positioned(
                bottom: 0,
                child: FloatingActionButton(
                  heroTag: "btn1",
                  splashColor: Colors.black,
                  backgroundColor: Colors.amber.withOpacity(0.4),
                  child: const Icon(Icons.arrow_downward_rounded),
                  onPressed: () {
                    nextPage();
                  },
                ),
              ),
            if (position != 0)
              Positioned(
                top: 0,
                child: FloatingActionButton(
                  heroTag: "btn2",
                  splashColor: Colors.black,
                  backgroundColor: Colors.amber.withOpacity(0.4),
                  child: const Icon(Icons.arrow_upward),
                  onPressed: () {
                    previousPage();
                  },
                ),
              )
          ],
        );
      },
      pageSnapping: false,
      allowImplicitScrolling: true,
      controller: controller,
      scrollDirection: Axis.vertical,
      itemCount: widget.paintings.length,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

class SinglePhoto extends StatelessWidget {
  final String image;

  const SinglePhoto(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withOpacity(0.5), width: 3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: <Widget>[
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'assets/$image',
                fit: BoxFit.contain,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaY: 30, sigmaX: 60, tileMode: TileMode.mirror),
                child: Container(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'assets/$image',
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
