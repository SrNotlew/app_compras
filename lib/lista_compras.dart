import 'package:app_compras/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class ListaCompras extends StatelessWidget {
  const ListaCompras({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      title: 'Lista de Compras',
      home: SplashScreen(),
      theme: ThemeData(
       
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
