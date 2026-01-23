import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Definición del widget personalizado
class BotonPersonalizado extends StatelessWidget {
  
  final String texto;
  final Color color;

  const BotonPersonalizado({super.key, required this.texto, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8), // Bordes redondeados
      ),
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo de Widget Personalizado'),
        ),
        body: Center(
          child: BotonPersonalizado(
            texto: 'Presióname',
            color: Colors.blue,
          ),
        ),
      ),
    );
  } 

}