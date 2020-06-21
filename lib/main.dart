import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildKey(color: Colors.red, musicNum: 1),
        buildKey(color: Colors.orange, musicNum: 2),
        buildKey(color: Colors.yellow, musicNum: 3),
        buildKey(color: Colors.teal, musicNum: 4),
        buildKey(color: Colors.green, musicNum: 5),
        buildKey(color: Colors.blue, musicNum: 6),
        buildKey(color: Colors.deepPurple, musicNum: 7),
      ],
    );
  }

  Expanded buildKey({Color color, int musicNum}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            player.play('note$musicNum.wav');
          });
        },
        child: Container(
          color: color,
          margin: EdgeInsets.symmetric(vertical: 8.0),
        ),
      ),
    );
  }
}
