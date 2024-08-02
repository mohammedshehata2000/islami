import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class LangugeBottonSheet extends StatefulWidget {
  @override
  State<LangugeBottonSheet> createState() => _LangugeBottonSheetState();
}

class _LangugeBottonSheetState extends State<LangugeBottonSheet> {
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
                provider.changeLanguge('en');
              },
              child: provider.appLanguge == 'en'
                  ? selectedItemWidget(AppLocalizations.of(context)!.english)
                  : UnSelectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguge('ar');
            },
            child: provider.appLanguge == 'ar'
                ? selectedItemWidget(AppLocalizations.of(context)!.arabic)
                : UnSelectedItemWidget(AppLocalizations.of(context)!.arabic),
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
