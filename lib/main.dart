// Importa el paquete principal de Flutter con Material Design
import 'package:flutter/material.dart';

// Función principal: punto de entrada de la aplicación
void main() {
  // Ejecuta la app y muestra el widget principal
  runApp(const MyApp());
}

// Widget principal de la aplicación
// Es StatelessWidget porque no cambia su estado
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp configura la estructura base de la app
    return const MaterialApp(
      // home indica la pantalla principal
      home: PantallaTexto(),
    );
  }
}

// Pantalla que muestra ejemplos del widget Text
class PantallaTexto extends StatelessWidget {
  const PantallaTexto({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold crea una pantalla básica (AppBar + Body)
    return Scaffold(
      appBar: AppBar(
        // Título de la barra superior
        title: const Text('Ejemplo del widget Text'),
      ),

      // body es el contenido principal de la pantalla
      body: const Center(
        // Center centra su hijo en la pantalla
        child: Text(
          // Texto que se mostrará en pantalla
          'Hola Flutter 👋',

          // Alineación del texto dentro de su espacio
          textAlign: TextAlign.center,

          // Estilo del texto
          style: TextStyle(
            // Tamaño de la letra
            fontSize: 24,

            // Color del texto
            color: Colors.blue,

            // Grosor del texto
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
