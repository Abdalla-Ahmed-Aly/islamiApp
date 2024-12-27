import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/home_screen.dart';
import 'package:islamiapp/tabs/quran/sura_service.dart';
import 'package:islamiapp/tabs/quran/suradetails.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SuraService.getMostRecently();
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        Suradetails.routeName: (_) => Suradetails(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
