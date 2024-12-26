import 'package:flutter/material.dart';
import 'dart:math';

class SebhaTab extends StatefulWidget {
  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _currentBead = 0;
   int _totalBeads = 99;
  double get _anglePerBead => 2 * pi / _totalBeads;
  double _startX = 0.0;
  bool _lock = false;
  String text = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 36, color: Colors.white),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onPanStart: (details) {
                _startX = details.localPosition.dx;
              },
              onPanUpdate: (details) {
                if (!_lock) {
                
                  if (details.localPosition.dx > _startX + 20) {
                    setState(() {
                      _currentBead = (_currentBead + 1) % _totalBeads;

                      if (_currentBead >= 33 && _currentBead <= 65) {
                        text = 'الحمد لله';
                      } else if (_currentBead >= 66 && _currentBead <= 99) {
                        text = 'الله أكبر';
                      } else {
                        text = 'سبحان الله';
                      }
                    });
                    _lock = true;
                  }
                }
              },
              onPanEnd: (details) {
                _lock = false;
              },
              child: Transform.rotate(
                angle: -_currentBead * _anglePerBead,
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.58,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Sebha.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 90),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Text(
                  '${_currentBead + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
