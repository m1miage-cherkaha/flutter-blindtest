
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
