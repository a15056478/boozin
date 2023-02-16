import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:boozin/journey/blocs/home%20bloc/screens/home_page.dart';
import 'package:boozin/miscellaneous/utils.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int count = 0;
  late Timer t;
  @override
  void initState() {
    t = Timer.periodic(const Duration(seconds: 2), (t) {
      setState(() {
        count = t.tick.toInt();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: double.maxFinite,
      duration: 4000,
      splash: count == 0
          ? Image.asset('assets/images/pin.png')
          : count == 1
              ? Image.asset(
                  context.isDarkMode
                      ? 'assets/images/boozin_logo_dark.png'
                      : 'assets/images/boozin_logo_light.png',
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      context.isDarkMode
                          ? 'assets/images/boozin_logo_dark.png'
                          : 'assets/images/boozin_logo_light.png',
                    ),
                    Text(
                      'Fitness',
                      style: TextStyle(
                          color:
                              context.isDarkMode ? Colors.white : Colors.black),
                    )
                  ],
                ),
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.theme,
      backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
    );
  }
}
