// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import '../../widgets/next_button.dart';
import '../../widgets/option_card.dart';
import 'divisionResultScreen.dart';
import 'dart:async';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:husbh_app/screens/division/divisionResultScreen.dart';

class divisionQuizScreen extends StatefulWidget {
  const divisionQuizScreen({Key? key}) : super(key: key);

  @override
  _divisionQuizScreenState createState() => _divisionQuizScreenState();

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    TextDirection.rtl;
    return Container();
  }
}

class _divisionQuizScreenState extends State<divisionQuizScreen> {
  get width => MediaQuery.of(context).size.width;
  get height => MediaQuery.of(context).size.height;

  ArabicNumbers arabicNumber = ArabicNumbers();

  List qustions = [];
  List answers = [];
  bool isMarked = false;
  List<List<dynamic>> mcq = [];
  List userAnswer = [];
  var ansData;
  List<dynamic> ans = [];
  var j = 0;
  final int numOfLeval1QuestionsDiv = 4;
  final int numOfLeval2QuestionsDiv = 4;
  final int numOfLeval3QuestionsDiv = 4;

  List<dynamic> Xx = [];

  List<dynamic> Yy = [];
  var divLevel1Score = 0;
  var divLevel2Score = 0;
  var divLevel3Score = 0;
  bool isPressed = false;

  String arabicX = "";
  String arabicY = "";

  var divisionLeval1 = [1, 2, 3, 4];
  var divisionLeval2 = [5, 6, 7];
  var divisionLeval3 = [8, 9, 10];

  var x = Random().nextInt(9) + 1;
  var y = Random().nextInt(9) + 1;

  bool getIsPressed() {
    return isPressed;
  }

  //get isPressed => null;

  // get onPressed => null;

  get startColor => null;

  get endColor => null;

  get borderColor => null;

  get color => null;

  get onPressed => null;

  get states => null;

//returns the value for x
  int getX(QuestionNumber) {
    if (QuestionNumber == 0) {
      x = 0;
    } else if (QuestionNumber == 1) {
      x = 1;
    } else if (QuestionNumber == 2) {
      x = 2;
    } else if (QuestionNumber == 3) {
      x = 3;
    } else if (QuestionNumber == 4) {
      x = 4;
    } else if (QuestionNumber == 5) {
      x = 5;
    } else if (QuestionNumber == 6) {
      x = 6;
    } else if (QuestionNumber == 7) {
      x = 7;
    } else if (QuestionNumber == 8) {
      x = 8;
    } else if (QuestionNumber == 9) {
      x = 9;
    } else if (QuestionNumber == 10) {
      x = 10;
    } else if (QuestionNumber == 11) {
      x = Random().nextInt(2) +
          8; //becaue in the third level we only have 3 values (8-9-10) and the fourth question will either repeat (8-9-10)
    }
    return x;
  }

  void initState() {
    TextDirection.rtl;
    super.initState();

    for (var i = 1; i < numOfLeval1QuestionsDiv + 1; i++) {
      ans = [];
      x = getX(i - 1);
      if (x==0){
      y = Random().nextInt(11) + 1;
<<<<<<< HEAD
      while (x % y != 0 ) y = Random().nextInt(11) + 1;}
      else if (x==1|| x==2||x==3)
      {
      y = Random().nextInt(14) + 1;
      while ( y % x!=0 || x % y != 0) y = Random().nextInt(14) + 1;}
=======
      while (x % y != 0) {
        y = Random().nextInt(11) + 1;
      }
>>>>>>> 52385cfa09c3a4b3db5a1534ae7b3d4665a9844e

      Xx.add(x);
      Yy.add(y);

      textDirection:
      TextDirection.rtl;
      qustions.add(convertToArabic());
      if (x == 0) {
        answers.add(x ~/ y);
        ansData = [
          convertOptionsToArabic(x ~/ y),
          convertOptionsToArabic(x ~/ y + 1),
          convertOptionsToArabic(x ~/ y + 7),
          convertOptionsToArabic(x ~/ y + 3),
        ];
      } else if (x > y) {
        answers.add(x ~/ y);
        ansData = [
          convertOptionsToArabic(x ~/ y),
          convertOptionsToArabic(x ~/ y + 1),
          convertOptionsToArabic(x ~/ y + 7),
          convertOptionsToArabic(x ~/ y + 3),
        ];
      } else {
        answers.add(y ~/ x);
        ansData = [
          convertOptionsToArabic(y ~/ x),
          convertOptionsToArabic(y ~/ x + 1),
          convertOptionsToArabic(y ~/ x + 7),
          convertOptionsToArabic(y ~/ x + 3),
        ];
      }

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }

    for (var i = 1; i < numOfLeval2QuestionsDiv + 1; i++) {
      ans = [];
      x = getX(i + 3);
      // x = Random().nextInt(9) + 1;
     
     if (x==4)
      {y = Random().nextInt(39) + 1;
      while ( y % x != 0){ y = Random().nextInt(39) + 1;}}

<<<<<<< HEAD
       else if (x==5)
      {y = Random().nextInt(49) + 1;
      while ( y % x != 0){ y = Random().nextInt(49) + 1;}}
       else if (x==6)
      {y = Random().nextInt(59) + 1;
      while ( y % x != 0){ y = Random().nextInt(59) + 1;}}
      else if (x==7)
      {y = Random().nextInt(69) + 1;
      while ( y % x != 0){ y = Random().nextInt(69) + 1;}}

       Xx.add(x);

      Yy.add(y);
    

=======
>>>>>>> 52385cfa09c3a4b3db5a1534ae7b3d4665a9844e
      textDirection:
      TextDirection.rtl;
      qustions.add(convertToArabic());
      if (x > y) {
        answers.add(x ~/ y);
        ansData = [
          convertOptionsToArabic(x ~/ y),
          convertOptionsToArabic(x ~/ y + 2),
          convertOptionsToArabic(x ~/ y + 9),
          convertOptionsToArabic(x ~/ y + 5),
        ];
      } else {
        answers.add(y ~/ x);
        ansData = [
          convertOptionsToArabic(y ~/ x),
          convertOptionsToArabic(y ~/ x + 2),
          convertOptionsToArabic(y ~/ x + 9),
          convertOptionsToArabic(y ~/ x + 5),
        ];
      }

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }

    for (var i = 1; i < numOfLeval3QuestionsDiv + 1; i++) {
      ans = [];
      x = getX(i + 7);
<<<<<<< HEAD
     
      if (x== 8)
      {y = Random().nextInt(79) + 1;
      while ( y % x != 0){ y = Random().nextInt(79) + 1;}}

       else if (x==9)
      {y = Random().nextInt(89) + 1;
      while ( y % x != 0){ y = Random().nextInt(89) + 1;}}
       else if (x==10)
      {y = Random().nextInt(99) + 1;
      while ( y % x != 0){ y = Random().nextInt(99) + 1;}}

       Xx.add(x);

      Yy.add(y);
    
=======
      // x = Random().nextInt(9) + 1;
      y = Random().nextInt(99) + 1;
      while (x % y != 0) y = Random().nextInt(99) + 1;
>>>>>>> 52385cfa09c3a4b3db5a1534ae7b3d4665a9844e

      textDirection:
      TextDirection.rtl;
      qustions.add(convertToArabic());
      if (x > y) {
        answers.add(x ~/ y);
        ansData = [
          convertOptionsToArabic(x ~/ y),
          convertOptionsToArabic(x ~/ y + 1),
          convertOptionsToArabic(x ~/ y + 3),
          convertOptionsToArabic(x ~/ y + 6),
        ];
      } else {
        answers.add(y ~/ x);
        ansData = [
          convertOptionsToArabic(y ~/ x),
          convertOptionsToArabic(y ~/ x + 1),
          convertOptionsToArabic(y ~/ x + 3),
          convertOptionsToArabic(y ~/ x + 6),
        ];
      }

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }
  }

  String convertToArabic() {
    arabicX = arabicNumber.convert(x);
    arabicY = arabicNumber.convert(y);
<<<<<<< HEAD
    if (x>= y) {
      return "$arabicX  " + "÷" + "  $arabicY ";
    } else if (x < y) {
      return "$arabicY  " + "÷" + "  $arabicX ";
    }
    else return "  ";
=======

    return "$arabicX  " + "÷" + "  $arabicY ";
>>>>>>> 52385cfa09c3a4b3db5a1534ae7b3d4665a9844e
  }

  String convertOptionsToArabic(int num) {
    arabicX = arabicNumber.convert(num);

    return "$arabicX";
  }

  _changeQuestion(ans) {
    userAnswer.add(ans);

    if (j + 1 >= 12) {
      for (var i = 0; i < 4; i++) {
        if (userAnswer[i].toString() ==
            convertOptionsToArabic(answers[i]).toString()) {
          divLevel1Score++;
        }
      }

      for (var i = 4; i < 8; i++) {
        if (userAnswer[i].toString() ==
            convertOptionsToArabic(answers[i]).toString()) {
          divLevel2Score++;
        }
      }

      // var Hundredscore = 0;
      for (var i = 8; i < 12; i++) {
        if (userAnswer[i].toString() ==
            convertOptionsToArabic(answers[i]).toString()) {
          divLevel3Score++;
        }
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => divisionResultScreen(
              maxLevel1ScoreDiv: numOfLeval1QuestionsDiv,
              maxLevel2ScoreDiv: numOfLeval2QuestionsDiv,
              maxLevel3ScoreDiv: numOfLeval3QuestionsDiv,
              divlevel1Score: divLevel1Score,
              divlevel2Score: divLevel2Score,
              divlevel3Score: divLevel3Score,
              answers: answers,
              qustions: qustions,
              userAnswer: userAnswer),
        ),
      );
    } else {
      setState(() {
        ++j;
        isMarked = false;
        isPressed = false;
      });
    }
  }

  //objects for questions
  List<String> objects = [
    'images/house.png',
    'images/bird.png',
    'images/Xhouse.png',
    'images/Xbird.png',
  ];

  Widget _printImageY(xValue, yValue) {
    //if value = 0 show nothing
    if (xValue == 0) {
      return Center(
        child: SizedBox(height: height * 0.0001, child: Text("")),
      );
    }
    //else show the birds
    return Center(
      child: Wrap(
        // direction: Axis.horizontal,
        children: <Widget>[
          // for (var i = 0; i < xValue; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              for (var i = 0; i < xValue; i++)
                Image.asset(
                  objects[1],
                  width: width * 0.09,
                  height: height * 0.15,
                ),
            ],
          )
        ],
      ),
    );
  }

  void nextQuestion() {
    _changeQuestion('٠');
  }

  void changeColor() {
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    textDirection:
    TextDirection.rtl;
    return Scaffold(
      body: Stack(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/farm.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(qustions[j],
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.lightBlue,
                          fontFamily: "ReadexPro-Regular",
                          fontSize:
                              MediaQuery.of(context).size.width > 500 ? 45 : 20,
                          fontWeight: FontWeight.bold)),
                ),
                ImagesUnderQuestion(j),
                // SizedBox(
                //   height: height * 0.14,
                // ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  SizedBox(
                    height: height * 0.155,
                    width: width * 0.13,
                    child: OptionCard(
                        option: mcq[j][0].toString(),
                        color: isPressed
                            ? (mcq[j][0].toString() ==
                                    convertOptionsToArabic(answers[j])
                                        .toString())
                                ? const Color.fromARGB(
                                    255, 50, 132, 9) //correct
                                : const Color.fromRGBO(
                                    218, 39, 39, 1) //incorrect
                            : const Color(0xFF3489e9),
                        onTap: () async {
                          changeColor();
                          //await
                          await Future.delayed(const Duration(seconds: 2), () {
                            _changeQuestion(mcq[j][0].toString());
                          });
                        }),
                  ),
                  SizedBox(height: height * 0.20, width: width * 0.03),
                  SizedBox(
                    height: height * 0.155,
                    width: width * 0.13,
                    child: OptionCard(
                        option: mcq[j][1].toString(),
                        color: isPressed
                            ? (mcq[j][1].toString() ==
                                    convertOptionsToArabic(answers[j])
                                        .toString())
                                ? const Color.fromARGB(
                                    255, 50, 132, 9) //correct
                                : const Color.fromRGBO(
                                    218, 39, 39, 1) //incorrect
                            : const Color(0xFF3489e9),
                        onTap: () async {
                          changeColor();
                          //await
                          await Future.delayed(const Duration(seconds: 2), () {
                            _changeQuestion(mcq[j][1].toString());
                          });
                        }),
                  ),
                  SizedBox(height: height * 0.20, width: width * 0.03),
                  SizedBox(
                    height: height * 0.155,
                    width: width * 0.13,
                    child: OptionCard(
                        option: mcq[j][2].toString(),
                        color: isPressed
                            ? (mcq[j][2].toString() ==
                                    convertOptionsToArabic(answers[j])
                                        .toString())
                                ? const Color.fromARGB(
                                    255, 50, 132, 9) //correct
                                : const Color.fromRGBO(
                                    218, 39, 39, 1) //incorrect
                            : const Color(0xFF3489e9),
                        onTap: () async {
                          changeColor();
                          //await
                          await Future.delayed(const Duration(seconds: 2), () {
                            _changeQuestion(mcq[j][2].toString());
                          });
                        }),
                  ),
                  SizedBox(height: height * 0.20, width: width * 0.03),
                  SizedBox(
                    height: height * 0.155,
                    width: width * 0.13,
                    child: OptionCard(
                        option: mcq[j][3].toString(),
                        color: isPressed
                            ? (mcq[j][3].toString() ==
                                    convertOptionsToArabic(answers[j])
                                        .toString())
                                ? const Color.fromARGB(
                                    255, 50, 132, 9) //correct
                                : const Color.fromRGBO(
                                    218, 39, 39, 1) //incorrect
                            : const Color(0xFF3489e9),
                        onTap: () async {
                          changeColor();
                          //await
                          await Future.delayed(const Duration(seconds: 2), () {
                            _changeQuestion(mcq[j][3].toString());
                          });
                        }),
                  ),
                  SizedBox(height: height * 0.20, width: width * 0.03),
                ]),
              ])
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.topRight,
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
                children: <Widget>[NextButton(nextQuestion: nextQuestion)])),
      ),
    );
  }

  String strReturned() {
    String str = "";
    if (qustions[j].toString().substring(4, 5) == "÷") {
      str = qustions[j].toString().substring(5);
    } else {
      str = qustions[j].toString().substring(4);
    }
    return str;
  }

  // ignore: non_constant_identifier_names
  ImagesUnderQuestion(int j) {
    // if (j < 11) {
    if (j == 0 || j == 1 || j == 2 || j == 3) {
      return Expanded(
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: <Widget>[
              new Positioned(
                top: 1,
                // left: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      // height: height * 0.90,
                      child: Expanded(
                        // flex: 2,
                        child: Image.asset(
                          'images/birdHousee.png',
                          height: height * 0.60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: new Positioned(
                  top: 80,
                  left: 285,
                  child: _printImageY(Xx[j], Yy[j]),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        height: height * 0.56,
        child: Column(
          children: [
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.37,
                            // height: height * 0.2,
                            child: Text(
                              "  ",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Column(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: width * 0.05,
                                  height: height * 0.55,
                                  child: Text(
                                    strReturned(),
                                    // qustions[j].toString().substring(4),
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 48.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.15,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: width * 0.23,
                                child: Text(
                                  qustions[j].toString().substring(0, 2),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 48.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/division.png',
                      height: height * 0.55,
                      width: width * 0.38,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
