import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Bar extends StatelessWidget {
  double length;
  String label;
  double maxLength;
  Color color;

  final int _baseDurationMs = 1000;
  final double _maxElementWidth = 200;

  Bar(double length, String label, double maxLength, Color color) {
    this.length = length;
    this.label = label;
    this.maxLength = maxLength;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: (length * _baseDurationMs).round()),
      tween: Tween(begin: 0.0, end: length),
      builder: (context, animatedWidth) {
        print(animatedWidth);
        return Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 25,
                  width: animatedWidth * maxLength,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(7.0),
                    color: color,
                  ),
                ),
                Positioned(
                  left: 5.0,
                  top: 4.0,
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'RoRSquare',
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
