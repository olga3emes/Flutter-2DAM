import 'package:flutter/material.dart';

//myWidgets
// import 'package:prueba/screens/pantalla_richtext.dart';
// import 'package:prueba/screens/pantalla_container.dart';
// import 'package:prueba/screens/pantalla_column.dart';
// import 'package:prueba/screens/pantalla_row.dart';
// import 'package:prueba/screens/pantalla_containerImage.dart';
// import 'package:prueba/screens/pantalla_containerImage.dart';
// import 'package:prueba/screens/pantalla_elevatedButton.dart';
// import 'package:prueba/screens/pantalla_listView.dart';
import 'package:prueba/screens/pantalla_stacks.dart';

void main() {
  runApp(const MyApp());
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ejemplo Stacks',
      home: PantallaCuatroStacks(),
    );
  }

}

