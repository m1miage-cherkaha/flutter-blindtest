import 'package:blind_test/pages/background_layout.dart';
import 'package:flutter/material.dart';

class Song {
  final String path;
  final String title;
  final String category;

  Song({
    required this.path,
    required this.title,
    required this.category,
  });
}

// Liste de toutes les chansons
final List<Song> allSongs = [
  Song(path: 'assets/songs/rap/booba1.mp3', title: 'Booba - DKR', category: 'Rap'),
  Song(path: 'assets/songs/rap/nekfeu2.mp3', title: 'Nekfeu - On Verra', category: 'Rap'),
  Song(path: 'assets/songs/rap/nekfeu2.mp3', title: 'Nekfeu - Humain', category: 'Rap'),
  Song(path: 'assets/songs/rap/nekfeu2.mp3', title: 'Nekfeu - Ecrire', category: 'Rap'),
  Song(path: 'assets/songs/rap/nekfeu2.mp3', title: 'Nekfeu - Juste pour voir', category: 'Rap'),
  Song(path: 'assets/songs/rap/nekfeu2.mp3', title: 'SCH - Fusil', category: 'Rap'),
  Song(path: 'assets/songs/rap/nekfeu2.mp3', title: 'SCH - Pharmacie', category: 'Rap'),
  Song(path: 'assets/songs/rap/nekfeu2.mp3', title: 'SCH - Loup Noir', category: 'Rap'),
  Song(path: 'assets/songs/rap/nekfeu2.mp3', title: 'SCH - Allo Maman', category: 'Rap'),
  Song(path: 'assets/songs/rai/cheb_khaled1.mp3', title: 'Cheb Khaled - Aïcha', category: 'Rai'),
  Song(path: 'assets/songs/rai/cheb_mami2.mp3', title: 'Cheb Mami - Parisien du Nord', category: 'Rai'),
  Song(path: 'assets/songs/rai/cheb_khaled_didi.mp3', title: 'Cheb Khaled - Didi', category: 'Rai'),
  Song(path: 'assets/songs/rai/cheb_khaled_didi.mp3', title: 'Cheb Hasni - Matbkich', category: 'Rai'),
  Song(path: 'assets/songs/rai/cheb_khaled_didi.mp3', title: 'Cheb Akil - Histoire qdima', category: 'Rai'),
  Song(path: 'assets/songs/rai/cheb_khaled_didi.mp3', title: 'Cheb Khaled - les Ailes', category: 'Rai'),

  Song(path: 'assets/songs/pop/ed_sheeran1.mp3', title: 'Ed Sheeran - Shape of You', category: 'Pop'),
  Song(path: 'assets/songs/pop/dua_lipa2.mp3', title: 'Dua Lipa - Levitating', category: 'Pop'),
];

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
  late List<Song> categorySongs;
  late Song currentSong;
  late List<Song> possibleAnswers;
  int currentIndex = 0;
  int score = 0;
  String selectedAnswer = '';
  bool isAnswerCorrect = false;

  @override
  void initState() {
    super.initState();

    // Récupérer les chansons de la catégorie choisie
    categorySongs = allSongs.where((song) => song.category == widget.category).toList();
    // Mélanger les chansons une fois
    categorySongs.shuffle();

    // Charger la première chanson
    currentSong = categorySongs[currentIndex];
    // Sélectionner 4 chansons possibles, y compris la bonne chanson
    possibleAnswers = List.from(categorySongs);
    possibleAnswers.shuffle();
    possibleAnswers = possibleAnswers.take(4).toList();

    // S'assurer que la bonne chanson est parmi les réponses possibles
    if (!possibleAnswers.contains(currentSong)) {
      possibleAnswers[0] = currentSong;
      possibleAnswers.shuffle(); // Mélanger de nouveau pour que la bonne chanson ne soit pas toujours en premier
    }
  }

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      isAnswerCorrect = selectedAnswer == currentSong.title;

      if (isAnswerCorrect) {
        score++;
      }

      Future.delayed(Duration(seconds: 1), () {
        if (currentIndex < 4) {
          currentIndex++;
          currentSong = categorySongs[currentIndex];
          possibleAnswers = List.from(categorySongs);
          possibleAnswers.shuffle();
          possibleAnswers = possibleAnswers.take(4).toList();

          if (!possibleAnswers.contains(currentSong)) {
            possibleAnswers[0] = currentSong;
            possibleAnswers.shuffle();
          }

          selectedAnswer = '';
          isAnswerCorrect = false;
          setState(() {});
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Le jeu est terminé'),
              content: Text('Ton score: $score/5'),
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
      });
    });
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
                  'Chanson à deviner: ${currentSong.title}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Affichage des réponses possibles
              ...possibleAnswers.map((song) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () => checkAnswer(song.title),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: selectedAnswer == song.title
                            ? (isAnswerCorrect ? Colors.green : Colors.red)
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
              // Affichage du score
              Text(
                'Score: $score/${currentIndex + 1}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
