import 'package:flutter/material.dart';

import 'drawer.dart';
import 'drawer_navigation.dart';
import 'home_body.dart';

class HomePage extends StatefulWidget {
  static const String title = "Home";
  static const String route = "home";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;
  var item = const DrawerNavigationItem(key: "home", title: "Home");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      backgroundColor: Colors.white,
      body: HomeBody(text: item.title),
      drawer: HomeDrawer(
        currentIndex: index,
        onStateChanged: (index, item) {
          setState(() {
            this.index = index;
            this.item = item;
          });
        },
      ),
    );
  }
}
