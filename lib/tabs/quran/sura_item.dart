import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/quran/sura.dart';
import 'package:islamiapp/tabs/quran/sura_service.dart';
import 'package:islamiapp/tabs/quran/suradetails.dart';

class SuraItem extends StatefulWidget {
  SuraItem(this.sura);
  Sura sura;

  @override
  State<SuraItem> createState() => _SuraItemState();
}

class _SuraItemState extends State<SuraItem> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
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
            '${widget.sura.num}',
            style: textTheme.titleLarge,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sura.englishLisname,
              style: textTheme.titleLarge,
            ),
            Text(
              '${widget.sura.ayatCount} Verses',
              style: textTheme.titleSmall,
            )
          ],
        ),
        Spacer(),
        Text(
          widget.sura.arabicLisname,
          style: textTheme.titleLarge,
        ),
      ],
    );
  }
}
