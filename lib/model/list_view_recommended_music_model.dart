import 'dart:ui';

class ListViewRecommendedMusicModel {
  ListViewRecommendedMusicModel(
    this.heartColor, {
    required this.image,
    required this.songName,
    required this.artistName,
  });

  final String image;
  final String songName;
  final String artistName;
  final Color heartColor;
}
