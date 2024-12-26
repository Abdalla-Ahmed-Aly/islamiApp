import 'package:flutter/material.dart';
import 'package:islamiapp/tabs/radio/radioClass.dart';

class RadioItems extends StatefulWidget {
  RadioItems({required this.radioname});
  final Radioclass radioname;

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
    }
    if (speaker) {
      speakerPath = 'assets/images/speakeroff.png';
    }

    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xffE2BE7F),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('assets/images/${backgroundradioitem}.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 133,
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
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
