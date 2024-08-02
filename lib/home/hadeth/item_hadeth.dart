import 'package:flutter/material.dart';

class ItemHadeth extends StatelessWidget {
  String contint;

  ItemHadeth({
    required this.contint,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      contint,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
