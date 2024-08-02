import 'package:flutter/material.dart';
import 'package:islamii/app_colors.dart';
import 'package:islamii/home/hadeth/hadeth_tab.dart';
import 'package:islamii/home/hadeth/item_hadeth.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class HadethDetales extends StatelessWidget {
  static const String routeName = 'hadethDetales';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      !(provider.isDark())
          ? Image.asset(
              'assets/images/bgl.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images/bgd.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.10,
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          decoration: BoxDecoration(
            color: !(provider.isDark())
                ? AppColors.whiteColor
                : AppColors.primaryDarkColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadeth(contint: args.contant[index]);
            },
            itemCount: args.contant.length,
          ),
        ),
      )
    ]);
  }
}
