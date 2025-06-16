import 'package:blind_test/services/gameService.dart';
import 'package:blind_test/widgets/background_layout.dart';
import 'package:blind_test/widgets/countdowntimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/songs.dart';

class GameStarted extends StatefulWidget {
  final String songFolderPath;
  final String category;
  final String level;

  const GameStarted({
    Key? key,
    required this.songFolderPath,
    required this.category,
    required this.level,
  }) : super(key: key);

  @override
  _GameStartedState createState() => _GameStartedState();
}

class _GameStartedState extends State<GameStarted> {
  late final GameService _gameService;

  @override
  void initState() {
    super.initState();
    _gameService = GameService();
    _gameService.initializeGame(widget.category, allSongs);
  }

  @override
  void dispose() {
    _gameService.dispose();
    super.dispose();
  }

  void _showGameOverDialog() async {
    final bestScore = await _gameService.scoreService.getBestScore();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Le jeu est terminé',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Score : ${_gameService.score}/${_gameService.maxQuestions}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Meilleur score : $bestScore',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Rejouer'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Ferme le dialog
                  Navigator.pop(context); // GameStarted
                  Navigator.pop(context); // Game
                },
                child: Text('Accueil'),
              ),
            ],
          ),
    );
  }

  void _handleAnswer(String answer) async {
    setState(() {});

    bool isGameOver = await _gameService.checkAnswer(answer);

    setState(() {});

    if (isGameOver) {
      _showGameOverDialog();
    }
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  widget.level == "Difficile"
                      ?
                      //Timer
                      CountdownTimer(
                        key: ValueKey(_gameService.currentIndex),
                        duration: 20,
                        onFinished: () {
                          if (_gameService.selectedAnswer == '') {
                            _handleAnswer('');
                          }
                        },
                      )
                      : ElevatedButton(
                        onPressed: _gameService.playCurrentSong,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                        child : SvgPicture.asset('assets/icons/music_replay.svg',
                          height: 28,
                          width: 28,
                          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),)
                        // child: const Icon(Icons.refresh_rounded, size: 28),
                      ),
                ],
              ),
              const SizedBox(height: 20),

              ..._gameService.possibleAnswers.map((song) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: SizedBox(
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () => _handleAnswer(song.title),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor:
                              _gameService.selectedAnswer == song.title
                                  ? (_gameService.isAnswerCorrect
                                      ? Colors.green
                                      : Colors.red)
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
