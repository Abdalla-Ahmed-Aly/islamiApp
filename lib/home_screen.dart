import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/nav_bar_selected_icon.dart';
import 'package:islamiapp/nav_bar_unselected_icon.dart';
import 'package:islamiapp/tabs/hadeth/hadeth_tab.dart';
import 'package:islamiapp/tabs/quran/quran_tab.dart';
import 'package:islamiapp/tabs/radio/radio_tab.dart';
import 'package:islamiapp/tabs/sebha/sebha_tab.dart';
import 'package:islamiapp/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundImageNames = [
    'quranbacground',
    'hadeth_background',
    'sebhabackground',
    'radio_Background',
    'hadeth_background',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/${backgroundImageNames[currentIndex]}.png',
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              height: MediaQuery.sizeOf(context).height * 0.18,
            ),
            Expanded(
              child: tabs[currentIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imgaename: 'quran'),
            activeIcon: NavBarSelectedIcon(imgaename: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imgaename: 'hadeth'),
            activeIcon: NavBarSelectedIcon(imgaename: 'hadeth'),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imgaename: 'sepha'),
            activeIcon: NavBarSelectedIcon(imgaename: 'sepha'),
            label: 'sepha',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imgaename: 'radio'),
            activeIcon: NavBarSelectedIcon(imgaename: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imgaename: 'time'),
            activeIcon: NavBarSelectedIcon(imgaename: 'time'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
