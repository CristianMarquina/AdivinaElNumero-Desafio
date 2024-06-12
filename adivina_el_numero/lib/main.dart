import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // Utiliza el tema oscuro de Flutter
      debugShowCheckedModeBanner: false, // Oculta el banner de depuración
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Adivina el numero')),
          backgroundColor: Color(0xFF424242), // Color de fondo del AppBar (HEX: #424242)
        ),
        backgroundColor: Color(0xFF303030), // Color de fondo del Scaffold (HEX: #303030)
        body: Center(
          child: Text(
            'Hola Mundo',
            style: TextStyle(color: Colors.white), // Color del texto
          ),
        ),
      ),
    );
  }
}
