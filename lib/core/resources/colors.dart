import 'dart:ui';

class ColorsManager {
  ColorsManager._();

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF7F7F7F);
  static const Color red = Color(0xFFD32F2F);
  static const Color yellow = Color(0xffffc000);
  static const Color lightCyan = Color(0xFF3097c5);
  static const Color cyan = Color(0xff0272b1);
  static const Color darkCyan = Color(0xff2f5d9a);
  static const Color darkBurble = Color(0xFF261f5c);
  static const Color burble = Color(0xFF854f9f);
  static const Color lightBurble = Color(0xFFb1afe9);
  static Color burbleWithOpacity = Color(0xFF854f9f).withValues(alpha: 1);
  static Color burbleTrans = Color(0xff53367c);
  static Color musicTextColor = Color(0xff80cff2);
  static Color darkMusicTextColor = Color(0xff2F5D9A);
  static Color gradiantColor1 = Color(0xff3097C5);
  static Color gradiantColor2 = Color(0xff3c2c79);
  static Color lightBurbleWithOpacity = Color(
    0xFFb1afe9,
  ).withValues(alpha: 0.5);
  static List<Color> primaryBackGroundColor = [
    ColorsManager.burbleTrans,
    ColorsManager.gradiantColor2,
  ];
  static Color lowerBarImageColor = Color(0xff3d3272);
  static Color musicRowPartColor = Color(0xff726aac);
  static Color musicRowPartColor2 = Color(0xff716bad);
  static Color veryLightBurble = Color(0xffd8d7f4);

  static Color queueNextColor = Color(0xff7c7ad1);
}
