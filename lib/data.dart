import 'package:flute_music_player/flute_music_player.dart';
import 'dart:async';

MusicFinder audioPlayer = new MusicFinder();
List<Song> songs;
List<Song> currentPlaylist;
var isPlaying = false;
var indexbackup;
var isPaused = false;
var isStopped = true;
Song currentSong;
Song previousSong;
Song nextSong;
String album;
String artist;

Future play(String uri) async {
  audioPlayer.play(uri, isLocal: true);
  isPlaying = true;
  isStopped = false;
}

pause() async {
  audioPlayer.pause();
  isPlaying = false;
  isPaused = true;
  isStopped = false;
}

stop() async {
  audioPlayer.stop();
  isStopped = true;
}

Song nextsong(List<Song> songs, Song currentSong, int index) {
  int nextindex;
  if (index == songs.length - 1) {
    return songs[index];
  } else {
    for (int i = 0; i < songs.length; i++) {
      if (songs[i].title == currentSong.title) nextindex = i + 1;
    }
    return songs[nextindex];
  }
}

Song prevsong(List<Song> songs, Song currentSong, int index) {
  int previndex;
  if (index == 0) {
    return songs[0];
  } else {
    for (int i = 0; i < songs.length; i++) {
      if (songs[i].title == currentSong.title) previndex = i - 1;
    }
    return songs[previndex];
  }
}
