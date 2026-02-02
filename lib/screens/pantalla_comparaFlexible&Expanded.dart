import 'package:flutter/material.dart';

class PantallaExpandedFlexible extends StatefulWidget {
  const PantallaExpandedFlexible({super.key});

  @override
  State<PantallaExpandedFlexible> createState() =>
      _PantallaExpandedFlexibleState();
}

class _PantallaExpandedFlexibleState
    extends State<PantallaExpandedFlexible> {
  double size = 40; // tamaño del hijo (cambia con el slider)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expanded vs Flexible (Animado)")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          
          // SLIDER para modificar tamaño del hijo
         
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tamaño del hijo (negro):",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Slider(
                min: 20,
                max: 200,
                value: size,
                onChanged: (value) {
                  setState(() => size = value);
                },
              ),
              Text("Tamaño actual: ${size.toStringAsFixed(0)} px"),
            ],
          ),

          const SizedBox(height: 30),

          
          // 1) ROW animado: Expanded vs Flexible
         
          _Seccion(
            titulo: "1) En un Row (horizontal):\nExpanded estira, Flexible respeta",
            child: Row(
              children: [
                // EXPANDED: fuerza el ancho, ignora el tamaño del hijo
                Expanded(
                  child: Container(
                    height: 70,
                    color: Colors.blue,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: size,   // será ignorado por Expanded
                      color: const Color.fromARGB(255, 242, 29, 29),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // FLEXIBLE: respeta el tamaño del hijo
                Flexible(
                  child: Container(
                    height: 70,
                    color: Colors.green,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: size,   // Flexible lo respeta
                      color: const Color.fromARGB(255, 23, 171, 53),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          
          // 2) COLUMN animado: Expanded vs Flexible
       
          _Seccion(
            titulo: "2) En una Column (vertical):\nExpanded estira, Flexible respeta",
            child: SizedBox(
              height: 250,
              child: Column(
                children: [
                  // EXPANDED: fuerza alto
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: size,  // ignorado por Expanded
                        color: const Color.fromARGB(255, 167, 128, 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // FLEXIBLE: respeta alto
                  Flexible(
                    child: Container(
                      color: Colors.red,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: size,  // Flexible lo respeta
                        color: const Color.fromARGB(255, 202, 45, 150),
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


//---------------------------------------------
// REUTILIZABLE (lo mismo que hago con las pantallas, pero solo para este fichero)
//---------------------------------------------
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