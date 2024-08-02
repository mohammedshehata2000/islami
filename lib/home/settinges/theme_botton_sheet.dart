import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class themeBottonSheet extends StatefulWidget {
  @override
  State<themeBottonSheet> createState() => _themeBottonSheetState();
}

class _themeBottonSheetState extends State<themeBottonSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: !(provider.isDark())
                  ? selectedItemWidget(AppLocalizations.of(context)!.light)
                  : UnSelectedItemWidget(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDark()
                ? selectedItemWidget(AppLocalizations.of(context)!.dark)
                : UnSelectedItemWidget(AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Widget selectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.primaryLightColor)),
        Icon(
          Icons.check,
          color: AppColors.primaryLightColor,
          size: 35,
        )
      ],
    );
  }

  Widget UnSelectedItemWidget(String text) {
    return Row(children: [
      Text(text, style: Theme.of(context).textTheme.bodyMedium),
    ]);
  }
}
