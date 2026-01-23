import 'package:flutter/material.dart';

//myWidgets
import 'package:prueba/screens/pantalla_richtext.dart';

void main() {
  runApp(const MyApp());
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ejemplo RichText',
      home: PantallaRichText(),
    );
  }
}

