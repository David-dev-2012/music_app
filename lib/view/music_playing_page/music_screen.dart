import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/controller/now_playing_controller.dart';
import 'package:music_app/view/music_playing_page/music_widgets.dart';

import '../../core/resources/colors.dart';
import '../../core/resources/height.dart';
import '../get_start_page/get_start_widgets.dart';

class MusicPlayingPage extends StatefulWidget {
  const MusicPlayingPage({super.key});

  @override
  State<MusicPlayingPage> createState() => _MusicPlayingPageState();
}

class _MusicPlayingPageState extends State<MusicPlayingPage> {
  late NowPlayingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = NowPlayingController(context: context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.getIndexArguments();
    return Scaffold(
      body: PrimaryBackGroundWidget(
        widget: MusicScreenPrimaryWidget(
          recentlyPlayedModel: _controller.outputRecentlyPlayedModel,
          controller: _controller,
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: HeightManager.h61,
        color: ColorsManager.darkBurble,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.menu, color: ColorsManager.white),
            Icon(Icons.home_rounded, color: ColorsManager.burble),
            Icon(CupertinoIcons.heart, color: ColorsManager.white),
            Icon(CupertinoIcons.list_bullet, color: ColorsManager.white),
            Icon(Icons.settings, color: ColorsManager.white),
          ],
        ),
      ),
    );
  }
}
