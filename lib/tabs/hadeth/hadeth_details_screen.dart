import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/hadeth/hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const routeName = '/HadethDetails';
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hadeth ${hadeth.num}'),
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
                Expanded(
                  child: Text(
                    hadeth.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: AppTheme.primary),
                        textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  'assets/images/left.png',
                  height: screenheight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (_, index) => Text(
                hadeth.content[index],
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.primary,
                    ),
                textAlign: TextAlign.center,
              ),
              separatorBuilder: (_, __) => SizedBox(
                height: 12,
              ),
              itemCount: hadeth.content.length,
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
}
