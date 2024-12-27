import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/quran/sura.dart';
import 'package:islamiapp/tabs/quran/sura_item.dart';
import 'package:islamiapp/tabs/quran/sura_service.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: textTheme.titleMedium?.copyWith(
                color: AppTheme.white.withOpacity(0.6),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/icons/quran.svg',
                  colorFilter:
                      ColorFilter.mode(AppTheme.primary, BlendMode.srcIn),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppTheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppTheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: textTheme.titleMedium,
            onChanged: (query) {
              SuraService.serchSuraName(query);
              setState(() {});
            },
          
          ),
          
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Sura List',
            style: textTheme.titleMedium,
          ),
        ),
        Expanded(

          child: SuraService.searshResult.isEmpty
              ? Center(
                  child: Text(
                    'No Sura Found',
                    style: textTheme.titleSmall,
                  ),
                )
              :
          
           ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) => SuraItem(
              SuraService.searshResult[index],
            ),
            separatorBuilder: (_, __) => Divider(
              color: AppTheme.white,
              thickness: 1,
              indent: screenwidth * 0.1,
              endIndent: screenwidth * 0.1,
            ),
            itemCount: SuraService.searshResult.length,
          ),
        )
      ],
    );
  }
}
