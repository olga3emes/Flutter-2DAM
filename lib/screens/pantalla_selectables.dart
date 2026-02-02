import 'package:flutter/material.dart';

// -----------------------------------------------------------
// ACORDARME: El enum DEBE ir fuera de cualquier clase SIEMPRE
// -----------------------------------------------------------
enum Genero { masculino, femenino, otro }

class PantallaControlesSeleccion extends StatefulWidget {
  const PantallaControlesSeleccion({super.key});

  @override
  State<PantallaControlesSeleccion> createState() =>
      _PantallaControlesSeleccionState();
}

class _PantallaControlesSeleccionState
    extends State<PantallaControlesSeleccion> {
  // ---------------------------
  // Estado para Dropdowns
  // ---------------------------
  final List<String> _frutas = const ["Manzana", "Banana", "Kiwi", "Uva"];
  String? _frutaSeleccionada = "Manzana";
  String? _frutaForm;

  // ---------------------------
  // Estado para Checkbox
  // ---------------------------
  bool _aceptaTerminos = false;
  bool _notificaciones = true;

  // ---------------------------
  // Estado para Radio
  // ---------------------------
  Genero? _genero = Genero.masculino;

  // ---------------------------
  // Estado para Switch
  // ---------------------------
  bool _modoOscuro = false;
  bool _sincronizarDatos = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Controles: Dropdown, Check, Radio, Switch")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ====================================================
          // 1) DropdownButton básico
          // ====================================================
          _Seccion(
            titulo: "1) DropdownButton (básico)",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Selecciona una fruta:"),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: _frutaSeleccionada,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: _frutas
                        .map((f) => DropdownMenuItem(
                              value: f,
                              child: Text(f),
                            ))
                        .toList(),
                    onChanged: (valor) {
                      setState(() => _frutaSeleccionada = valor);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text("Actual: ${_frutaSeleccionada ?? '(nada)'}"),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ====================================================
          // 2) DropdownButtonFormField con validación
          // ====================================================
          _Seccion(
            titulo: "2) DropdownButtonFormField (form + validación)",
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _frutaForm,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: "Fruta preferida",
                      border: OutlineInputBorder(),
                    ),
                    items: _frutas
                        .map((f) => DropdownMenuItem(
                              value: f,
                              child: Text(f),
                            ))
                        .toList(),
                    onChanged: (v) => setState(() => _frutaForm = v),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? "Selecciona una fruta" : null,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      final ok = _formKey.currentState?.validate() ?? false;
                      if (ok) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("OK: $_frutaForm")),
                        );
                      }
                    },
                    child: const Text("Validar"),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          // ====================================================
          // 3) Checkbox
          // ====================================================
          _Seccion(
            titulo: "3) Checkbox",
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _aceptaTerminos,
                      onChanged: (v) =>
                          setState(() => _aceptaTerminos = v ?? false),
                    ),
                    const Expanded(
                      child: Text("Acepto términos y condiciones"),
                    ),
                  ],
                ),
                CheckboxListTile(
                  value: _notificaciones,
                  title: const Text("Notificaciones"),
                  subtitle: const Text("Recibir alertas"),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (v) =>
                      setState(() => _notificaciones = v ?? false),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ====================================================
          // 4) Radio
          // ====================================================
          _Seccion(
            titulo: "4) Radio / RadioListTile (corregido)",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Selecciona tu género:"),
                const SizedBox(height: 8),

                Wrap(
                  spacing: 20,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<Genero>(
                          value: Genero.masculino,
                          groupValue: _genero,
                          onChanged: (Genero? v) {
                            setState(() => _genero = v);
                          },
                        ),
                        const Text("Masculino"),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<Genero>(
                          value: Genero.femenino,
                          groupValue: _genero,
                          onChanged: (Genero? v) {
                            setState(() => _genero = v);
                          },
                        ),
                        const Text("Femenino"),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<Genero>(
                          value: Genero.otro,
                          groupValue: _genero,
                          onChanged: (Genero? v) {
                            setState(() => _genero = v);
                          },
                        ),
                        const Text("Otro"),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                RadioListTile<Genero>(
                  value: Genero.masculino,
                  groupValue: _genero,
                  onChanged: (Genero? v) => setState(() => _genero = v),
                  title: const Text("Masculino"),
                ),
                RadioListTile<Genero>(
                  value: Genero.femenino,
                  groupValue: _genero,
                  onChanged: (Genero? v) => setState(() => _genero = v),
                  title: const Text("Femenino"),
                ),
                RadioListTile<Genero>(
                  value: Genero.otro,
                  groupValue: _genero,
                  onChanged: (Genero? v) => setState(() => _genero = v),
                  title: const Text("Otro"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ====================================================
          // 5) Switch
          // ====================================================
          _Seccion(
            titulo: "5) Switch",
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("Modo oscuro"),
                    const Spacer(),
                    Switch(
                      value: _modoOscuro,
                      onChanged: (v) => setState(() => _modoOscuro = v),
                    ),
                  ],
                ),
                SwitchListTile(
                  value: _sincronizarDatos,
                  title: const Text("Sincronizar datos"),
                  subtitle: const Text("Actualiza en segundo plano"),
                  onChanged: (v) => setState(() => _sincronizarDatos = v),
                  secondary: const Icon(Icons.sync),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// Widget de sección reutilizable
// ------------------------------------------------------------
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