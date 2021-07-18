// Home Page

import 'package:clockapp/pages/alarm.dart';
import 'package:clockapp/pages/bedtime.dart';
import 'package:clockapp/pages/stopwatch.dart';
import 'package:clockapp/pages/timer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int selectedIndex = 0;
  List<Widget> widgetOptions = [
    AlarmPage(),
    BedtimePage(),
    StopwatchPage(),
    TimerPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onPageChanged(int page) {
    setState(() {
      this.selectedIndex = page;
    });
  }

  void onItemTapped(int index) {
    this._pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child:PageView(
            controller: _pageController,
            children: widgetOptions,
            onPageChanged: onPageChanged,
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        selectedFontSize: 18,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
          BottomNavigationBarItem(icon: Icon(Icons.bedtime), label: 'Bedtime'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock_sharp), label: 'Stopwatch'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Timer'),
        ],
      ),
    );
  }
}
