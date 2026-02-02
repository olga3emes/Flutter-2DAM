import 'package:flutter/material.dart';

class PantallaCuatroStacks extends StatelessWidget {
  const PantallaCuatroStacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack: 4 ejemplos")),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ======= 1) STACK BÁSICO =======
          _Seccion(
            titulo: "1) Stack básico (un widget encima de otro)",
            child: Stack(
              children: [
                Container(
                  height: 150,
                  color: Colors.blue[200],
                  alignment: Alignment.center,
                  child: const Text(
                    "Fondo",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  child: const Text(
                    "Encima",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ======= 2) STACK CON ALIGNS =======
          _Seccion(
            titulo: "2) Stack con Align (posiciones relativas)",
            child: Stack(
              children: [
                Container(
                  height: 200,
                  color: Colors.green[100],
                ),

                // Arriba izquierda
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(label: Text("Top Left")),
                  ),
                ),

                // Centro
                const Align(
                  alignment: Alignment.center,
                  child: Chip(label: Text("Center")),
                ),

                // Abajo derecha
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(label: Text("Bottom Right")),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ======= 3) STACK CON POSITIONED =======
          _Seccion(
            titulo: "3) Stack con Positioned",
            child: Stack(
              children: [
                Container(
                  height: 180,
                  color: Colors.orange[100],
                ),

                // Caja en la esquina superior derecha
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.red,
                    child: const Text(
                      "Pos 1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // Caja abajo centrada
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text(
                      "Pos 2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ======= 4) STACK DINÁMICO =======
          _Seccion(
            titulo: "4) Stack dinámico generado desde lista",
            child: Stack(
              children: _itemsDinamicos(),
            ),
          ),
        ],
      ),
    );
  }

  // Ejemplo de items generados dinámicamente en un Stack
  List<Widget> _itemsDinamicos() {
    final posiciones = [
      const Positioned(top: 10, left: 10, child: Icon(Icons.star, size: 40, color: Colors.amber)),
      const Positioned(top: 60, right: 20, child: Icon(Icons.favorite, size: 40, color: Colors.red)),
      const Positioned(bottom: 20, left: 60, child: Icon(Icons.circle, size: 40, color: Colors.blue)),
    ];

    return [
      Container(
        height: 200,
        color: Colors.purple[100],
      ),
      ...posiciones,
    ];
  }
}

// Reutilizable para mostrar título de sección
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
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}