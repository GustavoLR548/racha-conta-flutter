import 'package:flutter/material.dart';

class IconDetector extends StatelessWidget {
  final Function onTap;
  final Icon icon;

  const IconDetector({this.onTap, this.icon});

  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: icon);
  }
}
