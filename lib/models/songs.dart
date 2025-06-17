
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
  Song(path: 'assets/songs/rap/dkr.mp3', title: 'Booba - DKR', category: 'Rap',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rap/nekfeu.mp3', title: 'Nekfeu - On Verra', category: 'Rap',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rap/humain.mp3', title: 'Nekfeu - Humain', category: 'Rap',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rap/fusil.mp3', title: 'SCH - Fusil', category: 'Rap',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rap/LoupNoir.mp3', title: 'SCH - Loup Noir', category: 'Rap',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rai/cheb_khaled1.mp3', title: 'Cheb Khaled - Aïcha', category: 'Rai',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rai/cheb_mami2.mp3', title: 'Cheb Mami - Parisien du Nord', category: 'Rai',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rai/cheb_khaled_didi.mp3', title: 'Cheb Khaled - Didi', category: 'Rai',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rai/cheb_khaled_didi.mp3', title: 'Cheb Hasni - Matbkich', category: 'Rai',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rai/cheb_khaled_didi.mp3', title: 'Cheb Akil - Histoire qdima', category: 'Rai',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/rai/cheb_khaled_didi.mp3', title: 'Cheb Khaled - les Ailes', category: 'Rai',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/pop/ed_sheeran1.mp3', title: 'Ed Sheeran - Shape of You', category: 'Pop',imagePath: 'assets/images/rap.jpg'),
  Song(path: 'assets/songs/pop/dua_lipa2.mp3', title: 'Dua Lipa - Levitating', category: 'Pop',imagePath: 'assets/images/rap.jpg'),
  Song(path : 'assets/songs/2000/Gettin_over_you.mp3', title : 'David Guetta - Gettin over you', category : "2000's",imagePath: 'assets/images/2000/david_guetta.jpg'),
  Song(path : 'assets/songs/2000/Rock_your_body.mp3', title : 'Justin timberlake - Rock your body', category : "2000's",imagePath: 'assets/images/2000/timberlake.jpg'),
  Song(path : 'assets/songs/2000/Beggin.mp3', title : 'Madcon - Beggin', category : "2000's", imagePath: 'assets/images/2000/madcon.jpg'),
  Song(path : 'assets/songs/2000/Black_eyed_peas.mp3', title : 'Black Eyed Peas - I gotta feeling', category : "2000's", imagePath: 'assets/images/2000/black_eyed_peas.jpg'),
  Song(path : 'assets/songs/2000/Katy_perry.mp3', title : 'Katy Perry - Last Friday Night', category : "2000's",imagePath: 'assets/images/2000/katy_perry.jpg'),

];
