import 'package:flutter/material.dart';
import 'package:music_app/core/app_player.dart';
import 'package:music_app/core/resources/colors.dart';
import 'package:music_app/core/resources/font_size.dart';
import 'package:music_app/core/resources/height.dart';
import 'package:music_app/core/resources/radius.dart';
import 'package:music_app/core/resources/utils.dart';
import 'package:music_app/core/resources/width.dart';
import '../resources/icons_size.dart';

class CustomListViewRecentlyPlayed extends StatelessWidget {
  const CustomListViewRecentlyPlayed({
    super.key,
    required this.image,
    required this.song,
    required this.artistName,
  });

  final String image;
  final String song;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(RadiusManager.r15),
          child: Image.asset(
            image,
            width: WidthManager.w150,
            height: HeightManager.h150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: HeightManager.h10),
        Expanded(
          child: Text(
            song,
            style: TextStyle(
              fontSize: FontSize.f15,
              fontFamily: Utils.orbitronFontFamily,
              color: ColorsManager.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            artistName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: FontSize.f12,
              color: ColorsManager.lightBurble,
              fontFamily: Utils.orbitronFontFamily,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomRecommendedWidget extends StatelessWidget {
  const CustomRecommendedWidget({
    super.key,
    required this.image,
    required this.song,
    required this.artistName,
    required this.heartColor,
  });

  final String image;

  final String song;

  final String artistName;

  final Color heartColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: WidthManager.w20,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(RadiusManager.r50),
              child: Image.asset(
                image,
                width: WidthManager.w75,
                height: HeightManager.h75,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              spacing: HeightManager.h5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song,
                  style: TextStyle(
                    fontFamily: Utils.orbitronFontFamily,
                    color: ColorsManager.white,
                    fontSize: FontSize.f15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  artistName,
                  style: TextStyle(
                    fontFamily: Utils.orbitronFontFamily,
                    color: ColorsManager.lightBurble,
                    fontSize: FontSize.f12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        Icon(
          Icons.favorite_border_outlined,
          color: heartColor,
          size: IconSizeManager.s20,
        ),
      ],
    );
  }
}

class SwipeTimelineOnly extends StatelessWidget {
  const SwipeTimelineOnly({
    super.key,
    required this.audioTimeOutPut,
    required this.currentTimeOnSong,
    required this.streamControllerOutPitSlider,
    required this.onChangedSlider,
  });

  final Stream<String> audioTimeOutPut;
  final Stream<String> currentTimeOnSong;
  final Stream<double> streamControllerOutPitSlider;
  final void Function(double value) onChangedSlider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<double>(
            stream: streamControllerOutPitSlider,
            builder: (context, snapshot) {
              return SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: SliderComponentShape.noThumb,
                  trackHeight: HeightManager.h5,
                ),
                child: Slider(
                  activeColor: ColorsManager.lightBurble,
                  inactiveColor: ColorsManager.darkCyan,
                  min: 0,
                  max: 1,
                  value: snapshot.data == null
                      ? 0
                      : snapshot.data! > 1
                      ? 1
                      : snapshot.data!,
                  onChanged: onChangedSlider,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder<String>(
                  stream: currentTimeOnSong,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) =>
                          Text(
                            snapshot.data ?? "",
                            style: TextStyle(
                              fontSize: FontSize.f12,
                              color: ColorsManager.lightBurble,
                              fontWeight: FontWeight.w600,
                              fontFamily: Utils.orbitronFontFamily,
                            ),
                          ),
                ),
                StreamBuilder<String>(
                  stream: audioTimeOutPut,
                  initialData: "",
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data!,
                      style: TextStyle(
                        fontSize: FontSize.f12,
                        color: ColorsManager.lightBurble,
                        fontWeight: FontWeight.w600,
                        fontFamily: Utils.orbitronFontFamily,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MusicPartFeaturesWidget extends StatelessWidget {
  const MusicPartFeaturesWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: HeightManager.h5),
      child: Column(
        children: [
          Icon(
            icon,
            size: IconSizeManager.s30,
            color: ColorsManager.veryLightBurble,
          ),
          Text(
            title,
            style: TextStyle(
              color: ColorsManager.veryLightBurble,
              fontSize: FontSize.f11,
              fontFamily: Utils.orbitronFontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class PauseAndResumeButton extends StatelessWidget {
  const PauseAndResumeButton({
    super.key,
    required this.isPlayingStream,
    required this.onTap,
  });

  final Stream<bool> isPlayingStream;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: IconSizeManager.s30,
        child: Container(
          width: WidthManager.w80,
          height: HeightManager.h80,
          decoration: BoxDecoration(
            color: ColorsManager.lightBurble,
            borderRadius: BorderRadiusGeometry.circular(RadiusManager.r500),
          ),
          child: StreamBuilder<bool>(
            initialData: false,
            stream: isPlayingStream,
            builder: (context, snapshot) => Icon(
              snapshot.data! ? Icons.pause_rounded : Icons.play_arrow_outlined,
              size: IconSizeManager.s35,
              color: ColorsManager.white,
            ),
          ),
        ),
      ),
    );
  }
}
