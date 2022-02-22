import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';
import 'package:my_church_app/Views/welcome_view.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ANNOINCEMENTS"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/announcement.png",
              height: 50,
            ),
            const Text("No announcement"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.primaryColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CreateAnnouncement()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CreateAnnouncement extends StatefulWidget {
  const CreateAnnouncement({Key? key}) : super(key: key);

  @override
  State<CreateAnnouncement> createState() => _CreateAnnouncementState();
}

class _CreateAnnouncementState extends State<CreateAnnouncement> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    _showDatePicker() async {
      await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now(),
          initialDate: DateTime.now());
    }

    _showTimePicker() async {
      await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
    }

    TextStyle textStyle =
        Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18);
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
        title: Text("Create Annoincement"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15)),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5),
          children: [
            titleText(text: "Title"),
            TextInputFields(),
            titleText(
              text: "Description",
            ),
            TextInputFields(
              maxLines: 6,
            ),
            titleText(text: "Select Date"),
            TextInputFields(
              suffixIcon: IconButton(
                  onPressed: () => _showDatePicker(),
                  icon: Icon(Icons.calendar_today)),
            ),
            titleText(text: "Select Time"),
            TextInputFields(
              suffixIcon: IconButton(
                  onPressed: () => _showTimePicker(),
                  icon: Icon(Icons.watch_later_outlined)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleText(text: "Turn on Reminder"),
                // Switch.adaptive(value: value, onChanged: onChanged)
                Switch(
                  activeColor: ColorTheme.primaryColor,
                  value: isChecked,
                  onChanged: (bool value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
              ],
            ),
            CommonButton(
              title: "Post",
              onpress: () {
                BoatToast().showLoading();
                Future.delayed(Duration(seconds: 3), () {
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

class TextInputFields extends StatelessWidget {
  TextInputFields({Key? key, this.maxLines, this.suffixIcon, this.hintText})
      : super(key: key);

  int? maxLines;
  Widget? suffixIcon;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines == null ? 1 : maxLines,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 10),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: ColorTheme.secondaryColor),
    );
  }
}

class BoatToast {
  showLoading() {
    return BotToast.showCustomLoading(
      toastBuilder: (_) => const Center(
        child: Card(
          color: Colors.grey,
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                  // valueColor: ShowValueIndicator.never

                  )),
        ),
      ),
      // duration: Duration(seconds: 15),
      // target: Offset(520, 520)
    );
  }

  stopLoasding() {
    return BotToast.closeAllLoading();
  }
}
