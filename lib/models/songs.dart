
class Song {
  final String path;
  final String title;
  final String category;
  final String imagePath;

  Song({
    required this.path,
    required this.title,
    required this.category,
    required this.imagePath
  });
}

final List<Song> allSongs = [
  Song(path : 'assets/songs/2000/Gettin_over_you.mp3', title : 'David Guetta - Gettin over you', category : "2000's",imagePath: 'assets/images/2000/david_guetta.jpg'),
  Song(path : 'assets/songs/2000/Rock_your_body.mp3', title : 'Justin timberlake - Rock your body', category : "2000's",imagePath: 'assets/images/2000/timberlake.jpg'),
  Song(path : 'assets/songs/2000/Beggin.mp3', title : 'Madcon - Beggin', category : "2000's", imagePath: 'assets/images/2000/madcon.jpg'),
  Song(path : 'assets/songs/2000/Black_eyed_peas.mp3', title : 'Black Eyed Peas - I gotta feeling', category : "2000's", imagePath: 'assets/images/2000/black_eyed_peas.jpg'),
  Song(path : 'assets/songs/2000/Katy_perry.mp3', title : 'Katy Perry - Last Friday Night', category : "2000's",imagePath: 'assets/images/2000/katy_perry.jpg'),
  Song(path : 'assets/songs/pop/brittney_spears.mp3', title : 'Britney Spears - Gimme more', category : "Pop",imagePath: 'assets/images/pop/brittney_spears.jpg'),
  Song(path : 'assets/songs/pop/dua_lipa.mp3', title : 'Dua Lipa - Levitating', category : "Pop",imagePath: 'assets/images/pop/dua_lipa.jpg'),
  Song(path : 'assets/songs/pop/inna.mp3', title : 'Inna - Amazing', category : "Pop",imagePath: 'assets/images/pop/inna.jpg'),
  Song(path : 'assets/songs/pop/lady_gaga.mp3', title : 'Lady gaga - Poker face', category : "Pop",imagePath: 'assets/images/pop/lady_gaga.jpg'),
  Song(path : 'assets/songs/pop/madonna.mp3', title : 'Madonna - Hung up', category : "Pop",imagePath: 'assets/images/pop/madonna.jpg'),

];
