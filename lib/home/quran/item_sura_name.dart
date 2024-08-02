import 'package:flutter/material.dart';
import 'package:islamii/home/quran/sura_detales.dart';

class ItemSuraName extends StatelessWidget {
  String suraName;

  int index;

  ItemSuraName({required this.suraName, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetales.routeName,
            arguments: SuraWithArges(name: suraName, index: index));
      },
      child: Text(
        textAlign: TextAlign.center,
        suraName,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
