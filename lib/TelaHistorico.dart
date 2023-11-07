import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historico'),
        backgroundColor: Colors.green.shade600,
      ),
      body: Center(
        child: Text('Esta é a segunda tela.'),
      ),
    );
  }
}
