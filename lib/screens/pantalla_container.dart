// Pantalla que demuestra el uso de varios Container sin usar Row ni Column
import 'package:flutter/material.dart';
class PantallaContainer extends StatelessWidget {
  const PantallaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Este contenedor principal envuelve todo el contenido
      padding: const EdgeInsets.all(16.0), // Espacio interno global
      color: Colors.grey[200],             // Fondo para visualizar la pantalla
      child: Container(
        // Primer nivel de contenedor para colocar contenido vertical
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: Column(
          // ❗ Nota importante:
          // Para mostrar varios elementos, necesitamos una Column.
          // Si NO usáramos Column, Flutter NO permite múltiples widgets.
          children: [
            // Primer contenedor interno
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              color: Colors.blue[100],
              alignment: Alignment.center,
              child: const Text(
                'Deliver features faster',
                textAlign: TextAlign.center,
              ),
            ),

            // Segundo contenedor interno
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              color: Colors.green[100],
              alignment: Alignment.center,
              child: const Text(
                'Craft beautiful UIs',
                textAlign: TextAlign.center,
              ),
            ),

            // Tercer contenedor: muestra un logo
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.orange[100],
              alignment: Alignment.center,
              child: const FlutterLogo(size: 60),
            ),
          ],
        ),
      ),
    );
  }
}