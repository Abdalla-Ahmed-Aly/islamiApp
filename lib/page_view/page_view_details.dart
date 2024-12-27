import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/page_view/page_view_class.dart';

class PageViewDetails extends StatelessWidget {
  PageViewClass pageViewclass;
  PageViewDetails(this.pageViewclass);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(top: 79),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/${pageViewclass.image}.png',
            height: MediaQuery.sizeOf(context).height * 0.5,
          ),
          SizedBox(
            height: 39,
          ),
          Text(
            pageViewclass.text1,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppTheme.primary,
            ),
          ),
          SizedBox(
            height: 39,
          ),
          Text(
            pageViewclass.text2,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppTheme.primary,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
