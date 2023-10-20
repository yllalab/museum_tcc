import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela com Menu Lateral'),
        backgroundColor: Colors.green.shade600, // Define a cor do AppBar
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              setState(() {
                isMenuOpen = !isMenuOpen;
              });
            },
          ),
      ),
      backgroundColor: Colors.white, // Defina o fundo como branco
      body: Stack(
        children: [
          // Conteúdo da tela
          Center(
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/gif.gif'),
            ),
          ),
          // Menu lateral
          if (isMenuOpen)
            Container(
              width: 200,
              color: Colors.green.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Opção 12'),
                    onTap: () {
                      // Adicione a lógica para a Opção 1 aqui
                    },
                  ),
                  ListTile(
                    title: Text('Opção 2'),
                    onTap: () {
                      // Adicione a lógica para a Opção 2 aqui
                    },
                  ),
                  ListTile(
                    title: Text('Opção 3'),
                    onTap: () {
                      // Adicione a lógica para a Opção 3 aqui
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
