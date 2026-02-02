import 'package:flutter/material.dart';

class PantallaExpanded extends StatelessWidget {
  const PantallaExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expanded: ejemplos")),
      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          // ==========================================
          // 1) EXPANDED DENTRO DE UN ROW
          // ==========================================
          _Seccion(
            titulo: "1) Expanded dentro de un Row",
            child: Row(
              children: [
                // Este Expanded ocupa 1 parte del ancho
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text(
                      "1 parte",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Este Expanded ocupa 2 partes del ancho
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 80,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text(
                      "2 partes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ==========================================
          // 2) EXPANDED DENTRO DE UNA COLUMN
          // ==========================================
          _Seccion(
            titulo: "2) Expanded dentro de una Column",
            child: SizedBox(
              height: 300, // necesario para mostrar proporciones verticales
              child: Column(
                children: [
                  // Ocupa 1 parte de altura
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: const Text(
                        "1 parte de alto",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Ocupa 3 partes de altura
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Text(
                        "3 partes de alto",
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

// Widget reutilizable para cada sección con título + contenido
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
