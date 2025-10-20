import 'package:music_app/core/app_player.dart';
import 'package:music_app/core/resources/colors.dart';
import 'package:music_app/core/resources/images_maneger.dart';
import 'package:music_app/core/widgets/widgets_manager.dart';
import 'package:music_app/model/recently_played_model.dart';

class Utils {
  Utils._();
AppPlayer player = AppPlayer();
  static const String favourites = "Find Your \nFavourite";
  static const String music = "Music";
  static const String orbitronFontFamily = "Obtrain";
  static const String collection =
      "Find Your Latest Favourite Music \n From Our Collection";
  static const String getStarted = "Get Started";
  static const String searchSong = "Search Song";
  static const String recentlyPlayed = "Recently Played";
  static const String recommendedMusic = "Recommended music";
  static const String sorry = "SORRY";
  static const String justinBieber = "Justin Bieber";
  static const String singMeToSleep = "Sing Me To Sleep";
  static const String alanWalker = "Alan Walker";
  static const String giveMeEverything = "Give Me Everything";
  static const String pitPull = "Pit Pull";
  static const String blindingLights = "Blinding Lights";
  static const String theWeeknd = "The Weeknd";
  static const String anneMarie = "Anne Marie";
  static const String djSnake = "Dj Snake";
  static const String duaLipa = "Dua Lipa";
  static const String taylorSwift = "Taylor Swift";
  static const String marshmello = "Marshmello";
  static const String magentaRiddim = "Magenta Riddim";
  static const String friends = "Friends";
  static const String alon = "Alon";
  static const String newRules = "New Rules";
  static const String youBelongeWithMe = "You Belong With Me";
  static const String _baseURlAudio = "audio";

  static const String singToMeSleepAudio = "$_baseURlAudio/alan.mp3";
  static const String blindigsLightAudio = "$_baseURlAudio/weeknd.mp3";
  static const String sorryAudio = "$_baseURlAudio/sorry.mp3";
  static const String giveMeEveryThengAudio = "$_baseURlAudio/pitpull.mp3";

  static List<CustomListViewRecentlyPlayed> recentlyPlayedList = [
    CustomListViewRecentlyPlayed(
      image: ImagesManager.justinBieber,
      song: sorry,
      artistName: Utils.justinBieber,
    ),
    CustomListViewRecentlyPlayed(
      image: ImagesManager.alanWalker,
      song: singMeToSleep,
      artistName: Utils.alanWalker,
    ),
    CustomListViewRecentlyPlayed(
      image: ImagesManager.pitbull,
      song: giveMeEverything,
      artistName: pitPull,
    ),
    CustomListViewRecentlyPlayed(
      image: ImagesManager.theWeekEnd,
      song: blindingLights,
      artistName: theWeeknd,
    ),
  ];

  static List<CustomRecommendedWidget> recommendedMusicList = [
    CustomRecommendedWidget(
      image: ImagesManager.djSnake,
      song: Utils.magentaRiddim,
      artistName: Utils.djSnake,
      heartColor: ColorsManager.white,
    ),
    CustomRecommendedWidget(
      image: ImagesManager.anneMarie,
      song: Utils.friends,
      artistName: Utils.anneMarie,
      heartColor: ColorsManager.red,
    ),
    CustomRecommendedWidget(
      image: ImagesManager.marshmello,
      song: Utils.alon,
      artistName: Utils.marshmello,
      heartColor: ColorsManager.white,
    ),
    CustomRecommendedWidget(
      image: ImagesManager.duaLipa,
      song: Utils.newRules,
      artistName: Utils.duaLipa,
      heartColor: ColorsManager.red,
    ),
    CustomRecommendedWidget(
      image: ImagesManager.tylorSwift,
      song: Utils.youBelongeWithMe,
      artistName: Utils.taylorSwift,
      heartColor: ColorsManager.red,
    ),
  ];

  static String nowPlaying = "Now Playing";

  static List<RecentlyPlayedModel> listRecentlyPlayed = [
    RecentlyPlayedModel (
      image: ImagesManager.justinBieber,
      songName: Utils.sorry,
      artistName: Utils.justinBieber,
      path: Utils.sorryAudio,
    ),
    RecentlyPlayedModel(
      image: ImagesManager.alanWalker,
      songName: Utils.singMeToSleep,
      artistName: Utils.alanWalker,
      path: Utils.singToMeSleepAudio,
    ),
    RecentlyPlayedModel(
      image: ImagesManager.pitbull,
      songName: Utils.giveMeEverything,
      artistName: Utils.pitPull,
      path: Utils.giveMeEveryThengAudio,
    ),
    RecentlyPlayedModel(
      image: ImagesManager.theWeekEnd,
      songName: Utils.blindingLights,
      artistName: Utils.theWeeknd,
      path: Utils.blindigsLightAudio,
    ),
  ];
}
