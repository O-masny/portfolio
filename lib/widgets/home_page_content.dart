import 'package:flutter/material.dart';
import 'package:untitled1/widgets/padding_box.dart';
import '../main.dart';
import 'art_chip_card.dart';
import 'bottom_navigation.dart';
import 'easy_query.dart';
import 'info_line_widget.dart';

class MainPageContent extends StatelessWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeightBoxMid(),
          const EasyQuery(),
          Divider(
            color: Colors.white.withOpacity(0.1),
            height: 1,
          ),
          const LowerMainPageContent(),
          const HeightBoxMid(),
          const InfoLineWidget(
              Icons.safety_check, '12 hours invested in this.'),
          const InfoLineWidget(
              Icons.heart_broken_outlined, '8000+ days alive. '),
          InfoLineWidget(Icons.color_lens_outlined,
              '${arts.length.toString()} paintings made. '),
          const HeightBoxMid(),
          const BottomNavigationMenu()
        ],
      ),
    );
  }
}

class LowerMainPageContent extends StatelessWidget {
  final int? index;
  final bool hasGrid;

  const LowerMainPageContent({this.index, this.hasGrid = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ArtChipCard(
                  isLast: index == arts.length - 1,
                  data: arts[index],
                  isNotCollection: hasGrid,
                );
              },
              childCount: arts.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (hasGrid ? 2 : 1),
              mainAxisSpacing: 35,
              crossAxisSpacing: 35,
              childAspectRatio: 1,
            ),
          ),
        ),
      ],
    );
  }
}
