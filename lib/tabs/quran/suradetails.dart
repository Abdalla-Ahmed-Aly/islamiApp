import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/quran/sura.dart';
import 'package:islamiapp/widgets/loading_indicator.dart';

class Suradetails extends StatefulWidget {
  static const routeName = '/MyPageView';

  @override
  State<Suradetails> createState() => _SuradetailsState();
}

class _SuradetailsState extends State<Suradetails> {
  List<String> ayat = [];

  late Sura sura;

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if (ayat.isEmpty) {
      LoadSuraFile();
    }
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishLisname),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/right.png',
                  height: screenheight * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicLisname,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: AppTheme.primary),
                ),
                Image.asset(
                  'assets/images/left.png',
                  height: screenheight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          ayat.isEmpty
              ? LoadingIndicator()
              : Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppTheme.primary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    separatorBuilder: (_, __) => SizedBox(
                      height: 12,
                    ),
                    itemCount: ayat.length,
                  ),
                ),
          Image.asset(
            'assets/images/buttomphotoqurandetails.png',
            width: double.infinity,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }

  Future<void> LoadSuraFile() async {
    String suraFileContent =
        await rootBundle.loadString('assets/text/Suras/${sura.num}.txt');
    ayat = suraFileContent.split('\r\n');
    setState(() {});
  }
}
