import 'package:flutter/material.dart';

// Pantalla que demuestra el uso de Row
class PantallaRow extends StatelessWidget {
  const PantallaRow({super.key});
  @override
  Widget build(BuildContext context) {
    return
    const Row(
      children: <Widget>[
        Expanded(
          child: Text('Deliver features faster', textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
        ),
        Expanded(child: FlutterLogo()),
      ],
    );
  }
}
