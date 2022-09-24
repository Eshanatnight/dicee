import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text("Dice"),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: const Size(88, 36), // might need to change this
    padding: const EdgeInsets.symmetric(horizontal: 16.0), // might need to change this
    shape: const RoundedRectangleBorder(  // might need to change this
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  void changeDiceFace()
  {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    setState(() {
                      changeDiceFace();
                    });
                  },
                  child: Image.asset("images/dice$leftDiceNumber.png")),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  setState(() {
                    changeDiceFace();
                  });
                },
                child: Image.asset(
                    "images/dice$rightDiceNumber.png"
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
