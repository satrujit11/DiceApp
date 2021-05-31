import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 4,
          toolbarHeight: 45,
          title: Center(
            child: Text('Dice App',
                style: GoogleFonts.lato(
                  color: Colors.white,
                )),
          ),
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftdiceNum = 1, rightdiceNum = 1;
  void changeLeftDiceFace() {
    leftdiceNum = 1 + Random().nextInt(6);
  }

  void changeRightDiceFace() {
    rightdiceNum = 1 + Random().nextInt(6);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          changeLeftDiceFace();
                        });
                      },
                      child: Image.asset(
                        'images/dice$leftdiceNum.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          changeRightDiceFace();
                        });
                      },
                      child: Image.asset(
                        'images/dice$rightdiceNum.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                textColor: Colors.green,
                child: Text(
                  'Throw',
                ),
                color: Colors.white,
                elevation: 5,
                onPressed: () {
                  setState(() {
                    changeLeftDiceFace();
                    changeRightDiceFace();
                    while (leftdiceNum == rightdiceNum) {
                      changeRightDiceFace();
                    }
                    ;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
