import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOUSE GROUPS"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => const ListTile(
                leading: CircleAvatar(),
                title: Text("Group Name"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 3),
    );
  }
}
