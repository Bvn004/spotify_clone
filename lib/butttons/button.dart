import 'package:flutter/material.dart';

class Primarybutton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  final double? height;
  const Primarybutton(
      {super.key, required this.onpressed, required this.text, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
