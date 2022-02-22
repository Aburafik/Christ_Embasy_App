import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryColor,
      body: Center(
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: MediaQuery.of(context).size.width / 5,
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
