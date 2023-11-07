import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TelaBeacon.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obras Favoritas'),
        backgroundColor: Colors.green.shade600, // Define a cor do AppBar
      ),
      body: ListView(
        children: favorites.map((favorite) {
          return ListTile(
            title: Text(favorite),
          );
        }).toList(),
      ),
    );
  }
}