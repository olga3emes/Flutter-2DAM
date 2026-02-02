import 'package:flutter/material.dart';

// Pantalla que demuestra el uso de Container incluyendo un ElevatedButton
class PantallaContainerButton extends StatelessWidget {
  const PantallaContainerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Contenedor principal
      padding: const EdgeInsets.all(16),
      color: const Color.fromARGB(255, 255, 255, 255),  // Fondo suave para visualizar el contenido

      child: Column(
        // Se usa Column porque necesitamos mostrar varios elementos
        mainAxisSize: MainAxisSize.min,
        children: [
          // Contenedor superior con texto
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.blue[100],
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Ejemplo con ElevatedButton:',
              textAlign: TextAlign.center,
            ),
          ),

          // Contenedor con el botón
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.orange[100],  // Fondo para ver los límites del container
            alignment: Alignment.center,

            child: ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón
                debugPrint('Botón presionado');
              },

              child: const Text("Presionar"),
            ),
          ),
        ],
      ),
    );
  }
}
