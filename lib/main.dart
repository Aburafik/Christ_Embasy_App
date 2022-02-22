import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';
import 'package:my_church_app/Views/HomeViews/home_view.dart';
import 'package:my_church_app/Views/into_view.dart';
import 'package:my_church_app/Views/welcome_view.dart';

//Warning: Don't arbitrarily adjust the position of calling the BotToastInit function
final botToastBuilder = BotToastInit();
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
     theme: ThemeData(
       appBarTheme: AppBarTheme(
         elevation: 2,
         centerTitle: true,
         iconTheme: IconThemeData(color: ColorTheme.primaryColor),
         backgroundColor: ColorTheme.secondaryColor,
        titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
        
       )
     ),
      home: const HomeView()
      // WelcomeView(),
      //  IntroScreen(),
      ));
}
