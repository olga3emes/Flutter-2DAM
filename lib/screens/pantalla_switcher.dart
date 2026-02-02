import 'package:flutter/material.dart';

class PantallaAnimatedSwitcher extends StatefulWidget {
  const PantallaAnimatedSwitcher({super.key});

  @override
  State<PantallaAnimatedSwitcher> createState() =>
      _PantallaAnimatedSwitcherState();
}

class _PantallaAnimatedSwitcherState
    extends State<PantallaAnimatedSwitcher> {
  bool mostrarTexto = true;
  bool mostrarImagen1 = true;
  bool botonEstado = true;
  bool mostrarCaja = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedSwitcher: ejemplos completos")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          //--------------------------------------------------------------
          // 1) EJEMPLO BÁSICO
          //--------------------------------------------------------------
          _Seccion(
            titulo: "1) Ejemplo básico",
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: mostrarTexto
                      ? const Text(
                          "Hola 😊",
                          key: ValueKey(1),
                          style: TextStyle(fontSize: 28),
                        )
                      : const Icon(
                          Icons.favorite,
                          key: ValueKey(2),
                          color: Colors.red,
                          size: 50,
                        ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() => mostrarTexto = !mostrarTexto);
                  },
                  child: const Text("Cambiar"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          //--------------------------------------------------------------
          // 2) Versión avanzada: cambio entre imágenes
          //--------------------------------------------------------------
          _Seccion(
            titulo: "2) Cambiar imágenes (fade + scale)",
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(scale: animation, child: child),
                  ),
                  child: mostrarImagen1
                      ? Image.network(
                          "https://picsum.photos/200",
                          key: const ValueKey("img1"),
                          width: 150,
                          height: 150,
                        )
                      : Image.network(
                          "https://picsum.photos/201",
                          key: const ValueKey("img2"),
                          width: 150,
                          height: 150,
                        ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() => mostrarImagen1 = !mostrarImagen1);
                  },
                  child: const Text("Cambiar imagen"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          //--------------------------------------------------------------
          // 3) Versión avanzada: botones que cambian forma/color
          //--------------------------------------------------------------
          _Seccion(
            titulo: "3) Botón animado (cambia forma, tamaño y color)",
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: botonEstado
                      ? Container(
                          key: const ValueKey("btn1"),
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Botón Azul",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Container(
                          key: const ValueKey("btn2"),
                          width: 140,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Botón Naranja",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() => botonEstado = !botonEstado);
                  },
                  child: const Text("Cambiar botón"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          //--------------------------------------------------------------
          // 4) Versión avanzada: Slide Animation (deslizar)
          //--------------------------------------------------------------
          _Seccion(
            titulo: "4) Slide Animation (animación de desplazamiento)",
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    final offsetAnimation =
                        Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                            .animate(animation);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  child: mostrarCaja
                      ? Container(
                          key: const ValueKey("slide1"),
                          width: 140,
                          height: 60,
                          color: Colors.teal,
                          alignment: Alignment.center,
                          child: const Text(
                            "Caja 1",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Container(
                          key: const ValueKey("slide2"),
                          width: 140,
                          height: 60,
                          color: Colors.purple,
                          alignment: Alignment.center,
                          child: const Text(
                            "Caja 2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() => mostrarCaja = !mostrarCaja);
                  },
                  child: const Text("Cambiar caja"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//--------------------------------------------------------------
// Widget reutilizable del estilo de tus pantallas
//--------------------------------------------------------------
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
