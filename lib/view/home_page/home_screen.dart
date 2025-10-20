import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/resources/colors.dart';
import 'package:music_app/core/resources/height.dart';
import 'package:music_app/view/get_start_page/get_start_widgets.dart';
import 'package:music_app/view/home_page/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryBackGroundWidget(widget: HomeScreenPrimaryWidget()),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: HeightManager.h61,
        color: ColorsManager.darkBurble,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.menu, color: ColorsManager.white),
            Icon(Icons.home_rounded , color: ColorsManager.burble),
            Icon(CupertinoIcons.heart,color: ColorsManager.white,),
            Icon(CupertinoIcons.list_bullet,color: ColorsManager.white,),
            Icon(Icons.settings, color: ColorsManager.white),

          ],
        ),
      ),
    );
  }
}
