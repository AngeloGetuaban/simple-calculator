import 'package:flutter/material.dart';

class ButtonCal extends StatelessWidget {
  final String text;
  final fillColor;
  final textColor;
  final double textSize;
  final Function callback;

  const ButtonCal(
      {required this.text,
      this.fillColor,
      this.textColor = Colors.white,
      this.textSize = 50,
      required this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 65,
        width: 65,
        child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            callback(text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(156, 109, 109, 109),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ),
      ),
    );
  }
}
