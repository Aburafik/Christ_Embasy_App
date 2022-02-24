import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorTheme.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Sign UP"),
            Expanded(
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
