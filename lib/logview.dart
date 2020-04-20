import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'log.dart';
import 'bar.dart';

class LogView extends StatefulWidget {
  LogView(this.log, {Key key, this.title}) : super(key: key);
  final String title;
  final Log log;

  @override
  LogViewState createState() => LogViewState();
}

class LogViewState extends State<LogView> {
  List<double> barLengths = new List<double>();

  void _findBarLengths() {

  }

  @override
  void initState() {
    super.initState();
    _findBarLengths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.log.gClass,
          style: TextStyle(color: Color(0xffddf2f4)),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: _buildLogData(),
      ),
    );
  }

  Widget _buildLogData() {
    double width = MediaQuery.of(context).size.width - 100;
    return Container(
      height: MediaQuery.of(context).size.height - 400,
      width: MediaQuery.of(context).size.width - 100,
      alignment: Alignment.topCenter,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(7.0),
        color: Color(0xff61486f),
      ),
      child: SizedBox.expand(
        child: Card(
          color: Color(0x00515354),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Row(children: <Widget>[
                Text(
                  widget.log.lclass,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xffffcc00),
                    fontFamily: 'RoRSquare',
                  ),
                ),
                Spacer(),
                Image.asset('assets/skull.png', scale: 5),
                Text(
                  'x' + widget.log.deaths.toString(),
                  style: TextStyle(
                    color: Color(0xffffcc00),
                    fontFamily: 'RoRSquare',
                  ),
                ),
              ]),
              Divider(thickness: 0.8),
              Text(
                'Kills',
                style: TextStyle(
                  color: Color(0xffffcc00),
                  fontFamily: 'RoRSquare',
                ),
              ),
              Bar(5, widget.log.kills.toString(), width - 50,
                  Color(0xffd64949)),
              Text(
                'Minion Kills',
                style: TextStyle(
                  color: Color(0xffffcc00),
                  fontFamily: 'RoRSquare',
                ),
              ),
              Bar(5, widget.log.gminionKills.toString(), width - 50,
                  Color(0xff94c1a1)),
              Text(
                'Damage Dealt',
                style: TextStyle(
                  color: Color(0xffffcc00),
                  fontFamily: 'RoRSquare',
                ),
              ),
              Bar(5, widget.log.damageDealt.toString(), width - 50,
                  Color(0xffd64949)),
              Text(
                'Minion Damage Dealt',
                style: TextStyle(
                  color: Color(0xffffcc00),
                  fontFamily: 'RoRSquare',
                ),
              ),
              Bar(5, widget.log.gminionDamageDealt.toString(), width - 50,
                  Color(0xff94c1a1)),
            ],
          ),
        ),
      ),
    );
  }
}
