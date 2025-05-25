import 'package:shared_preferences/shared_preferences.dart';

class Scoreservice{

  //SINGLETON
  static final Scoreservice _sharedInstance = Scoreservice._internal();
  factory Scoreservice()  => _sharedInstance;
  Scoreservice._internal();

  static const String _bestScoreKey = 'best_score';

  Future<int> saveBestScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    final currentBestScore = await getBestScore();
    if(score > currentBestScore){
      await prefs.setInt(_bestScoreKey, score);
      return score;
    }
    return currentBestScore;
  }

  Future<int> getBestScore() async {
    final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(_bestScoreKey) ?? 0;
}

  Future<void> resetBestScore() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(_bestScoreKey);
   }

}