// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:husbh_app/main.dart';
import '../../widgets/next_button.dart';
import '../../widgets/option_card.dart';
import 'divisionResultScreen.dart';
import 'dart:async';
import '../QuizButtonIcon.dart';
import 'package:husbh_app/screens/QuizButtonIcon.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'division_video.dart';
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
  final int numOfLeval1Questions = 4; //الآحاد
  final int numOfLeval2Questions = 4; //العشرات
  final int numOfLeval3Questions = 3; //المئات
  List<dynamic> Xx = [];
  List<dynamic> Yy = [];
  var  Level1Score = 0;
  var  Level2Score= 0;
  var  Level3Score = 0;
  bool isPressed = false;

// //Array of numbers to convert from english to arabic
//   var numberMap = {
//     0: '۰',
//     1: '۱',
//     2: '۲',
//     3: '۳',
//     4: '٤',
//     5: '٥',
//     6: '٦',
//     7: '٧',
//     8: '۸',
//     9: '۹'
//   };

  String arabicX = "";
  String arabicY = "";
 var divisionLeval1=[2,5,10,0];
 
  var divisionLeval2=[1,3,4,6];
   var divisionLeval3=[7,8,9];
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

  void initState() {
    TextDirection.rtl;
    super.initState();

    for (var i = 1; i < numOfLeval1Questions + 1; i++) {
      ans = [];
      x = divisionLeval1[Random().nextInt(divisionLeval1.length)] ;
      y = Random().nextInt(99)+1;
      
      Xx.add(x);
      for(var g = 1; g < 100; i++)
      {if (x % y==0)
      {Yy.add(y);
      break;}
      else
       y = Random().nextInt(99)+1;}

      textDirection:
      TextDirection.rtl;
      qustions.add(convertToArabic());
      answers.add(x ~/ y);
      ansData = [
        convertOptionsToArabic(x ~/y),
        convertOptionsToArabic(x ~/ y + 1),
        convertOptionsToArabic(x  ~/ y + 7),
        convertOptionsToArabic(x ~/ y + 3),
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }

    for (var i = 1; i < numOfLeval2Questions + 1; i++) {
      ans = [];
      x = divisionLeval2[Random().nextInt(divisionLeval2.length)] ;
      y = Random().nextInt(9)+1;
      Xx.add(x);
      Yy.add(y);

      textDirection:
      TextDirection.rtl;
      qustions.add(convertToArabic());
      answers.add(x ~/y);
      ansData = [
        convertOptionsToArabic(x ~/ y),
        convertOptionsToArabic(x ~/ y + 2),
        convertOptionsToArabic(x ~/ y + 9),
        convertOptionsToArabic(x ~/ y + 5),
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }

    for (var i = 1; i < numOfLeval3Questions + 1; i++) {
      ans = [];
      x = divisionLeval3[Random().nextInt(divisionLeval3.length)] ;
      y = Random().nextInt(9)+1;
      Xx.add(x);
      Yy.add(y);

      textDirection:
      TextDirection.rtl;
      qustions.add(convertToArabic());
      answers.add(x ~/ y);
      ansData = [
        convertOptionsToArabic(x ~/ y),
        convertOptionsToArabic(x ~/y + 1),
        convertOptionsToArabic(x ~/y + 3),
        convertOptionsToArabic(x ~/y + 6),
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

   
    return "$arabicX " + "÷" + " $arabicY";
  }

  String convertOptionsToArabic(int num) {
    arabicX = arabicNumber.convert(num);

   
    return "$arabicX";
  }

  _changeQuestion(ans) {
    userAnswer.add(ans);

    if (j + 1 >= 11) {
      for (var i = 0; i < 4; i++) {
        if (userAnswer[i].toString() ==
            convertOptionsToArabic(answers[i]).toString()) {
          Level1Score++;
        }
      }

      // var Tensscore = 0;
      for (var i = 4; i < 8; i++) {
        if (userAnswer[i].toString() ==
            convertOptionsToArabic(answers[i]).toString()) {
          Level2Score++;
        }
      }

      // var Hundredscore = 0;
      for (var i = 8; i < 11; i++) {
        if (userAnswer[i].toString() ==
            convertOptionsToArabic(answers[i]).toString()) {
          Level3Score++;
        }
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => divisionResultScreen(
              maxLevel1Score: numOfLeval1Questions,
              maxLevel2Score: numOfLeval2Questions,
              maxLevel3Score: numOfLeval3Questions,
              Level1Score: Level1Score,
              Level2Score: Level2Score,
              Level3Score: Level3Score,
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
//returns images for value x
  Widget _printImageX(xValue) {
    //if value = 0 show its image
    if (x == 0) {
      return Center(
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Image.asset(
              //Xhouse
              objects[2],
              width: width * 0.13,
              height: height * 0.12,
            )
          ],
        ),
      );
    }
    //else show the 
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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  SizedBox(
                    height: 55,
                    width: 100,
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
                  SizedBox(height: 20, width: 20),
                  SizedBox(
                    height: 55,
                    width: 100,
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
                  SizedBox(height: 20, width: 20),
                  SizedBox(
                    height: 55,
                    width: 100,
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
                  SizedBox(height: 20, width: 20),
                  SizedBox(
                    height: 55,
                    width: 100,
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
                  SizedBox(height: 20, width: 20),
                ]),
              ])
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.topRight,
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: <Widget>[
             
                NextButton(nextQuestion:nextQuestion)
            ])),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ImagesUnderQuestion(int j) {
                      
  if (j < 11) {
      return SizedBox(
        height: 200,
        child: Align(
          alignment: Alignment.center,
          child: Wrap(
            children: [
              SizedBox(width: 300, child: _printImageY(Yy[j])),
              const Text(
                ' ÷ ',
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
