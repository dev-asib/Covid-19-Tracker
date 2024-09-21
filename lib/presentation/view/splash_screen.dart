import 'dart:async';
import 'dart:math' as math;
import 'package:covid_19_tracker/presentation/utils/assets_path.dart';
import 'package:covid_19_tracker/presentation/utils/size_config.dart';
import 'package:covid_19_tracker/presentation/view/world_covid_states_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  void _moveToNextScreen() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WorldCovidStatesScreen(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            splashImageBuilder(),
            SizedBox(height: SizeConfig.screenHeight! * 0.08),
            Text(
              textAlign: TextAlign.center,
              "COVID-19\nTRACKER",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget splashImageBuilder() {
    return AnimatedBuilder(
      animation: _animationController,
      child: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsPath.splashImage),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      builder: (BuildContext context, Widget? widget) {
        return Transform.rotate(
          angle: _animationController.value * 2.0 * math.pi,
          child: widget,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
