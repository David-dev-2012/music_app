import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/app_player.dart';
import 'package:music_app/core/resources/utils.dart';

import '../model/recently_played_model.dart';

class NowPlayingController {
  final BuildContext context;
  late RecentlyPlayedModel recentlyPlayedModel;
  bool _isPlaying = false;
  late StreamController<bool> _isPlayingStreamController;
  late Sink<bool> _isPlayingInput;
  late Stream<bool> isPlayingOutput;
  PlayerState? _playerState;
  late AppPlayer appPlayer;
  String audioTime = "";
  late StreamController<String> _audioTimeStreamController;
  late Sink<String> _audioTimeInputData;
  late Stream<String> audioTimeOutPut;

  late Duration _audioDuration;

  late StreamController<String> _streamControllerDurationNow;
  late Sink<String> _streamControllerInputDurationNow;
  late Stream<String> streamControllerOutPitDurationNow;
  late StreamController<double> _streamControllerDuSlider;
  late Sink<double> inputSlider;
  late Stream<double> outPitSlider;

  late StreamController<RecentlyPlayedModel>
  _streamControllerRecentlyPlayedModel;
  late Sink<RecentlyPlayedModel> inputRecentlyPlayedModel;
  late Stream<RecentlyPlayedModel> outputRecentlyPlayedModel;

  NowPlayingController({required this.context}) {
    _init();
  }

  void _initStreams() {
    _streamControllerDurationNow = StreamController();
    _streamControllerInputDurationNow = _streamControllerDurationNow.sink;
    streamControllerOutPitDurationNow = _streamControllerDurationNow.stream;
    _streamControllerDuSlider = StreamController();
    inputSlider = _streamControllerDuSlider.sink;
    outPitSlider = _streamControllerDuSlider.stream;
    _streamControllerRecentlyPlayedModel = StreamController();
    inputRecentlyPlayedModel = _streamControllerRecentlyPlayedModel.sink;
    outputRecentlyPlayedModel = _streamControllerRecentlyPlayedModel.stream;
  }

  void _disposeStreams() {
    _streamControllerDurationNow.close();
    _streamControllerInputDurationNow.close();
    inputSlider.close();
    _streamControllerDuSlider.close();
    inputRecentlyPlayedModel.close();
    _streamControllerRecentlyPlayedModel.close();
  }

  double valueOfSlider = 0;

  void getCurrentPosition() async {
    appPlayer.audioPlayer.onPositionChanged.listen((event) {
      valueOfSlider = event.inMilliseconds / _audioDuration.inMilliseconds;
      inputSlider.add(valueOfSlider);
      _streamControllerInputDurationNow.add(transferDurationIntoTime(event));
    });
  }

  void changeCurrentSlider(double value) {
    valueOfSlider = value;
    var p = (_audioDuration.inMilliseconds * valueOfSlider)
        .toString()
        .split(".")[0]
        .toInt();
    appPlayer.changeCurrentTime(Duration(milliseconds: p));
    // _streamControllerInputSlider.add(valueOfSlider);
  }

  void _init() {
    //init controllers
    _initControllers();
    _initStreams();
    //init app player
    appPlayer = AppPlayer();
  }

  void _initControllers() {
    _isPlayingStreamController = StreamController();
    _isPlayingInput = _isPlayingStreamController.sink;
    isPlayingOutput = _isPlayingStreamController.stream;
    //init audioTimeOutPut

    _audioTimeStreamController = StreamController();
    _audioTimeInputData = _audioTimeStreamController.sink;
    audioTimeOutPut = _audioTimeStreamController.stream;
  }

  void dispose() {
    //dispose controllers
    _disposeController();
  }

  void _disposeController() {
    _isPlayingInput.close();
    _isPlayingStreamController.close();
    _disposeStreams();
  }

  int? currentIndex;
  int newCurrentIndex = -1;

  void getIndexArguments() {
    Map<String, int> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    // {
    //                       "playedCurrentIndex": currentIndex ?? -1,
    //                       "newCurrentIndex": index,
    //                     }
    int playedCurrentIndex = args["playedCurrentIndex"] as int;
    newCurrentIndex = args["newCurrentIndex"] as int;
    recentlyPlayedModel = Utils.listRecentlyPlayed[newCurrentIndex];
    inputRecentlyPlayedModel.add(recentlyPlayedModel);
    if (playedCurrentIndex == newCurrentIndex) {
      //the same song
      onTapAtPlayAndStopMusic();
    } else {
      //now playing new music
      _playMusic();
    }
    // if (args[] is int) {
    //
    //   currentIndex = args;
    //   //play Music
    //   onTapAtPlayAndStopMusic();
    // }
  }

  Future<void> _playMusic() async {
    await appPlayer.playAudio(recentlyPlayedModel.path);
    _audioDuration = await appPlayer.getDuration();
    audioTime = transferDurationIntoTime(_audioDuration);
    getCurrentPosition();
    _updateAudioDuration();
    _isPlaying = true;
    _updateIsPlayingStatus();
  }

  void _updateAudioDuration() {
    _audioTimeInputData.add(audioTime);
  }

  void onTapAtPlayAndStopMusic() async {
    _playerState = appPlayer.getAudioState();
    print("before : $_playerState");
    switch (_playerState) {
      case null:
        await _playMusic();
      case PlayerState.stopped:
        await _playMusic();

      case PlayerState.paused:
        //now will complete   audio
        appPlayer.resumeAudio();
        _isPlaying = true;

      case PlayerState.playing:
        //now will stop
        appPlayer.pauseAudio();
        _isPlaying = false;
      case PlayerState.completed:
      case PlayerState.disposed:
    }
    //update
    _updateIsPlayingStatus();
    _playerState = appPlayer.getAudioState();
    print("after : $_playerState");
  }

  void _updateIsPlayingStatus() {
    _isPlayingInput.add(_isPlaying);
  }

  void goToNextSong() {
    //3
    //index = 2
    if (newCurrentIndex == Utils.listRecentlyPlayed.length - 1) {
      newCurrentIndex = 0;
    } else {
      newCurrentIndex++;
    }
    recentlyPlayedModel = Utils.listRecentlyPlayed[newCurrentIndex];
    inputRecentlyPlayedModel.add(recentlyPlayedModel);

    //now playing new music
    _playMusic();
  }

  void goToPreviousSong() {
    //3
    //index = 2
    print("newCurrentIndex $newCurrentIndex");
    if (newCurrentIndex == 0) {
      newCurrentIndex = Utils.listRecentlyPlayed.length - 1;
    } else {
      newCurrentIndex--;
    }
    recentlyPlayedModel = Utils.listRecentlyPlayed[newCurrentIndex];
    inputRecentlyPlayedModel.add(recentlyPlayedModel);

    //now playing new music
    _playMusic();
  }
  void startLoop(){
    appPlayer.audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

}

String transferDurationIntoTime(Duration duration) {
  String time = "";
  String hours = (duration.inSeconds / (60 * 60)).toInt().toString().padLeft(
    2,
    " 0",
  );
  String minute = (duration.inSeconds / 60).toInt().toString().padLeft(2, " 0");
  String seconds = (duration.inSeconds % 60).toString().padLeft(2, " 0");
  if (hours.trim() != "00") {
    time += "$hours : ";
  }
  time += "$minute : $seconds";
  return time;
}

extension StringExt on String {
  int toInt() => int.tryParse(this) ?? 0;
}
