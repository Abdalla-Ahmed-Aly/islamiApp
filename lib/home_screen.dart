import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/quran.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/quran.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/hadeth.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/hadeth.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/sepha.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/sepha.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            label: 'sepha',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/radio.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/radio.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/time.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/time.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
