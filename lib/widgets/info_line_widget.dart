import 'package:flutter/material.dart';

class InfoLineWidget extends StatelessWidget {
  final IconData icon;
  final String description;

  const InfoLineWidget(this.icon, this.description, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          Icon(
            icon,
            size: 100,
            color: Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text(description),
          ),
          Divider(
            color: Colors.amber.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
