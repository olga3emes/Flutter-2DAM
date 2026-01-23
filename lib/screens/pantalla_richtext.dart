import 'package:flutter/material.dart';
// Pantalla que demuestra el uso de RichText
class PantallaRichText extends StatelessWidget {
  const PantallaRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de RichText'),
      ),

      // Contenido principal
      body:  Center(
        // RichText permite texto con múltiples estilos
        child: RichText(
          // TextSpan es la raíz del texto
          text: TextSpan(
            // Estilo base (heredado por los hijos)
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),

            // Lista de fragmentos de texto
            children: [
              // Primer fragmento
              TextSpan(
                text: 'Hola ',
              ),

              // Segundo fragmento con estilo propio
              TextSpan(
                text: 'Flutter',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Tercer fragmento
              TextSpan(
                text: ' 👋 bienvenido a ',
              ),

              // Cuarto fragmento con otro estilo
              TextSpan(
                text: 'RichText',
                style: TextStyle(
                  color: Colors.green,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
