import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/home/hadeth/hadeth_detales.dart';
import 'package:islamii/home/home_screen.dart';
import 'package:islamii/home/quran/sura_detales.dart';
import 'package:islamii/my_theme_data.dart';
import 'package:islamii/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // var provider = Provider.of<AppConfigProvider>(context) ;
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguge),
      themeMode: provider.appTheme,
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetales.routeName: (context) => SuraDetales(),
        HadethDetales.routeName: (context) => HadethDetales(),
      },
    );
  }
}
