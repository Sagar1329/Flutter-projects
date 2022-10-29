import 'package:flutter/material.dart';

import 'constants.dart';

class Icon_Contents extends StatelessWidget {
  Icon_Contents({required this.text, required this.icon});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
