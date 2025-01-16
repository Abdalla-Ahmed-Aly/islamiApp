import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;

  int index = 0;
  double angle = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا اله ال الله",
  ];

  @override
  Widget build(BuildContext context) {
    Size Mediaquery = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                'assets/images/seb7aheader.png',
              ),
              Padding(
                padding: EdgeInsets.only(top: Mediaquery.height * 0.09),
                child: GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      'assets/images/SebhaBody.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Mediaquery.height * 0.25,
                child: Column(
                  children: [
                    Text(
                      azkar[index],
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      '$counter',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void onTap() {
    counter++;
    angle+=360/33;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == azkar.length) {
      index = 0;
    }
    setState(() {});
  }
}
