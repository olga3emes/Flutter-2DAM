import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}

// Explicación del código
// ●	main() → función principal que lanza la app con runApp().
// ●	MyApp → widget raíz que define el diseño global.
// ●	MaterialApp → proporciona navegación, temas, rutas, etc.
// ●	Scaffold → estructura visual estándar con AppBar, Body, Drawer, etc.
// ●	HomePage → pantalla principal.

