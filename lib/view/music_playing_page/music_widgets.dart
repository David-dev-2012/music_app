import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/controller/now_playing_controller.dart';
import 'package:music_app/core/app_player.dart';
import 'package:music_app/core/resources/font_size.dart';
import 'package:music_app/core/resources/icons_size.dart';
import 'package:music_app/core/resources/radius.dart';
import 'package:music_app/core/resources/width.dart';
import 'package:music_app/model/recently_played_model.dart';
import '../../core/resources/colors.dart';
import '../../core/resources/height.dart';
import '../../core/resources/images_maneger.dart';
import '../../core/resources/utils.dart';
import '../../core/widgets/widgets_manager.dart';

class MusicScreenPrimaryWidget extends StatelessWidget {
  final NowPlayingController controller;

  const MusicScreenPrimaryWidget({
    super.key,
    required this.recentlyPlayedModel,
    required this.controller,
  });

  final Stream<RecentlyPlayedModel> recentlyPlayedModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: HeightManager.h80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context, controller.currentIndex);
                },
                icon: Icon(
                  Icons.navigate_before_rounded,
                  color: ColorsManager.white,
                  size: IconSizeManager.s25,
                ),
              ),
              Text(
                Utils.nowPlaying,
                style: TextStyle(
                  color: ColorsManager.white,
                  fontFamily: Utils.orbitronFontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: FontSize.f18,
                ),
              ),

              Row(
                spacing: WidthManager.w20,
                children: [
                  Icon(
                    Icons.share_outlined,
                    color: ColorsManager.white,
                    size: IconSizeManager.s25,
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    color: ColorsManager.white,
                    size: IconSizeManager.s25,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: HeightManager.h100),
          StreamBuilder(
            stream: recentlyPlayedModel,
            builder: (context, snapshot) => snapshot.data == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: WidthManager.w90,
                        ),
                        child: SizedBox(
                          width: WidthManager.w235,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,

                            children: [
                              Container(
                                width: WidthManager.w215,
                                height: HeightManager.h275,
                                decoration: BoxDecoration(
                                  color: ColorsManager.white.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(
                                    RadiusManager.r20,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                top: 0,
                                right: 0,
                                left: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    RadiusManager.r20,
                                  ),
                                  child: Image.asset(
                                    snapshot.data!.image,
                                    height: HeightManager.h290,
                                    width: WidthManager.w290,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: HeightManager.h25),
                      Text(
                        snapshot.data!.songName,
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: FontSize.f18,
                          fontFamily: Utils.orbitronFontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: HeightManager.h5),
                      Text(
                        snapshot.data!.artistName,
                        style: TextStyle(
                          color: ColorsManager.lightBurble,
                          fontSize: FontSize.f12,
                          fontFamily: Utils.orbitronFontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: HeightManager.h30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                CupertinoIcons.shuffle,
                color: ColorsManager.white,
                size: IconSizeManager.s25,
              ),
              InkWell(
                onTap: () => controller.goToPreviousSong(),
                child: Container(
                  height: HeightManager.h45,
                  width: WidthManager.w45,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: ColorsManager.darkCyan),
                    borderRadius: BorderRadiusGeometry.circular(
                      RadiusManager.r500,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        ColorsManager.burble.withValues(alpha: 0.4),
                        ColorsManager.lightBurble.withValues(alpha: 0.3),
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                  ),
                  child: Icon(
                    Icons.skip_previous_rounded,
                    size: IconSizeManager.s30,
                    color: ColorsManager.white,
                  ),
                ),
              ),

              PauseAndResumeButton(
                isPlayingStream: controller.isPlayingOutput,
                onTap: controller.onTapAtPlayAndStopMusic,
              ),

              // CircleAvatar(
              //   radius: IconSizeManager.s30,
              //   child: Container(
              //     width: WidthManager.w80,
              //     height: HeightManager.h80,
              //     decoration: BoxDecoration(
              //       color: ColorsManager.lightBurble,
              //       borderRadius: BorderRadiusGeometry.circular(
              //         RadiusManager.r500,
              //       ),
              //     ),
              //     child:Icon(Icons.pause_rounded,size: IconSizeManager.s35,color: ColorsManager.white,)
              //   ),
              // ),
              InkWell(
                onTap: () {
                  controller.goToNextSong();
                },
                child: CircleAvatar(
                  radius: IconSizeManager.s25,
                  backgroundColor: ColorsManager.white.withValues(alpha: 0.01),
                  child: Container(
                    height: HeightManager.h45,
                    width: WidthManager.w45,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: ColorsManager.darkCyan),
                      borderRadius: BorderRadiusGeometry.circular(
                        RadiusManager.r500,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          ColorsManager.burble.withValues(alpha: 0.4),
                          ColorsManager.lightBurble.withValues(alpha: 0.3),
                        ],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                      ),
                    ),
                    child: Icon(
                      Icons.skip_next_rounded,
                      size: IconSizeManager.s30,
                      color: ColorsManager.white,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.repeat_rounded,
                color: ColorsManager.white,
                size: IconSizeManager.s25,
              ),
            ],
          ),

          SizedBox(height: HeightManager.h30),
          SwipeTimelineOnly(
            audioTimeOutPut: controller.audioTimeOutPut,
            currentTimeOnSong: controller.streamControllerOutPitDurationNow,
            streamControllerOutPitSlider: controller.outPitSlider,
            onChangedSlider: (double value) {
              controller.changeCurrentSlider(value);
            },
          ),
          SizedBox(height: HeightManager.h15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: WidthManager.w70),
            child: Container(
              height: HeightManager.h65,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManager.musicRowPartColor2,
                borderRadius: BorderRadiusGeometry.circular(RadiusManager.r15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: HeightManager.h5),
                child: Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MusicPartFeaturesWidget(
                        title: "Like",
                        icon: Icons.favorite_border_outlined,
                      ),
                      MusicPartFeaturesWidget(
                        title: "Playlist",
                        icon: Icons.queue_music_sharp,
                      ),
                      MusicPartFeaturesWidget(
                        title: "Download",
                        icon: Icons.vertical_align_bottom,
                      ),
                      MusicPartFeaturesWidget(
                        title: "More",
                        icon: Icons.more_vert_rounded,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: HeightManager.h30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: WidthManager.w30),
            child: Container(
              height: HeightManager.h115,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManager.musicRowPartColor,
                borderRadius: BorderRadiusGeometry.circular(RadiusManager.r15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: WidthManager.w10,
                  vertical: HeightManager.h10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Up next",
                          style: TextStyle(
                            fontFamily: Utils.orbitronFontFamily,
                            fontWeight: FontWeight.w600,
                            color: ColorsManager.white,
                            fontSize: FontSize.f10,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            width: WidthManager.w75,
                            height: HeightManager.h25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.circular(
                                RadiusManager.r15,
                              ),
                              color: ColorsManager.queueNextColor,
                            ),
                            child: Text(
                              "Queue >",
                              style: TextStyle(
                                fontFamily: Utils.orbitronFontFamily,
                                fontWeight: FontWeight.w600,
                                color: ColorsManager.white,
                                fontSize: FontSize.f10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: HeightManager.h5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: WidthManager.w15,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(
                                RadiusManager.r10,
                              ),
                              child: Image.asset(
                                ImagesManager.alanWalker,
                                width: WidthManager.w60,
                                height: HeightManager.h60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  Utils.singMeToSleep,
                                  style: TextStyle(
                                    color: ColorsManager.white,
                                    fontSize: FontSize.f15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Utils.orbitronFontFamily,
                                  ),
                                ),
                                Text(
                                  Utils.alanWalker,
                                  style: TextStyle(
                                    color: ColorsManager.lightBurble,
                                    fontSize: FontSize.f12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Utils.orbitronFontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.skip_next_outlined,
                          size: IconSizeManager.s30,
                          color: ColorsManager.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
