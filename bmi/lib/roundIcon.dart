import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.Child, required this.onPressed});
  final IconData Child;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        Child,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4f5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: onPressed,
    );
  }
}
