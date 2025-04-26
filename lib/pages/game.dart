import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Game Page')),
      body: const Center(child: Text('Ici commence ton test musical !')),
    );
  }
}
