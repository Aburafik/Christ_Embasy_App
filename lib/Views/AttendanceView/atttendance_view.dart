import 'package:flutter/material.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My ATTENDANCE LOG"),),
      body: Center(
        child: Text("Attendance Logs"),
      ),
    );
  }
}