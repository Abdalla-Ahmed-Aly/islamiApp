import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/quran/sura.dart';
import 'package:islamiapp/tabs/quran/suradetails.dart';

class SuraItem extends StatelessWidget {
  SuraItem(this.sura);
  Sura sura;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(Suradetails.routeName, arguments: sura);
      },
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 24),
            alignment: Alignment.center,
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/suranumberframe.png',
                ),
                // fit: BoxFit.cover,
              ),
            ),
            child: Text(
              '${sura.num}',
              style: textTheme.titleLarge,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sura.englishLisname,
                style: textTheme.titleLarge,
              ),
              Text(
                '${sura.ayatCount} Verses',
                style: textTheme.titleSmall,
              )
            ],
          ),
          Spacer(),
          Text(
            sura.arabicLisname,
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
