import 'package:flutter/material.dart';
import 'package:my_church_app/Utils/color_themes.dart';
import 'package:my_church_app/Utils/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HOME VIEW"),
          actions: [CircleAvatar(),SizedBox(width: 3,)],
          iconTheme: IconThemeData(color: ColorTheme.primaryColor),
          backgroundColor: Colors.white,
        ),
        drawer: const Drawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Center(
            child: GridView.builder(
                itemCount: sections.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    // mainAxisExtent: 80,
                    
                    crossAxisCount: 3),
                itemBuilder: (context, index) => SectionsCard(
                      index: index,
                    )
                // Column(
                //   children: [],
                // ),
                ),
          ),
        ));
  }
}
