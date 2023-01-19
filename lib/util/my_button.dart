import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyaddButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  MyaddButton({
    super.key,
    required this.text,
    required this.onPressed,

  });


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
      color: Colors.blue.shade100,

      child: Text(text),
    );
  }
}
