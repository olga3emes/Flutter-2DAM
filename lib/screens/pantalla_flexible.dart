import 'package:flutter/material.dart';

class PantallaFlexible extends StatelessWidget {
  const PantallaFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flexible: ejemplos")),
      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          // ======================================================
          // 1) FLEXIBLE dentro de un ROW
          // ======================================================
          _Seccion(
            titulo: "1) Flexible dentro de un Row",
            child: Row(
              children: [
                // Flexible ocupa espacio disponible, pero
                // **permite que su hijo se ajuste sin forzarlo**
                Flexible(
                  child: Container(
                    height: 80,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text(
                      "Flexible 1x",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Flexible con flex:2 → ocupa el doble del espacio
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 80,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text(
                      "Flexible 2x",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ======================================================
          // 2) FLEXIBLE dentro de una COLUMN
          // ======================================================
          _Seccion(
            titulo: "2) Flexible dentro de una Column",
            child: SizedBox(
              height: 300, // Necesario para mostrar proporciones verticalmente
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: const Text(
                        "Flexible 1x",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Flexible(
                    flex: 3, // Ocupa 3 partes de la altura restante
                    child: Container(
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Text(
                        "Flexible 3x",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reutilizable para mostrar título + contenido (igual que en pantallas anteriores)
class _Seccion extends StatelessWidget {
  final String titulo;
  final Widget child;

  const _Seccion({required this.titulo, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}