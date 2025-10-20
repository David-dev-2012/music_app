import 'package:flutter/material.dart';
import 'package:music_app/view/get_start_page/get_start_screen.dart';
import 'package:music_app/view/home_page/home_screen.dart';
import 'package:music_app/view/not_found_page/screen.dart';
import '../../view/music_playing_page/music_screen.dart';


Route<dynamic>?  onGenerate(RouteSettings settings) {
  Widget page;

  switch (settings.name) {
    case RoutesNames.getStart:
      page = const GetStartScreen();
      case RoutesNames.home:
      page = const HomePage();
      case RoutesNames.music:
      page = const MusicPlayingPage();
      default:
        page = const NotFoundPage();

  }
  return MaterialPageRoute(builder: (context) => page,settings: settings);

}

 class RoutesNames{

RoutesNames._();

static const String getStart = "/";
static const String home = "/home";
static const String music = "/music";



 }
