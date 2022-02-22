import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';
import 'package:my_church_app/Views/Announcements/announcement_view.dart';
import 'package:my_church_app/Views/AttendanceView/atttendance_view.dart';
import 'package:my_church_app/Views/ChurchGroups/groups_view.dart';
import 'package:my_church_app/Views/ClockInView/clock_in_view.dart';
import 'package:my_church_app/Views/RequestPrayers/request_prayer.dart';

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
        padding: EdgeInsets.all(5),
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
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white))),
          ),
        ),
        duration: const Duration(seconds: 15),
      );

    case 1:
      return Navigator.push(context,
          MaterialPageRoute(builder: (_) => const AttendanceHistoryPage()));
    case 2:
      return Navigator.push(
          context, MaterialPageRoute(builder: (_) => const GroupPage()));
    case 3:
      return Navigator.push(
          context, MaterialPageRoute(builder: (_) => const AnnouncementPage()));
    case 4:
      return Navigator.push(
          context, MaterialPageRoute(builder: (_) => const RequestPrayer()));
    default:
      {}
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            currentAccountPicture: CircleAvatar(),
            accountName: Text("User Name"),
            accountEmail: Text("user@gmail.com"),
            decoration: BoxDecoration(color: ColorTheme.primaryColor),
          ),
          DrawerTiles(
            icon: Icons.person,
            title: "Profile",
            onTap: () {},
          ),
          DrawerTiles(
            icon: Icons.note,
            title: "Notes",
            onTap: () {},
          ),
          DrawerTiles(
            icon: Icons.logout,
            title: "Log Out",
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class DrawerTiles extends StatelessWidget {
  DrawerTiles({Key? key, this.onTap, this.title, this.icon}) : super(key: key);

  final String? title;
  void Function()? onTap;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(onTap: onTap, title: Text(title!), leading: Icon(icon));
  }
}
