import 'package:flutter/material.dart';
import 'package:islamii/home/hadeth/hadeth_detales.dart';
import 'package:islamii/home/hadeth/hadeth_tab.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            HadethDetales.routeName,
            arguments: hadeth,
          );
        },
        child: Text(
            textAlign: TextAlign.center,
            hadeth.title,
            style: Theme.of(context).textTheme.bodySmall));
  }
}
