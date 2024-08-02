import 'package:flutter/material.dart';

class ItemSuraSort extends StatelessWidget {
  String contint;

  int index;

  ItemSuraSort({required this.contint, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      '$contint (${index + 1})',
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
