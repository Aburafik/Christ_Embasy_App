import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';
import 'package:my_church_app/Views/welcome_view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context)
        .textTheme
        .headline2!
        .copyWith(color: Colors.black, fontSize: 25);
    return Scaffold(
      // backgroundColor: ColorTheme.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Sign Up",
                style: titleStyle,
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.grey.shade200,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                    children: [
                      InputTextFields(
                        hintText: "Name",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFields(
                        icon: Icons.email,
                        hintText: "Email",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFields(
                        icon: Icons.phone,
                        hintText: "Contact",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFields(
                        icon: Icons.location_city,
                        hintText: "Location",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFields(
                        icon: Icons.remove_red_eye,
                        hintText: "Password",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CommonButton(
                        title: "Sign Up",
                        onpress: () {},
                        color: ColorTheme.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height/7,)
          ],
        ),
      )),
    );
  }

  Text titleText({String? text}) => Text(
        text!,
        style: const TextStyle(fontSize: 20),
      );
}

class InputTextFields extends StatelessWidget {
  InputTextFields({
    this.onPressed,
    this.icon,
    this.hintText,
    Key? key,
  }) : super(key: key);
  void Function()? onPressed;
  IconData? icon;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon))),
      ),
    );
  }
}
