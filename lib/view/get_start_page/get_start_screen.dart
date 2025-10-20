import 'package:flutter/material.dart';
import 'get_start_widgets.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key,});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: PrimaryBackGroundWidget(widget: PrimaryWidget()),
      ),
    );
  }
}
