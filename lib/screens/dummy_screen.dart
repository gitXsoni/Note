import 'package:flutter/material.dart';

class DumyScreen extends StatefulWidget {
  const DumyScreen({super.key});

  @override
  State<DumyScreen> createState() => _DumyScreenState();
}

class _DumyScreenState extends State<DumyScreen> {
  // double height = 200;
  // double width = 200;
  int selectedIndex = 0;
  // int currentIndex = 0;

  void ChangeSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> bodyWidgets = [
    Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        "Menu",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        "Search",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            ChangeSelectedIndex(index);
          },
          currentIndex: selectedIndex,
          selectedIconTheme: IconThemeData(color: Colors.teal),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          // backgroundColor: Colors.pink,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.label), label: 'Label'),
          ]),
      body: bodyWidgets.elementAt(selectedIndex),
    );
  }
}
