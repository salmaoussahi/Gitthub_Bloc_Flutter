import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:githubbloc/pages/bottom_navigation_menu.dart';

class SplashSceen extends StatelessWidget {
  const SplashSceen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
          duration: 100,
          splash: Image.asset("assets/Octocat.png"),
          nextScreen: BottomNavigationBarMenu(),
          splashTransition: SplashTransition.rotationTransition,
        );
  }
}