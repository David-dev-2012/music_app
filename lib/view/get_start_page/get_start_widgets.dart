import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/resources/colors.dart';
import '../../core/resources/font_size.dart';
import '../../core/resources/height.dart';
import '../../core/resources/images_maneger.dart';
import '../../core/resources/radius.dart';
import '../../core/resources/routes_maneger.dart';
import '../../core/resources/utils.dart';
import '../../core/resources/width.dart';

class PrimaryBackGroundWidget extends StatelessWidget {
  const PrimaryBackGroundWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ColorsManager.primaryBackGroundColor,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: widget,
    );
  }
}

class PrimaryWidget extends StatelessWidget {
  const PrimaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: HeightManager.h115),

        Text(
          Utils.favourites,
          style: TextStyle(
            fontFamily: Utils.orbitronFontFamily,
            fontSize: FontSize.f50,
            fontWeight: FontWeight.w800,
            color: ColorsManager.white,
          ),
        ),
        Text(
          Utils.music,
          style: TextStyle(
            fontFamily: Utils.orbitronFontFamily,
            fontSize: FontSize.f50,
            fontWeight: FontWeight.w800,
            color: ColorsManager.musicTextColor,
          ),
        ),
        SizedBox(height: HeightManager.h10),
        Text(
          Utils.collection,
          style: TextStyle(
            color: ColorsManager.white,
            fontFamily: Utils.orbitronFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: FontSize.f15,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: HeightManager.h60),
        Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(
                    RadiusManager.r75,
                  ),
                  gradient: LinearGradient(
                    colors: [ColorsManager.white, ColorsManager.musicTextColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                width: WidthManager.w173,
                height: HeightManager.h64,
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesNames.home),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(
                    RadiusManager.r75,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      ColorsManager.darkMusicTextColor,
                      ColorsManager.musicTextColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                width: WidthManager.w170,
                height: HeightManager.h62,
                child: Text(
                  Utils.getStarted,
                  style: TextStyle(
                    fontFamily: Utils.orbitronFontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: FontSize.f19,
                    color: ColorsManager.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 1000, sigmaY: 1000),
              child: Container(
                clipBehavior: Clip.none,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadiusGeometry.circular(1000),
                  gradient: LinearGradient(
                    colors: [
                      ColorsManager.gradiantColor1.withValues(alpha: 0.5),
                      ColorsManager.lightBurble.withValues(alpha: .8),
                    ],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -40,
              left: 0,
              right: 0,
              child: Image.asset(
                ImagesManager.listenImage2,
                width: double.infinity,
                height: HeightManager.h550,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: -12,
              left: 0,
              right: 0,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: double.infinity,
                  height: HeightManager.h160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorsManager.darkBurble,
                        ColorsManager.lightCyan.withValues(alpha: 0.1),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
