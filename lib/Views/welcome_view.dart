// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';
import 'package:my_church_app/Views/HomeViews/home_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .headline2!
        .copyWith(color: ColorTheme.primaryColor, fontSize: 35);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Text("WELLCOME!",
                  style: textStyle.copyWith(fontWeight: FontWeight.bold)),
              Expanded(
                child: const SizedBox(
                  // height: 120,
                  width: 300,
                  child: Image(
                    image: AssetImage("images/church.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Believers Go",
                  style: textStyle.copyWith(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text("We are most delighted to welcome you to church"),
                    Text("as you walk into church, you will be bless"),
                    Text("tremendously in Jesus name' Amen!"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CommonButton(
                  title: "WALK INTO CHURCH",
                  onpress: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomeView()));
                  },
                  color: ColorTheme.primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  CommonButton({Key? key, this.onpress, this.title, this.color})
      : super(key: key);
  void Function()? onpress;
  String? title;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: color,
      onPressed: onpress,
      child: Center(
        child: Text(
          title!,
          style: TextStyle(color: ColorTheme.secondaryColor),
        ),
      ),
    );
  }
}
