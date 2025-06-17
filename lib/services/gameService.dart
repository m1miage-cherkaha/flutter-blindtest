import 'package:blind_test/models/songs.dart';
import 'package:blind_test/services/audioService.dart';
import 'package:blind_test/services/scoreService.dart';

class GameService {
  static final GameService _instance = GameService._internal();
  factory GameService() => _instance;
  GameService._internal();

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
    currentIndex = 0;
    score = 0;
    selectedAnswer = '';
    isAnswerCorrect = false;
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
    print("Playing: ${currentSong.title}");
    await audioService.playCurrentSong(currentSong);
  }

  Future<bool> checkAnswer(String answer) async {
    selectedAnswer = answer;
    isAnswerCorrect = selectedAnswer == currentSong.title;

    if (isAnswerCorrect) {
      score++;
    }

    await Future.delayed(Duration(milliseconds: 1500));

    if (currentIndex < maxQuestions - 1) {
      currentIndex++;
      _loadNextSong();
      return false;
    } else {
      audioService.stop();
      await scoreService.saveBestScore(score);
      return true;
    }
  }

  void dispose() {
    audioService.stop();
  }
}
