import 'package:audioplayers/audioplayers.dart';
import '../models/songs.dart';

class AudioService {

  static final AudioService _sharedInstance =  AudioService._internal();
  factory AudioService() => _sharedInstance;
  AudioService._internal();

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playCurrentSong(Song song) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(song.path.replaceFirst('assets/', '')));
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  void stop() {
    _audioPlayer.stop();
  }

}