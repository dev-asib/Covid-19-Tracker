import 'package:covid_insight/app/app_themes.dart';
import 'package:covid_insight/presentation/utils/size_config.dart';
import 'package:covid_insight/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';

class CovidInsight extends StatefulWidget {
  const CovidInsight({super.key});

  @override
  State<CovidInsight> createState() => _CovidInsightState();
}

class _CovidInsightState extends State<CovidInsight> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: const SplashScreen(),
      theme: AppThemes.lightThemeData(),
      darkTheme: AppThemes.darkThemeData(),
      themeMode: ThemeMode.system,
    );
  }
}
