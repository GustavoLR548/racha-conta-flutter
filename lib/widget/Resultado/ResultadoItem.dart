import 'package:flutter/material.dart';

class ResultadoItem extends StatelessWidget {
  final Text item1;
  final Text item2;

  const ResultadoItem(this.item1, this.item2);

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        item1,
        item2,
      ],
    );
  }
}
