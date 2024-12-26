import 'package:flutter/material.dart';
import 'package:islamiapp/tabs/radio/radioClass.dart';
import 'package:islamiapp/tabs/radio/radio_items.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  String selectedButton = 'Radio';

  @override
  Widget build(BuildContext context) {
  List<String> radionamelist = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
  ];
  List<String> Recitersnamelist = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
  ];
  setState(() {
    
  });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedButton = 'Radio';
                  });
                },
                child: Text(
                  'Radio',
                  style: TextStyle(
                    color:
                        selectedButton == 'Radio' ? Colors.black : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedButton == 'Radio'
                      ? Color(0xffE2BE7F)
                      : Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.45, 40),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Reciters';
                    });
                  },
                  child: Text(
                    'Reciters',
                    style: TextStyle(
                      color: selectedButton == 'Reciters'
                          ? Colors.black
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedButton == 'Reciters'
                        ? Color(0xffE2BE7F)
                        : Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.45, 40),
                  ),
                ),
              ),
            ],
          ),
          selectedButton == 'Radio'?
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (_, index) => RadioItems(
                radioname: Radioclass(
                  name: radionamelist[index],
                ),
              ),
              itemCount: radionamelist.length,
            ),
          )
        : Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (_, index) => RadioItems(
                radioname: Radioclass(
                  name: Recitersnamelist[index],
                ),
              ),
              itemCount: Recitersnamelist.length,
            ),
          )
        ],
      ),
    );
  }
}
