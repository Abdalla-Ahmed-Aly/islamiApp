import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/page_view/PageIndicator.dart';
import 'package:islamiapp/page_view/page_view_class.dart';
import 'package:islamiapp/page_view/page_view_details.dart';

class MyPageView extends StatefulWidget {
  static const routeName = '/MyPageView';

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> with TickerProviderStateMixin {
  late PageController _pageViewController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: screenHeight * 0.2,
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40), 
            child: PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: <Widget>[
                _buildPage(
                  context,
                  'assets/images/introscreen1.png',
                  'Welcome To Islmi App',
                ),
                PageViewDetails(PageViewClass(
                    image: 'introscreen2',
                    text1: 'Welcome To Islami',
                    text2: 'We Are Very Excited To Have You In Our Community')),
                PageViewDetails(PageViewClass(
                    image: 'introscreen3',
                    text1: 'Reading the Quran',
                    text2: 'Read, and your Lord is the Most Generous')),
                PageViewDetails(PageViewClass(
                    image: 'introscreen4',
                    text1: 'Bearish',
                    text2: 'Praise the name of your Lord, the Most High')),
                PageViewDetails(PageViewClass(
                    image: 'introscreen5',
                    text1: 'Holy Quran Radio',
                    text2:
                        'You can listen to the Holy Quran Radio through the application for free and easily')),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PageIndicator(
              pageController: _pageViewController,
              currentPageIndex: _currentPageIndex,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, String imagePath, String text) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(top: 79),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: MediaQuery.sizeOf(context).height * 0.39,
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            text,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPageIndex = index;
    });
  }
}
