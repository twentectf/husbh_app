import 'dart:io';
import 'package:flutter/material.dart';
import 'Questions.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import 'learn_page.dart';
import 'dart:math';

class Randomization extends StatefulWidget {
  const Randomization({Key? key}) : super(key: key);

  @override
  _RandomizationState createState() => _RandomizationState();
}

class _RandomizationState extends State<Randomization> {
  //////////////////////////////////////////////////////////////////
  get width => MediaQuery.of(context).size.width;
  get height => MediaQuery.of(context).size.height;

//Array of numbers to convert from english to arabic
  var numberMap = {
    0: '۰',
    1: '۱',
    2: '۲',
    3: '۳',
    4: '٤',
    5: '٥',
    6: '٦',
    7: '٧',
    8: '۸',
    9: '۹'
  };

  //wil have the two values in english
  var x = Random().nextInt(10);
  var y = Random().nextInt(10);
  //wil have the two values in arabic
  String arabicX = "";
  String arabicY = "";

  String convertToArabic() {
    if (x.toString().length == 1) {
      arabicX = numberMap[x].toString();
    }
    if (y.toString().length == 1) {
      arabicY = numberMap[y].toString();
    }

    var numberLengthX = x.toString().length;
    if (numberLengthX > 1) {
      var Xstring = x.toString();
      arabicX = Xstring;
      for (var i = 0; i < numberLengthX; i++) {
        var num = int.parse(Xstring[i]);
        arabicX = arabicX.replaceAll(num.toString(), numberMap[num]!);
      }
    }
    var numberLengthY = y.toString().length;
    if (numberLengthY > 1) {
      var Ystring = y.toString();
      arabicY = Ystring;
      for (var s = 0; s < numberLengthY; s++) {
        var num = int.parse(Ystring[s]);
        arabicY = arabicY.replaceAll(num.toString(), numberMap[num]!);
      }
    }
    return "$arabicY + $arabicX";
  }

//will be used later to randomize the first level & convert
  String randomizationFirstLevel() {
    while (x + y > 10) {
      x = Random().nextInt(10);
      y = Random().nextInt(10);
    }
    arabicX = numberMap[x].toString();
    arabicY = numberMap[y].toString();

    return "$arabicY + $arabicX";
  }

//objects for questions
  List<String> objects = [
    'images/GreenApple.png',
    'images/RedApple.png',
    'images/Xgreen.png',
    'images/Xred.png',
  ];

//returns images for value x
  Widget _printImageX(xValue) {
    //if value = 0 show its image
    if (x == 0) {
      return Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Image.asset(
            //xgreen
            objects[2],
            width: width * 0.13,
            height: height * 0.12,
          )
        ],
      );
    }
    //else show the apples
    return Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        for (var i = 0; i < xValue; i++)
          Image.asset(
            objects[0],
            width: width * 0.13,
            height: height * 0.12,
          )
      ],
    );
  }

//returns images for value y
  Widget _printImageY(yValue) {
    if (y == 0) {
      return Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Image.asset(
            objects[3],
            width: width * 0.13,
            height: height * 0.12,
          )
        ],
      );
    }
    return Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        for (var i = 0; i < yValue; i++)
          Image.asset(
            objects[1],
            width: width * 0.13,
            height: height * 0.12,
          )
      ],
    );
  }

//////////////////////////////////////////////////////////////////
  // ignore: prefer_final_fields
  List<Question> _questions = [
    Question(
      id: '1',
      title: '----- =   ٥   +   ٢',
      options: {'٤': false, '٥': false, '٢': false, '٧': true},
      image: 'assets/q1.png',
      // image: ccc,
    ),
    Question(
      id: '2',
      title: '----- =   ٨   +   ٣',
      options: {'٩': false, '٤': false, '١١': true, '٥': false},
      image: 'assets/q2.png',
    ),
    Question(
      id: '3',
      title: '',
      options: {'٥': true, '٩': false, '٨': false, '١١': false},
      image: 'assets/q33.png',
    ),
    Question(
      id: '4',
      title: '',
      options: {'٦': false, '١٠': true, '١٢': false, '٣': false},
      image: 'assets/q44.png',
    ),
    Question(
      id: '5',
      title: '',
      //=   ١٢٣   +   ٢٦١'
      options: {'٥٦': true, '٦٧': false, '٦٠': false, '٤١': false},
      image: 'assets/q55.png',
    ),
    Question(
      id: '6',
      title: '',
      //'=   ١٠٢   +   ١٣٣'v
      options: {'٩٠': false, '٧١': false, '٩٩': true, '٦٨': false},
      image: 'assets/q66.png',
    ),
  ];

//index of the question
  int index = 0;

// //it is false first since no buttons are pressed yet
  bool isPressed = false;

//Not used yet
  bool getIsPressed() {
    return isPressed;
  }

//to display next question
  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      setState(() {
        index++;
        isPressed = false;
      });
    }
  }

//navigates to learn page after thr last question is answered
  void lastQuestion() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => learn_page()));
  }

//returns the image of the current question
  String imageExists() {
    return _questions[index].image;
  }

//changes the color of the button
  void chnageColor() {
    setState(() {
      isPressed = true;
    });
  }

  //background method
  String imageName() {
    return objects[index];
  }

  Widget build(BuildContext context) {
    //////////////////////////////////////////////////////////////////
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // ignore: prefer_const_literals_to_create_immutables
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Wrap(
                    children: [
                      Text(
                        convertToArabic(),
                        style: TextStyle(
                          fontSize: 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Wrap(
                children: [
                  SizedBox(width: 300, child: _printImageY(y)),
                  const Text(
                    ' + ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 300, child: _printImageX(x)),
                ],
              ),
            ],
          ),
        ],
      ),
//////////////////////////////////////////////////////////////////
//for the Next button
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.topRight,
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: <Widget>[
              index < 5
                  ? NextButton(nextQuestion: nextQuestion)
                  : NextButton(nextQuestion: lastQuestion)
            ])),
      ),
    );
  }
}
