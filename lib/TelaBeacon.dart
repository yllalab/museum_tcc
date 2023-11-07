import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: MyScreen(),
//    );
//  }
//}

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Tela Flutter'),
        backgroundColor: Colors.green.shade600, // Define a cor do AppBar
        actions: [
          FavoriteButton(), // Adicione o botão de favorito à barra de aplicativos
        ],
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

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false; // Inicialmente, a Monalisa não é favorita

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _showWelcomeDialog(); // Mostra o pop-up de boas-vindas após um pequeno atraso
    });
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('PARABEEEENNSSSS!!'),
          content: Text('Voce acaboude ganhar 50% de desconto na cantina do Instituto, de o codigo abaixo e ganhe seu desconto!!.'),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
          ],
        );
      },
    );
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Alternar o estado de favorito
      if (isFavorite) {
        // Adicione a Monalisa à lista de favoritos
        addToFavorites('Monalisa');
      } else {
        // Remova a Monalisa da lista de favoritos
        removeFromFavorites('Monalisa');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        color: isFavorite ? Colors.amber : null,
      ),
      onPressed: toggleFavorite,
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Arraste para mais informacoes', style: TextStyle(fontSize: 16)),
              Icon(Icons.arrow_forward),
            ],
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

List<String> favorites = []; // Lista de obras favoritas

void addToFavorites(String artwork) {
  favorites.add(artwork);
}

void removeFromFavorites(String artwork) {
  favorites.remove(artwork);
}



