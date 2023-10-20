import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Tela Flutter'),
      ),
      body: PageView(
        children: <Widget>[
          Page1(),
          Page2(),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white, // Defina a cor desejada
          height: 10.0, // Defina a altura desejada
        ),
        // Título da primeira imagem
        Align(
          alignment: Alignment.center,
          child: Text(
            'Monalisa',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Ajuste o raio conforme necessário
          child: Image.asset(
            'assets/Monalisa.jpeg',
            width: 200, // Largura desejada
            height: 300, // Altura desejada
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16.0, bottom: 16.0), // Ajusta a margem para posicionar a linha
          child: Divider(), // Adiciona uma linha de separação
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0), // Ajuste as margens conforme necessário
            child: Text(
              'Monalisa também conhecida como A Gioconda ou ainda Mona Lisa del Giocondo é a mais notável e conhecida obra de Leonardo da Vinci, um dos mais eminentes homens do Renascimento italiano',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'athena.ttf',
              ),
              softWrap: true,
              maxLines: 10, // Defina o número de linhas desejado
            ),
          ),
        ),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white, // Defina a cor desejada
          height: 10.0, // Defina a altura desejada
        ),
        // Título da segunda imagem
        Align(
          alignment: Alignment.center,
          child: Text(
            'Leonardo Da Vinci',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Ajuste o raio conforme necessário
          child: Image.asset(
            'assets/Leonardo.jpeg', // Insira o caminho da outra imagem
            width: 200, // Largura desejada
            height: 300, // Altura desejada
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16.0, bottom: 16.0), // Ajusta a margem para posicionar a linha
          child: Divider(), // Adiciona uma linha de separação
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0), // Ajuste as margens conforme necessário
            child: Text(
              'Leonardo di Ser Piero da Vinci, ou simplesmente Leonardo da Vinci, foi um polímata nascido na atual Itália, uma das figuras mais importantes do Alto Renascimento, que se destacou como cientista, matemático, engenheiro, inventor, anatomista, pintor, escultor, arquiteto, botânico, poeta e músico',
              style: TextStyle(
                fontSize: 24,
              ),
              softWrap: true,
              maxLines: 10, // Defina o número de linhas desejado
            ),
          ),
        ),
      ],
    );
  }
}


