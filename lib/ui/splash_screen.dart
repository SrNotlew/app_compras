import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_compras/ui/lista_compras_telas.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/animation/AnimationCart2.json'),
      ),
      nextScreen: ListaComprasTela(),
      duration: 1300,
      backgroundColor: Colors.white,
      splashIconSize: 250 ,
    );
  }
}
