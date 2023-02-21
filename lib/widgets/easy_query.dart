import 'package:flutter/material.dart';

class EasyQuery extends StatefulWidget {
  const EasyQuery({Key? key}) : super(key: key);

  @override
  State<EasyQuery> createState() => _EasyQueryState();
}

class _EasyQueryState extends State<EasyQuery> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('HOW ARE YOU?'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  isPressed = !isPressed;
                }),
                child: Container(
                  color: isPressed
                      ? Colors.green.withOpacity(0.5)
                      : Colors.red.withOpacity(0.5),
                  child: const Text('GOOD'),
                ),
              ),
              GestureDetector(
                onTap: () => setState(
                  () {
                    isPressed = !isPressed;
                  },
                ),
                child: Container(
                  color: isPressed
                      ? Colors.red.withOpacity(0.5)
                      : Colors.green.withOpacity(0.5),
                  child: const Text('BAD'),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
