import 'package:covid_19_tracker/presentation/utils/app_colors.dart';
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
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.appThemeColor,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appThemeColor,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            fixedSize: const Size(double.maxFinite, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: _buildOutlineInputBorder(),
          focusedBorder: _buildOutlineInputBorder(),
          errorBorder: _buildOutlineInputBorder(Colors.red),
          enabledBorder: _buildOutlineInputBorder(),
          hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
          prefixIconColor: Colors.grey.shade700,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        listTileTheme: const ListTileThemeData(
          titleTextStyle: TextStyle(
            color:  Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          subtitleTextStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder([Color color = Colors.grey]) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: color),
      borderRadius: BorderRadius.circular(50.00),
    );
  }
}
