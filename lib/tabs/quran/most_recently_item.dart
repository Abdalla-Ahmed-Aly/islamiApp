import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/quran/sura.dart';
import 'package:islamiapp/tabs/quran/suradetails.dart';

class MostRecentlyItem extends StatelessWidget {
  MostRecentlyItem(this.sura);
  Sura sura;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Suradetails.routeName,
          arguments: sura,
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 8),
        height: double.infinity,
        width: screenSize.width * 0.8,
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sura.englishLisname,
                  style:
                      textTheme.headlineSmall?.copyWith(color: AppTheme.black),
                ),
                Text(
                  sura.arabicLisname,
                  style:
                      textTheme.headlineSmall?.copyWith(color: AppTheme.black),
                ),
                Text(
                  '${sura.ayatCount} Verses',
                  style: textTheme.titleSmall?.copyWith(color: AppTheme.black),
                ),
              ],
            ),
            Image.asset(
              'assets/images/recntlysura.png',
              height: screenSize.height * 0.14,
              width: screenSize.width * 0.3,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
