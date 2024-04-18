
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red.shade600,
          centerTitle: true,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdiceNum=1;
  int rightDiceNum=1;

  void changeButton(){
    setState(() {
      leftdiceNum=Random().nextInt(5)+1;
      rightDiceNum=Random().nextInt(5)+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: (){
                changeButton();
                print('Left button is pressed');
                // leftdiceNum=3;
              },
              child: Image.asset('images/dice$leftdiceNum.png'),
            ),
          ),
          Expanded(
            child: TextButton(
                onPressed: (){
                  changeButton();
                  print('Right button is pressed');
                },
                child: Image.asset('images/dice$rightDiceNum.png')),
          ),
        ],
      ),
    );
  }
}



