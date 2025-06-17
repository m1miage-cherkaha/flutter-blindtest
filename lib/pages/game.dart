import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/background_layout.dart';
import 'game_started.dart';

class Game extends StatefulWidget {
  final String title;
  final String imagePath;
  final String songFolderPath;

  const Game({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.songFolderPath,
  }) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return BackgroundLayout(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Bouton retour
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // Image Card
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.imagePath,
                        width: 300,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: 300,
                        height: 350,
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Mode : ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  CupertinoSlidingSegmentedControl<int>(
                    backgroundColor: Colors.white,
                    thumbColor: this.groupValue == 0 ? Colors.green : Colors.red,
                    groupValue: groupValue,
                    children: {0: Text('Facile'), 1: Text('Difficile')},
                    onValueChanged: (groupValue) {
                      setState(() => this.groupValue = groupValue);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Bouton "Commencer"
              ElevatedButton(
                onPressed: () {
                  final selectedLevel = groupValue == 0 ? 'Facile' : 'Difficile';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => GameStarted(
                            songFolderPath: widget.songFolderPath,
                            category: widget.title,
                            level : selectedLevel
                          ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 20,
                  ),
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Commencer le test',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
