import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/radio/radioClass.dart';

class RadioItems extends StatefulWidget {
  RadioItems({required this.radioname});
  final Radioclass radioname;

  double bottom = 0;
  @override
  _RadioItemsState createState() => _RadioItemsState();
}

class _RadioItemsState extends State<RadioItems> {
  bool isPlaying = false;
  bool speaker = false;

  @override
  Widget build(BuildContext context) {
    String backgroundradioitem = 'backgroundradioitem';
    String imagePath = 'assets/images/play.png';
    String speakerPath = 'assets/images/speakeron.png';

    if (isPlaying) {
      imagePath = 'assets/images/Pause.png';
      backgroundradioitem = 'backgroundradioitemon';
      widget.bottom = -30;
    } else {
      widget.bottom = 0;
    }
    if (speaker) {
      speakerPath = 'assets/images/speakeroff.png';
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: widget.bottom,
            left: -10,
            right: -10,
            child: Image.asset(
              'assets/images/${backgroundradioitem}.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Text(
                  widget.radioname.name,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        icon: Image.asset(
                          '${imagePath}',
                          width: 44,
                          height: 44,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            speaker = !speaker;
                          });
                        },
                        icon: Image.asset(
                          '${speakerPath}',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
