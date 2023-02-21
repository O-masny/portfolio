import 'package:flutter_control/control.dart';
import 'home_page.dart';

class AboutScreen extends StatelessWidget {
  static const String route = 'about';

  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularBar(),

          const SizedBox(height: 50),
          const SectionInfo(
            title: 'Whoami',
            description: 'Ondřej Masný',
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SectionInfo(
                title: 'Enjoying life?',
                description: '_//yes',
              ),
              SectionInfo(
                title: '_________',
                description: '|||||||||||',
              ),
            ],
          ),
          const SectionInfo(
            title: 'Free_time',
            description: 'Paint',
          ),
          const SectionInfo(
            title: 'Profession',
            description: 'Mobile app developer',
          ),
          const SectionInfo(
            title: 'Education',
            description: 'Bachelor degree at Tomas Bata Univerzity',
          ),
          Image.asset(
            'images/pisces.png',
            width: 20,
            height: 20,
            color: Colors.white,
          ),
        ],
      ),
    );

    return HomePage(
      body: widget,
    );
  }
}

class SectionInfo extends StatelessWidget {
  final bool isTapped = false;
  final String title;
  final String description;

  const SectionInfo(
      {isTapped, this.title = '', this.description = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, letterSpacing: 9),
                  )),
              Text(description),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

class CircularBarControl extends BaseControl {
  var datetime = FieldControl<DateTime>(DateTime.now());
}

class CircularBar extends SingleControlWidget<CircularBarControl> {
  CircularBar({Key? key}) : super(key: key);

  @override
  CircularBarControl initControl() => CircularBarControl();

  String getTime() {
    return DateTime.now().toUtc().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldBuilder<DateTime>(
          control: control.datetime,
          builder: (BuildContext context, value) => Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.amber.shade900,
                    color: Colors.black87,
                    strokeWidth: 5,
                  ),
                  Text('${control.datetime}'),
                ],
              )),
        ),
      ],
    );
  }
}
