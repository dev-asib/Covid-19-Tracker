import 'package:covid_19_tracker/app/app_themes.dart';
import 'package:covid_19_tracker/presentation/utils/size_config.dart';
import 'package:covid_19_tracker/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';

class Covid19Tracker extends StatefulWidget {
  const Covid19Tracker({super.key});

  @override
  State<Covid19Tracker> createState() => _Covid19TrackerState();
}

class _Covid19TrackerState extends State<Covid19Tracker> {
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
