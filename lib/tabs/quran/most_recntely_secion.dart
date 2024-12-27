import 'package:flutter/material.dart';
import 'package:islamiapp/tabs/quran/most_recently_item.dart';
import 'package:islamiapp/tabs/quran/sura_service.dart';

class MostRecntelySecion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: SuraService.mostRecently.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Most Recently",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    MostRecentlyItem(SuraService.mostRecently.reversed.toList()[index]),
                itemCount: SuraService.mostRecently.length,
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
