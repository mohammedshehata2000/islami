import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii/app_colors.dart';
import 'package:islamii/home/quran/item_sura_sort.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SuraDetales extends StatefulWidget {
  static const String routeName = 'suraDetales';

  @override
  State<SuraDetales> createState() => _SuraDetalesState();
}

class _SuraDetalesState extends State<SuraDetales> {
  List<String> wait = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraWithArges;
    if (wait.isEmpty) {
      loadFile(args.index);
    }
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
            args.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: wait.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,
                ),
              )
            : Container(
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
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: !(provider.isDark())
                        ? AppColors.primaryLightColor
                        : AppColors.yellowColor,
                    thickness: 2,
                  ),
                  itemBuilder: (context, index) {
                    return ItemSuraSort(
                      contint: wait[index],
                      index: index,
                    );
                  },
                  itemCount: wait.length,
                ),
              ),
      )
    ]);
  }

  void loadFile(index) async {
    String contant =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = contant.split('\n');
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    wait = lines;
    setState(() {});
  }
}

class SuraWithArges {
  String name;

  int index;

  SuraWithArges({required this.name, required this.index});
}
