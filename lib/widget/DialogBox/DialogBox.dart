import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  DialogBox({this.height = 300, this.width = 300, @required this.child});

  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Container(width: width, height: height, child: child));
  }
}
