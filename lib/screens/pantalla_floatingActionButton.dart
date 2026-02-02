import 'package:flutter/material.dart';

class PantallaFAB extends StatefulWidget {
  const PantallaFAB({super.key});

  @override
  State<PantallaFAB> createState() => _PantallaFABState();
}

class _PantallaFABState extends State<PantallaFAB> {
  bool cambiarIcono = true;
  bool mostrarMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FloatingActionButton: Ejemplos completos")),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          // ============================================================
          // 1) FAB BÁSICO
          // ============================================================
          _Seccion(
            titulo: "1) FAB básico",
            child: Center(
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green,
                child: const Icon(Icons.thumb_up),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // ============================================================
          // 2) FAB ANIMADO
          // ============================================================
          _Seccion(
            titulo: "2) FAB animado (AnimatedSwitcher)",
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: FloatingActionButton(
                    key: ValueKey(cambiarIcono),
                    shape: const CircleBorder(),
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      setState(() => cambiarIcono = !cambiarIcono);
                    },
                    child: Icon(
                      cambiarIcono ? Icons.play_arrow : Icons.pause,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Presiona para alternar icono"),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // ============================================================
          // 3) FAB EXTENDIDO
          // ============================================================
          _Seccion(
            titulo: "3) FloatingActionButton.extended",
            child: Center(
              child: FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: const Color.fromARGB(255, 220, 176, 228),
                icon: const Icon(Icons.send),
                label: const Text("Enviar"),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // ============================================================
          // 4) SPEED DIAL CASERO (CORREGIDO Y VISIBLE)
          // ============================================================
          _Seccion(
            titulo: "4) Speed Dial casero ",
            child: SizedBox(
              height: 250,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [

                  // Fondo si el menú está abierto
                  if (mostrarMenu)
                    GestureDetector(
                      onTap: () => setState(() => mostrarMenu = false),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: mostrarMenu ? 0.3 : 0,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    ),

                  // FABs del menú
                  Positioned(
                    bottom: 140,
                    right: 20,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: mostrarMenu ? 1 : 0,
                      child: AnimatedSlide(
                        offset: mostrarMenu ? Offset.zero : const Offset(0.2, 0.2),
                        duration: const Duration(milliseconds: 250),
                        child: FloatingActionButton(
                          heroTag: "fab_1",
                          mini: true,
                          backgroundColor: Colors.purple,
                          onPressed: () {},
                          child: const Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 80,
                    right: 20,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: mostrarMenu ? 1 : 0,
                      child: AnimatedSlide(
                        offset: mostrarMenu ? Offset.zero : const Offset(0.2, 0.2),
                        duration: const Duration(milliseconds: 250),
                        child: FloatingActionButton(
                          heroTag: "fab_2",
                          mini: true,
                          backgroundColor: Colors.orange,
                          onPressed: () {},
                          child: const Icon(Icons.share),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    right: 80,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: mostrarMenu ? 1 : 0,
                      child: AnimatedSlide(
                        offset: mostrarMenu ? Offset.zero : const Offset(0.2, 0.2),
                        duration: const Duration(milliseconds: 250),
                        child: FloatingActionButton(
                          heroTag: "fab_3",
                          mini: true,
                          backgroundColor: Colors.green,
                          onPressed: () {},
                          child: const Icon(Icons.chat),
                        ),
                      ),
                    ),
                  ),

                  // FAB principal
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      heroTag: "fab_main",
                      backgroundColor: Colors.red,
                      onPressed: () {
                        setState(() => mostrarMenu = !mostrarMenu);
                      },
                      child: Icon(
                        mostrarMenu ? Icons.close : Icons.menu,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // ============================================================
          // 5) FAB DOCKED CON BottomAppBar
          // ============================================================
          _Seccion(
            titulo: "5) FAB + BottomAppBar (Docked)",
            child: SizedBox(
              height: 160,
              child: Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 101, 101, 101),
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add, color: Colors.white,),
                ),
                bottomNavigationBar: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 20,
                  height: 60,
                  color: const Color.fromARGB(255, 101, 101, 101),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.home, color: Colors.white),
                      Icon(Icons.search, color: Colors.white),
                      SizedBox(width: 40), // espacio para el FAB
                      Icon(Icons.notifications, color: Colors.white),
                      Icon(Icons.person, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// ============================================================
// Widget reutilizable
// ============================================================
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