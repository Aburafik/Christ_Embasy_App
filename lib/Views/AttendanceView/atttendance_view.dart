import 'package:flutter/material.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MY ATTENDANCE LOG"),),
      body: const Center(
        child: Text("Attendance Logs"),
      ),
    );
  }
}