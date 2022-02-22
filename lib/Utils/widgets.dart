import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';
import 'package:my_church_app/Views/Announcements/announcement_view.dart';
import 'package:my_church_app/Views/AttendanceView/atttendance_view.dart';
import 'package:my_church_app/Views/ChurchGroups/groups_view.dart';
import 'package:my_church_app/Views/ClockInView/clock_in_view.dart';

class SectionsCard extends StatelessWidget {
  SectionsCard({Key? key, this.index}) : super(key: key);
  final int? index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customRouter(index, context);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: Image(image: AssetImage(sections[index!]["image"]))),
            Text(
              sections[index!]["title"],
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorTheme.primaryColor, width: 1),
          // color: Colors.red.withOpacity(0.4),
        ),
        //  margin: EdgeInsets.symmetric(h),
      ),
    );
  }
}

List sections = [
  {"title": "Clock In", "image": "images/mark.png"},
  {"title": "Attendance", "image": "images/statistics.png"},
  {"title": "Groups", "image": "images/pages.png"},
  {"title": "Announcement", "image": "images/announcement.png"},
  {"title": "Request prayer", "image": "images/prayer.png"},
];

customRouter(pageIndex, context) {
  switch (pageIndex) {
    case 0:
      return

          //popup a attachments toast
          BotToast.showCustomLoading(
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
        duration: Duration(seconds: 15),
        // target: Offset(520, 520)
      );
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (_) =>  BotToast.showAnimationWidget(toastBuilder: ()=>, animationDuration: Duration(),)
    //     ,)

    case 1:
      return Navigator.push(
          context, MaterialPageRoute(builder: (_) => AttendanceHistoryPage()));
    case 2:
      return Navigator.push(
          context, MaterialPageRoute(builder: (_) => GroupPage()));
    case 3:
      return Navigator.push(
          context, MaterialPageRoute(builder: (_) => AnnouncementPage()));
    default:
      {}
  }
}
