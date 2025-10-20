import 'package:audioplayers/audioplayers.dart';
import "dart:async";

import 'package:flutter/foundation.dart';

class AppPlayer {
  late AudioPlayer audioPlayer;
  late AudioCache _audioCache;

  //private named constructor
  AppPlayer._() {
    audioPlayer = AudioPlayer();
    _audioCache = AudioCache();
    if (kDebugMode) {
      print("init audio");
    }
  }

  //static private Instance
  static AppPlayer? _instance;

  //default constructor
  factory AppPlayer() {
    _instance ??= AppPlayer._();

    return _instance!;
  }

  Future<void> playAudio(String fileName) async {
    Uri uri = await _audioCache.load(fileName);
    await audioPlayer.play(UrlSource(uri.path));
  }

  void disposeAudio() {
    _audioCache.clearAll();
    audioPlayer.dispose();
  }

  PlayerState getAudioState() {
    return audioPlayer.state;
  }

  Future<void> resumeAudio() async {
    await audioPlayer.resume();
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  Future<Duration> getDuration() async {
    var duration = await audioPlayer.getDuration();
    return duration ?? Duration();
  }

  Future<void> changeCurrentTime(Duration dur) async {
    await audioPlayer.seek(dur);
   }
}
