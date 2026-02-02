import 'package:flutter/material.dart';

class PantallaCuatroListas extends StatelessWidget {
  const PantallaCuatroListas({super.key});

  // Datos de ejemplo para las listas dinámicas
  List<String> get frutas => const ["Manzana", "Banana", "Naranja", "Kiwi", "Fresa", "Uva"];
  List<Color> get colores => const [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple, Colors.teal];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViews: 4 ejemplos'),
      ),

      // ListView principal que envuelve todas las secciones
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ====== 1) VERTICAL BÁSICA ======
          _Seccion(
            titulo: '1) ListView vertical básica',
            child: ListView(
              // Como está dentro de otro ListView, desactivamos su propio scroll
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true, // Permite que se mida según su contenido
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.red[100],
                  child: const Text('Elemento 1'),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.green[100],
                  child: const Text('Elemento 2'),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue[100],
                  child: const Text('Elemento 3'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ====== 2) HORIZONTAL BÁSICA ======
          _Seccion(
            titulo: '2) ListView horizontal básica',
            child: SizedBox(
              height: 120, // Necesario para listas horizontales
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _cardHorizontal(label: 'Item A', color: Colors.red[200]),
                  _gapH(),
                  _cardHorizontal(label: 'Item B', color: Colors.green[200]),
                  _gapH(),
                  _cardHorizontal(label: 'Item C', color: Colors.blue[200]),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ====== 3) VERTICAL DINÁMICA (builder) ======
          _Seccion(
            titulo: '3) ListView vertical dinámica (builder)',
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: frutas.length,
              itemBuilder: (context, index) {
                final fruta = frutas[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    fruta,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // ====== 4) HORIZONTAL DINÁMICA (builder) ======
          _Seccion(
            titulo: '4) ListView horizontal dinámica (builder)',
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colores.length,
                itemBuilder: (context, index) {
                  final color = colores[index];
                  return Row(
                    children: [
                      Container(
                        width: 140,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Color ${index + 1}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (index < colores.length - 1) _gapH(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tarjeta simple para la lista horizontal básica
  Widget _cardHorizontal({required String label, Color? color}) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: color ?? Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  // Separador horizontal entre items de listas horizontales
  Widget _gapH() => const SizedBox(width: 10);
}

// Widget reutilizable para el título de sección + contenido
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
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
