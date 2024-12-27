import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  PageIndicator({
    required this.pageController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final PageController pageController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    String text2 = 'Next';
    bool introsreen = false;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
              pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            icon: Visibility(
              visible: currentPageIndex > 0,
              child: Text(
                'Back',
                style: TextTheme.of(context).titleMedium?.copyWith(
                    color: AppTheme.primary, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 5,
            effect: WormEffect(
              dotHeight: 12.0,
              dotWidth: 12.0,
              type: WormType.normal,
              activeDotColor: AppTheme.primary,
              dotColor: Color(0xff707070),
            ),
          ),
        IconButton(
  splashRadius: 16.0,
  padding: EdgeInsets.zero,
  onPressed: () async {
    if (currentPageIndex == 4) {
      Navigator.popAndPushNamed(context, HomeScreen.routeName);
      await navigateAndSave(); 
    
    } else {
      onUpdateCurrentPageIndex(currentPageIndex + 1);
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  },
  icon: Text(
    currentPageIndex == 4 ? 'Finish' : text2, 
    style: TextTheme.of(context).titleMedium?.copyWith(
      color: AppTheme.primary, 
      fontWeight: FontWeight.w700,
    ),
  ),
          ),
        ],
      ),
    );
  }
}

Future<void> navigateAndSave() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sharedPref.setBool('introscreen', true);
}
