import 'package:flutter/material.dart';
import 'package:music_app/core/app_player.dart';
import 'package:music_app/core/resources/colors.dart';
import 'package:music_app/core/resources/font_size.dart';
import 'package:music_app/core/resources/height.dart';
import 'package:music_app/core/resources/radius.dart';
import 'package:music_app/core/resources/routes_maneger.dart';
import 'package:music_app/core/resources/utils.dart';
import 'package:music_app/core/resources/width.dart';
import '../../core/widgets/widgets_manager.dart';

class HomeScreenPrimaryWidget extends StatefulWidget {
  const HomeScreenPrimaryWidget({super.key});

  @override
  State<HomeScreenPrimaryWidget> createState() =>
      _HomeScreenPrimaryWidgetState();
}

class _HomeScreenPrimaryWidgetState extends State<HomeScreenPrimaryWidget> {
  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(
              right: WidthManager.w32,
              left: WidthManager.w32,
              top: WidthManager.w55,
              bottom: WidthManager.w32,
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorsManager.lightBurble,
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: ColorsManager.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusManager.r50),
                ),
                hintText: Utils.searchSong,
                hintStyle: TextStyle(
                  fontSize: FontSize.f12,
                  fontFamily: Utils.orbitronFontFamily,
                  color: ColorsManager.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(left: WidthManager.w34),
            child: Text(
              Utils.recentlyPlayed,
              style: TextStyle(
                fontSize: FontSize.f18,
                fontWeight: FontWeight.w600,
                color: ColorsManager.white,
                fontFamily: Utils.orbitronFontFamily,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: HeightManager.h35),
          SizedBox(
            height: HeightManager.h200,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: WidthManager.w17),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () async {
                  var res = await Navigator.pushNamed(
                    context,
                    RoutesNames.music,
                    arguments: {
                      "playedCurrentIndex": currentIndex ?? -1,
                      "newCurrentIndex": index,
                    },
                  );
                  currentIndex = int.tryParse(res.toString());
                },
                child: CustomListViewRecentlyPlayed(
                  image: Utils.listRecentlyPlayed[index].image,
                  song: Utils.listRecentlyPlayed[index].songName,
                  artistName: Utils.listRecentlyPlayed[index].artistName,
                ),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(width: WidthManager.w17),
              itemCount: Utils.listRecentlyPlayed.length,
            ),
          ),
          SizedBox(height: HeightManager.h25),
          Padding(
            padding: EdgeInsetsGeometry.only(left: WidthManager.w34),
            child: Text(
              Utils.recommendedMusic,
              style: TextStyle(
                fontSize: FontSize.f18,
                fontWeight: FontWeight.w600,
                color: ColorsManager.white,
                fontFamily: Utils.orbitronFontFamily,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: HeightManager.h25),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: WidthManager.w28),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CustomRecommendedWidget(
                image: Utils.recommendedMusicList[index].image,
                song: Utils.recommendedMusicList[index].song,
                artistName: Utils.recommendedMusicList[index].artistName,
                heartColor: Utils.recommendedMusicList[index].heartColor,
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: HeightManager.h20),
              itemCount: Utils.recommendedMusicList.length,
            ),
          ),
        ],
      ),
    );
  }
}
