import 'package:flutter/material.dart';
import 'TelaBeacon2.dart';
import 'TelaFavoritos.dart';
import 'TelaHistorico.dart';
import 'TelaBeacon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//g0ZHUr9J0n7giTVgrTtF

Future<void> main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
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
          title: Text('Bem-vindo ao Meu App'),
          content: Text('Esta é a mensagem de boas-vindas.'),
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

  void _navigateToSecondScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SegundaTela()));
  }
  void _navigateThirdScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoritesScreen()));
  }
  void _navigateBeaconScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyScreen()));
  }
  void _navigateBeaconScreen2(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyScreen2()));
  }

  void registrarAcessoPagina() async {
    try {
      // Inicialize o Firebase, se ainda não estiver inicializado
      await Firebase.initializeApp();
      // Crie uma referência para a coleção "acessos" no Firestore
      CollectionReference acessosCollection = FirebaseFirestore.instance.collection('historico');

      // Crie um documento com um campo de data/hora registrando o acesso à página
      await acessosCollection.add({
        'pagina': 'Pagina 3',
        'data_acesso': FieldValue.serverTimestamp(),
      });
      // Mostre uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Acesso registrado com sucesso!'),
      ));
    } catch (e) {
      // Lida com erros, se houver algum
      print('Erro ao registrar acesso: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao registrar acesso.'),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Museuml'),
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
                    title: Text('Historico'),
                    onTap: () {
                      _navigateToSecondScreen();
                    },
                  ),
                  ListTile(
                    title: Text('Favoritos'),
                    onTap: () {
                      _navigateThirdScreen();
                    },
                  ),
                  ListTile(
                    title: Text('Opção 3'),
                    onTap: () {
                      _navigateBeaconScreen();
                      registrarAcessoPagina();
                    },
                  ),
                  ListTile(
                    title: Text('Opção 4'),
                    onTap: () {
                      _navigateBeaconScreen2();
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
