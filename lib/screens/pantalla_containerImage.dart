import 'package:flutter/material.dart';
// Pantalla que demuestra el uso de Container mostrando una imagen
class PantallaContainerImage extends StatelessWidget {
  const PantallaContainerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Contenedor principal de toda la pantalla
      color: Colors.grey[200],             // Color de fondo
      padding: const EdgeInsets.all(16),   // Espacio alrededor del contenido

      child: Container(
        // Contenedor interior que agrupa todos los elementos
        color: Colors.white,
        padding: const EdgeInsets.all(12),

        child: Column(
          // Necesitamos Column para tener varios widgets
          mainAxisSize: MainAxisSize.min,
          children: [
            // Primer texto
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.blue[100],
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Imagen desde assets:',
                textAlign: TextAlign.center,
              ),
            ),

            // Contenedor con imagen
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.orange[100],   // Fondo para que se vea el contorno
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/ejemplo.jpg', // Ruta de tu imagen
                width: 150,
                height: 150,
                fit: BoxFit.cover,          // Ajuste de la imagen dentro del contenedor
              ),
            ),
          ],
        ),
      ),
    );
  }
}