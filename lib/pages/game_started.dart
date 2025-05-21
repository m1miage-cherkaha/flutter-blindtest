import 'package:blind_test/services/audioService.dart';
import 'package:blind_test/services/gameService.dart';
import 'package:blind_test/services/scoreService.dart';
import 'package:blind_test/widgets/background_layout.dart';
import 'package:flutter/material.dart';
import '../models/songs.dart';

class GameStarted extends StatefulWidget {
  final String songFolderPath;
  final String category;

  const GameStarted({
    Key? key,
    required this.songFolderPath,
    required this.category,
  }) : super(key: key);

  @override
  _GameStartedState createState() => _GameStartedState();
}

class _GameStartedState extends State<GameStarted> {
  late GameService _gameService;
  @override
  void initState() {
    super.initState();
    _gameService = GameService(scoreservice: Scoreservice());
    _gameService.initializeGame(widget.category, allSongs);

  }

  @override
  void dispose() {
    _gameService.dispose();
    super.dispose();
  }

  void _showGameOverDialog() async {
    final save = await _gameService.scoreservice.saveBestScore(_gameService.score);
    final bestScore = await _gameService.scoreservice.getBestScore();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Le jeu est terminé'),
        content: Text('Ton score: ${_gameService.score}/${_gameService.maxQuestions}\n'
        'Meilleur Score : $bestScore'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Retour à l\'accueil'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundLayout(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Écoute et devine la chanson ! 🎵',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _gameService.playCurrentSong,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
                child: Text(
                  'Réécouter la chanson 🔊',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              ..._gameService.possibleAnswers.map((song) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () => _gameService.checkAnswer(
                        song.title,
                        setState,
                        _showGameOverDialog,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: _gameService.selectedAnswer == song.title
                            ? (_gameService.isAnswerCorrect ? Colors.green : Colors.red)
                            : Colors.white,
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        song.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 40),
              Text(
                'Score: ${_gameService.score}/${_gameService.currentIndex + 1}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}