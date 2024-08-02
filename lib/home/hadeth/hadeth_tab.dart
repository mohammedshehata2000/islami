import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/app_colors.dart';
import 'package:islamii/home/hadeth/item_hadeth_name.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(child: Image.asset('assets/images/hadethlogo.png')),
        Divider(
          color: !(provider.isDark())
              ? AppColors.primaryLightColor
              : AppColors.yellowColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: !(provider.isDark())
              ? AppColors.primaryLightColor
              : AppColors.yellowColor,
          thickness: 3,
        ),
        Expanded(
          flex: 3,
          child: ahadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) =>
                      ItemHadethName(hadeth: ahadethList[index]),
                  separatorBuilder: (context, index) => Divider(
                    color: !(provider.isDark())
                        ? AppColors.primaryLightColor
                        : AppColors.yellowColor,
                    thickness: 2,
                  ),
                  itemCount: ahadethList.length,
                ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      print(hadethList[i]);
      List<String> hadethlines = hadethList[i].split('\n');
      String title = hadethlines[0];
      hadethlines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, contant: hadethlines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;

  List<String> contant;

  Hadeth({required this.title, required this.contant});
}
