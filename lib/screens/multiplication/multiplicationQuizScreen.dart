import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:husbh_app/main.dart';
import '../../widgets/option_card.dart';
import 'multiplicationResultScreen.dart';
import 'dart:async';
import '../QuizButtonIcon.dart';
import 'package:husbh_app/screens/QuizButtonIcon.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'multiplication_video.dart';

class multiplicationQuizScreen extends StatefulWidget {
  const multiplicationQuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    TextDirection.rtl;
    return Container();
  }
}

class _QuizScreenState extends State<multiplicationQuizScreen> {
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
  final int numOfLevel1Questions = 4; //(0,1,2,3)
  final int numOfLevel2Questions = 4; //(4,5,6,7)
  final int numOfLevel3Questions = 4; //(8,9,10)
  List<dynamic> Xx = [];
  List<dynamic> Yy = [];
  var Level1Score = 0; //(0,1,2,3)
  var Level2Score = 0; //(4,5,6,7)
  var Level3Score = 0; //(8,9,10)
  bool isPressed = false;

  String arabicX = "";
  String arabicY = "";

  var x = Random().nextInt(9) + 1;
  var y = Random().nextInt(9) + 1;

  bool getIsPressed() {
    return isPressed;
  }

  get startColor => null;

  get endColor => null;

  get borderColor => null;

  get color => null;

  get onPressed => null;

  get states => null;

  void initState() {
    TextDirection.rtl;
    super.initState();
//(0,1,2,3)
    for (var i = 1; i < numOfLevel1Questions + 1; i++) {
      ans = [];
      x = Random().nextInt(4) + 1;
      y = Random().nextInt(4) + 1;
      Xx.add(x);
      Yy.add(y);

      TextDirection.rtl;
      qustions.add(convertToArabic());
      answers.add(x * y);
      ansData = [
        convertOptionsToArabic(x * y),
        convertOptionsToArabic(x * y + 1),
        convertOptionsToArabic(x * y + 7),
        convertOptionsToArabic(x * y + 3),
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }
//(4,5,6,7)
    for (var i = 1; i < numOfLevel2Questions + 1; i++) {
      ans = [];
      x = Random().nextInt(9) + 1;
      y = Random().nextInt(9) + 1;
      while (x > 3 && x < 8 || y > 3 && y < 8) {
        x = Random().nextInt(9) + 1;
        y = Random().nextInt(9) + 1;
      }

      TextDirection.rtl;
      qustions.add(convertToArabic());
      answers.add(x * y);
      ansData = [
        convertOptionsToArabic(x * y),
        convertOptionsToArabic(x * y + 2),
        convertOptionsToArabic(x * y + 9),
        convertOptionsToArabic(x * y + 5),
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }
//(8,9,10)
    for (var i = 1; i < numOfLevel3Questions + 1; i++) {
      ans = [];
      x = Random().nextInt(9);
      y = Random().nextInt(9);
      while (x > 7 && x < 11 || y > 7 && y < 11) {
        x = Random().nextInt(9);
        y = Random().nextInt(9);
      }

      TextDirection.rtl;
      qustions.add(convertToArabic());
      answers.add(x * y);
      ansData = [
        convertOptionsToArabic(x * y),
        convertOptionsToArabic(x * y + 1),
        convertOptionsToArabic(x * y + 3),
        convertOptionsToArabic(x * y + 6),
      ];

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

    return "$arabicX " + "×" + " $arabicY";
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
          Level1Score++;
        }
      }

      for (var i = 4; i < 8; i++) {
        if (userAnswer[i].toString() ==
            convertOptionsToArabic(answers[i]).toString()) {
          Level2Score++;
        }
      }

      for (var i = 8; i < 12; i++) {
        if (userAnswer[i].toString() ==
            convertOptionsToArabic(answers[i]).toString()) {
          Level3Score++;
        }
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => multiplicationResultScreen(
              maxLevel1Score: numOfLevel1Questions,
              maxLevel2Score: numOfLevel2Questions,
              maxLevel3Score: numOfLevel3Questions,
              level1score: Level1Score,
              level2score: Level2Score,
              level3score: Level3Score,
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
    'images/egg.png',
    'images/egg2.png',
    'images/Xegg.png',
    'images/Xegg2.png',
  ];
//returns images for value x
  Widget _printImageX(xValue) {
    //if value = 0 show its image
    if (x == 0) {
      return Center(
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Image.asset(
              //xgreen
              objects[2],
              width: width * 0.13,
              height: height * 0.12,
            )
          ],
        ),
      );
    }
    //else show the apples
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          for (var i = 0; i < xValue; i++)
            Image.asset(
              objects[0],
              width: width * 0.13,
              height: height * 0.12,
            )
        ],
      ),
    );
  }

//returns images for value y
  Widget _printImageY(yValue) {
    if (y == 0) {
      return Center(
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Image.asset(
              objects[3],
              width: width * 0.13,
              height: height * 0.12,
            )
          ],
        ),
      );
    }
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          for (var i = 0; i < yValue; i++)
            Image.asset(
              objects[1],
              width: width * 0.13,
              height: height * 0.12,
            )
        ],
      ),
    );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NiceButtons(
                        onTap: (finish) async {
                          changeColor();
                          await Future.delayed(const Duration(seconds: 1),
                              _changeQuestion(mcq[j][0].toString()));
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 90.0,
                        height: 60.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][0].toString())),
                    SizedBox(width: 30),
// >>>>>>>>>>>>>>>>>>>>second option on left >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                    NiceButtons(
                        onTap: (finish) async {
                          changeColor();
                          await Future.delayed(const Duration(seconds: 1),
                              _changeQuestion(mcq[j][1].toString()));
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 90.0,
                        height: 60.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][1].toString())),
                    SizedBox(width: 30),
                    // >>>>>>>>>>>>>>>>>>>>third  option on left >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                    NiceButtons(
                        onTap: (finish) async {
                          changeColor();
                          await Future.delayed(const Duration(seconds: 1),
                              _changeQuestion(mcq[j][2].toString()));
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 90.0,
                        height: 60.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][2].toString())),
                    SizedBox(width: 30),
                    // >>>>>>>>>>>>>>>>>>>>forth  option on left >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                    NiceButtons(
                        onTap: (finish) async {
                          changeColor();
                          await Future.delayed(const Duration(seconds: 1),
                              _changeQuestion(mcq[j][3].toString()));
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 90.0,
                        height: 60.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][3].toString())),
                  ],
                ),
              ])
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ImagesUnderQuestion(int j) {
    if (j == 0 || j == 1 || j == 2 || j == 3) {
      return SizedBox(
        height: 200,
        child: Align(
          alignment: Alignment.center,
          child: Wrap(
            children: [
              SizedBox(width: 300, child: _printImageY(Yy[j])),
              const Text(
                ' × ',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 300, child: _printImageX(Xx[j])),
            ],
          ),
        ),
      );
    }
  }
}
