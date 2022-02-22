import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';
import 'package:my_church_app/Views/HomeViews/home_view.dart';
import 'package:my_church_app/Views/welcome_view.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  @override
  State<IntroScreen> createState() => _IntroScreenState();

// ignore: non_constant_identifier_names

}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => WelcomeView())));
    super.initState();
  }

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
