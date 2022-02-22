import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';
import 'package:my_church_app/Views/Announcements/announcement_view.dart';

import '../welcome_view.dart';

class RequestPrayer extends StatelessWidget {
  const RequestPrayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .headline2!
        .copyWith(fontSize: 18, color: Colors.black);
    titleText({text}) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: textStyle,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Request Prayer"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15)),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            titleText(text: "Name"),
            TextInputFields(
              hintText: "example@xyz.com",
            ),
            titleText(
              text: "Email",
            ),
            TextInputFields(),
            titleText(
              text: "Prayer Request",
            ),
            TextInputFields(
              maxLines: 12,
            ),
            const SizedBox(height: 35),
            CommonButton(
              title: "Send Request",
              onpress: () {
                BoatToast().showLoading();
                Future.delayed(const Duration(seconds: 3), () {
                  BoatToast().stopLoasding();
                });
              },
              color: ColorTheme.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
