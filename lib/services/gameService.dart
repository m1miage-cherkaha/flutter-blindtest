import 'package:blind_test/models/songs.dart';
import 'package:blind_test/services/audioService.dart';
import 'package:blind_test/services/scoreService.dart';

class GameService {
  final Scoreservice scoreService = Scoreservice();
  final AudioService audioService = AudioService();
  List<Song> categorySongs = [];
  late Song currentSong;
  List<Song> possibleAnswers = [];
  int currentIndex = 0;
  int score = 0;
  String selectedAnswer = '';
  bool isAnswerCorrect = false;
  final int maxQuestions = 5;

  void initializeGame(String category, List<Song> allSongs) {
    categorySongs = allSongs.where((song) => song.category == category).toList();
    categorySongs.shuffle();
    _loadNextSong();
  }

  void _loadNextSong() {
    if (currentIndex < categorySongs.length) {
      currentSong = categorySongs[currentIndex];
      possibleAnswers = List.from(categorySongs)..shuffle();
      possibleAnswers = possibleAnswers.take(4).toList();

      if (!possibleAnswers.contains(currentSong)) {
        possibleAnswers[0] = currentSong;
        possibleAnswers.shuffle();
      }
      selectedAnswer = '';
      isAnswerCorrect = false;
      playCurrentSong();
    }
  }

  Future<void> playCurrentSong() async {
    await audioService.playCurrentSong(currentSong);
  }

  void checkAnswer(String answer, Function setState, Function showGameOver) {
    selectedAnswer = answer;
    isAnswerCorrect = selectedAnswer == currentSong.title;

    if (isAnswerCorrect) {
      score++;
    }

    setState(() {});

    Future.delayed(Duration(seconds: 1), () {
      if (currentIndex < maxQuestions - 1) {
        currentIndex++;
        _loadNextSong();
        setState(() {});
      } else {
        audioService.stop();
        scoreService.saveBestScore(score);
        showGameOver();
      }
    });
  }

  bool isGameOver() {
    return currentIndex >= maxQuestions - 1;
  }

  void dispose() {
    audioService.dispose();
  }
}