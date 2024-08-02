import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/app_colors.dart';
import 'package:islamii/home/settinges/languge_botton_sheet.dart';
import 'package:islamii/home/settinges/theme_botton_sheet.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SettingesTab extends StatefulWidget {
  @override
  State<SettingesTab> createState() => _SettingesTabState();
}

class _SettingesTabState extends State<SettingesTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showLangugeBottonSheet();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryLightColor,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.appLanguge == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showThemeBottonSheet();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryLightColor,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  void showLangugeBottonSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LangugeBottonSheet());
  }

  void showThemeBottonSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => themeBottonSheet());
  }
}
