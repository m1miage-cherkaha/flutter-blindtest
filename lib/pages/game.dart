import 'package:blind_test/pages/game_started.dart';
import 'package:flutter/material.dart';
import '../widgets/background_layout.dart';
import 'game_started.dart';

class Game extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BackgroundLayout(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 70), // Réduit l'espace du haut
          child: Column(
            children: [
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Image.asset(
                        imagePath,
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
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameStarted(
                        songFolderPath: songFolderPath, category : title,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
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
