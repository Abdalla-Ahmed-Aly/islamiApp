import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/home_screen.dart';
import 'package:islamiapp/page_view/page_view.dart';
import 'package:islamiapp/tabs/quran/sura_service.dart';
import 'package:islamiapp/tabs/quran/suradetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SuraService.getMostRecently();
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  bool introscreen = sharedPref.getBool('introscreen') ?? false;
  runApp(IslamiApp(introscreen: introscreen));
  
}

class IslamiApp extends StatelessWidget {
   final bool introscreen;
  IslamiApp({required this.introscreen});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        Suradetails.routeName: (_) => Suradetails(),
        MyPageView.routeName: (_) => MyPageView(),
      },
      
      initialRoute: introscreen ? HomeScreen.routeName : MyPageView.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      
    );
  }
}
