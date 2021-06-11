import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[400],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red[400],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                  onPressed: () {
                    setState(
                      () {
                        changeDiceFace();
                      },
                    );
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png')),
            ),
          ),
          //If you want the first widget to take twice as much space the second
          //widget takes use the flex functionality of Expanded class.
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      changeDiceFace();
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png')),
            ),
          ),
        ],
      ),
    );
  }
}
