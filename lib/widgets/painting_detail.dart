
import 'package:flutter/material.dart';
import 'package:untitled1/widgets/padding_box.dart';

class PaintingDetail extends StatelessWidget {
  final String? path;

  const PaintingDetail({this.path = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                shape: BoxShape.rectangle),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(path ?? 'assets/images/rack.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.yellowAccent, width: 2),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white.withOpacity(0.1),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'L samet',
                    style: Theme.of(context).textTheme.headline1,
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            'sasdasdasdasdasasdasdasddsaasdadsasdasdsasdasdasasdasdasdasdasasdasdasdasdasasdasdasdasdasasdasdasdasdasasdasdasdasda',
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ),
        const HeightBoxMid(),
      ],
    );
  }
}
