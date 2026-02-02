import 'package:flutter/material.dart';

// Pantalla que demuestra el uso de Column
class PantallaColumn extends StatelessWidget {
  const PantallaColumn({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text('Deliver features faster'),
        Text('Craft beautiful UIs'),
        Expanded(child: FittedBox(child: FlutterLogo())),
      ],
    );
  }
}
