import 'dart:ui';

import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  final ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: theme.colorScheme
            .copyWith(primary: Color(0xAA1100000), secondary: Colors.white),
      ),
      home: InputPage(),
    );
  }
}
